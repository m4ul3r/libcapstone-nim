## The guards against a Capstone the bindings were not generated for. Each
## case builds a small program in a controlled environment and checks that the
## build, or the program, stops with the right diagnosis.

import std/[os, osproc, strtabs, strutils, tempfiles, unittest]
import libcapstone

const
  nimExe = getCurrentCompilerExe()
  srcDir = currentSourcePath().parentDir.parentDir / "src"

when defined(posix):
  let
    work = createTempDir("libcapstone_guards_", "")
    probe = work / "probe.nim"
    fakeBin = work / "bin"
  createDir(fakeBin)
  writeFile(probe, """
import libcapstone
var handle: csh
echo cs_open(CS_ARCH_X86, CS_MODE_64, addr handle), " handle=", handle
""")

  proc fakePkgConfig(script: string) =
    ## Makes a `pkg-config` out of `script` for builds with `fake = true`.
    let path = fakeBin / "pkg-config"
    writeFile(path, "#!/bin/sh\n" & script & "\n")
    setFilePermissions(path, {fpUserRead, fpUserWrite, fpUserExec})

  proc fakeVersion(version: string) =
    fakePkgConfig("case \"$1\" in --modversion) echo " & version &
                  ";; --libs) echo -lcapstone;; --cflags) echo;; esac")

  type Stage = enum
    nimOnly  ## stop after Nim's own checks
    compileC ## also run the C compiler
    link     ## produce `work/probe`

  proc build(args: openArray[string] = []; fake = true;
             stage = nimOnly): tuple[output: string; ok: bool] =
    var cmd = quoteShellCommand([nimExe, "c", "--hints:off",
      (case stage
       of nimOnly: "--compileOnly"
       of compileC: "--noLinking"
       of link: "-o:" & work / "probe"),
      "--nimcache:" & work / "cache", "-p:" & srcDir])
    for arg in args: cmd.add " " & quoteShell(arg)
    cmd.add " " & quoteShell(probe)
    let env = newStringTable(modeCaseSensitive)
    for key, value in envPairs(): env[key] = value
    if fake: env["PATH"] = fakeBin & PathSep & getEnv("PATH")
    let (output, exitCode) = execCmdEx(cmd, env = env)
    (output, exitCode == 0)

  proc refusal(args: openArray[string] = []; fake = true; stage = nimOnly): string =
    ## The compiler output of a build that must fail.
    let (output, ok) = build(args, fake, stage)
    check not ok
    output

  suite "build-time guards":
    test "a Capstone newer than the bindings is refused":
      fakeVersion("6.0.0")
      check "Capstone 6.0.0 is not supported" in refusal()

    test "a Capstone older than the bindings is refused":
      fakeVersion("3.0.5")
      check "Capstone 3.0.5 is not supported" in refusal()

    test "Capstone 5.0.1, which numbers operand types differently, is refused":
      fakeVersion("5.0.1")
      check "5.0.2 or later" in refusal()

    test "a missing Capstone is diagnosed with an install hint":
      fakePkgConfig("echo 'Package capstone was not found' >&2; exit 1")
      let output = refusal()
      check "`pkg-config --libs capstone` failed" in output
      check "Package capstone was not found" in output
      check "libcapstone-dev" in output

    test "explicit linker flags need the major version":
      check "-d:capstoneLibs also needs -d:capstoneMajor" in
        refusal(["-d:capstoneLibs=-lcapstone"])

    test "a major version that contradicts pkg-config is refused":
      fakeVersion("4.0.2")
      check "-d:capstoneMajor=9 contradicts pkg-config" in refusal(["-d:capstoneMajor=9"])

    test "headers whose layout differs from the bindings stop the C compiler":
      # Same version number, different `cs_insn`: what Capstone 6 alphas do.
      let
        headers = work / "include"
        realFlags = execCmdEx("pkg-config --cflags capstone").output.strip
      createDir(headers)
      writeFile(headers / "capstone.h", """
#define cs_insn lcn_real_cs_insn
#include_next <capstone.h>
#undef cs_insn
typedef struct { lcn_real_cs_insn real; char grown[8]; } cs_insn;
""")
      check "cs_insn layout differs from the Nim bindings" in
        refusal(["-d:capstoneCflags=-I" & headers & " " & realFlags], fake = false, stage = compileC)

  suite "run-time guard":
    test "cs_open refuses a library of another version than the bindings":
      # Bindings for the other supported major, linked against the installed library.
      let
        otherMajor = if CS_API_MAJOR == 4: 5 else: 4
        libs = execCmdEx("pkg-config --libs capstone").output.strip
        (output, ok) = build(["-d:capstoneLibs=" & libs, "-d:capstoneMajor=" & $otherMajor],
                             fake = false, stage = link)
      require ok
      check output.strip == ""
      check execCmdEx(quoteShell(work / "probe")).output.strip == "CS_ERR_VERSION handle=0"

  removeDir(work)
