## Every struct and union of the bindings against the layout clang computes
## from the installed Capstone headers: size, alignment and the offset of each
## leaf field in declaration order. This is what a bad regeneration would get
## wrong. Needs `clang`; skipped without it.

import std/[macros, os, osproc, strutils, tables, tempfiles, unittest]
import libcapstone

type Layout = object
  size, align: int
  offsets: seq[int] ## Leaf fields, in declaration order; arrays count as one leaf.

proc addLeaves[T](record: var T; base: pointer; offsets: var seq[int]) =
  for field in fields(record):
    when field is object:
      addLeaves(field, base, offsets)
    else:
      offsets.add int(cast[uint](addr field) - cast[uint](base))

proc layoutOf(T: typedesc): Layout =
  var record: T
  result = Layout(size: sizeof(T), align: alignof(T))
  addLeaves(record, addr record, result.offsets)

const generated = staticRead("../src/libcapstone/gen_v" & $CS_API_MAJOR & ".nim")

macro nimLayouts(): untyped =
  ## A table from C tag ("struct cs_insn") to `layoutOf` the Nim type, for
  ## every record the generated module declares.
  result = newStmtList()
  let table = genSym(nskVar, "layouts")
  result.add quote do:
    var `table`: Table[string, Layout]
  for line in generated.splitLines:
    let decl = line.strip
    if not decl.endsWith("= object"): continue
    let name = decl[0 ..< decl.find('*')]
    if name.endsWith("_t"): continue # an anonymous nested type; it has no C tag
    let
      split = name.find('_')
      tag = name[0 ..< split] & " " & name[split + 1 .. ^1] # struct_cs_insn -> struct cs_insn
      # `raw` replaces this one by a hand-written declaration.
      nimType = ident(if name == "struct_cs_opt_mem": "cs_opt_mem" else: name)
    result.add quote do:
      `table`[`tag`] = layoutOf(`nimType`)
  result.add table

proc headerTags(includeDir: string): seq[string] =
  ## The tags of all records the Capstone headers define, read from the headers.
  for file in walkFiles(includeDir / "*.h"):
    for line in lines(file):
      var decl = line.strip
      decl.removePrefix("typedef ")
      if decl.endsWith("{") and (decl.startsWith("struct ") or decl.startsWith("union ")):
        let words = decl.splitWhitespace
        if words.len == 3: result.add words[0] & " " & words[1]

proc clangLayouts(tags: seq[string]; cflags: string): Table[string, Layout] =
  let dir = createTempDir("libcapstone_layout_", "")
  defer: removeDir(dir)
  var source = "#include <capstone.h>\nunsigned long total(void) { return 0"
  for tag in tags: source.add " + sizeof(" & tag & ")"
  source.add "; }\n"
  writeFile(dir / "layout.c", source)
  let (dump, exitCode) = execCmdEx("clang " & cflags &
    " -fsyntax-only -Xclang -fdump-record-layouts " & quoteShell(dir / "layout.c"))
  doAssert exitCode == 0, dump
  for record in dump.split("*** Dumping AST Record Layout"):
    # "       16 |   uint16_t size": offset, then the field indented by nesting depth.
    var
      tag = ""
      layout: Layout
      previousDepth = -1
      previousOffset = 0
    for line in record.splitLines:
      let bar = line.find('|')
      if bar < 0: continue
      let text = line[bar + 1 .. ^1]
      if text.strip.startsWith("[sizeof="):
        let numbers = text.strip(chars = {' ', '[', ']'}).split(", ")
        layout.size = parseInt(numbers[0].split('=')[1])
        layout.align = parseInt(numbers[1].split('=')[1])
        continue
      let depth = text.len - text.strip(trailing = false).len
      if tag.len == 0:
        tag = text.strip
      else:
        # The previous line was a leaf unless this one is nested inside it.
        if previousDepth >= 0 and depth <= previousDepth: layout.offsets.add previousOffset
        previousDepth = depth
        previousOffset = parseInt(line[0 ..< bar].strip)
    if previousDepth >= 0: layout.offsets.add previousOffset
    if tag.len > 0: result[tag] = layout

test "struct layouts match the Capstone headers":
  if findExe("clang").len == 0:
    skip()
  else:
    let
      cflags = execCmdEx("pkg-config --cflags capstone").output.strip
      includeDir = execCmdEx("pkg-config --cflags-only-I capstone").output.splitWhitespace[0][2 .. ^1]
      tags = headerTags(includeDir)
      expected = clangLayouts(tags, cflags)
      actual = nimLayouts()
    require tags.len > 0
    for tag in tags:
      checkpoint tag
      check tag in actual
      if tag in actual:
        check actual[tag] == expected[tag]
