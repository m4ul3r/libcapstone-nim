## The hand-written constants in `libcapstone/cmacros.nim` against the macros
## of the installed Capstone headers, evaluated by the C compiler.

import std/[macros, os, osproc, strutils, tables, tempfiles, unittest]
import libcapstone

const handWritten = staticRead("../src/libcapstone/cmacros.nim")

macro nimValues(): untyped =
  ## A table from name to value for every exported constant in `cmacros.nim`.
  result = newStmtList()
  let table = genSym(nskVar, "values")
  result.add quote do:
    var `table`: Table[string, uint64]
  for line in handWritten.splitLines:
    let decl = line.strip
    let star = decl.find("* = ")
    if star <= 0 or not line.startsWith("  ") or decl.startsWith("template") or
        decl.startsWith("func"):
      continue
    let name = decl[0 ..< star]
    let value = ident(name)
    result.add quote do:
      `table`[`name`] = uint64(`value`)
  result.add table

proc headerValues(): Table[string, uint64] =
  ## Every `X86_EFLAGS_*` / `X86_FPU_FLAGS_*` macro in the installed `x86.h`
  ## plus the `cs_support` queries, as the C compiler evaluates them.
  let
    cflags = execCmdEx("pkg-config --cflags capstone").output.strip
    includeDir = execCmdEx("pkg-config --cflags-only-I capstone").output.splitWhitespace[0][2 .. ^1]
    dir = createTempDir("libcapstone_macros_", "")
  defer: removeDir(dir)
  var names = @["CS_SUPPORT_DIET", "CS_SUPPORT_X86_REDUCE"]
  for line in lines(includeDir / "x86.h"):
    let words = line.splitWhitespace
    if words.len >= 3 and words[0] == "#define" and
        (words[1].startsWith("X86_EFLAGS_") or words[1].startsWith("X86_FPU_FLAGS_")):
      names.add words[1]
  var source = "#include <stdio.h>\n#include <capstone.h>\nint main(void) {\n"
  for name in names:
    source.add "  printf(\"" & name & " %llu\\n\", (unsigned long long)(" & name & "));\n"
  source.add "  return 0;\n}\n"
  writeFile(dir / "macros.c", source)
  let (log, exitCode) = execCmdEx("cc " & cflags & " -o " & quoteShell(dir / "macros") & " " &
                                  quoteShell(dir / "macros.c"))
  doAssert exitCode == 0, log
  for line in execCmdEx(quoteShell(dir / "macros")).output.splitLines:
    let words = line.splitWhitespace
    if words.len == 2: result[words[0]] = parseBiggestUInt(words[1])

test "hand-written macro constants equal the header's":
  let
    expected = headerValues()
    actual = nimValues()
  require expected.len > 2
  for name, value in expected:
    checkpoint name
    check name in actual
    if name in actual: check actual[name] == value
  # Nothing the headers no longer define.
  for name in actual.keys:
    checkpoint name
    check name in expected
