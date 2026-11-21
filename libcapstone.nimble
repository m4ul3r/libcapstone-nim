# Package

version       = "0.2.0"
author        = "m4ul3r"
description   = "Bindings for the Capstone disassembly framework: the C API and a small Nim API on top"
license       = "MIT"
srcDir        = "src"


# Dependencies

requires "nim >= 2.0.0"

# Capstone itself comes from the system; say how to get it after an install.
when defined(nimdistros):
  import distros
  if detectOs(Ubuntu) or detectOs(Debian):
    foreignDep "libcapstone-dev"
  elif detectOs(Fedora) or detectOs(CentOS) or detectOs(RedHat):
    foreignDep "capstone-devel"
  else:
    foreignDep "capstone"


# Tasks

task examples, "Build and run the examples":
  for name in ["basic", "x86_detail", "raw_api"]:
    exec "nim c -r --hints:off -p:src examples/" & name & ".nim"
  exec "nim c -r --hints:off -p:src examples/cstool.nim -d x64 \"55 48 89 e5 06 e8 00 00 00 00 c3\" 0x1000"

task docs, "Generate the API documentation into htmldocs/":
  exec "nim doc --project --index:on --outdir:htmldocs src/libcapstone.nim"

# Maintainer task; see the README for the toolchain it needs.
taskRequires "regen", "futhark == 0.16.1"

task regen, "Regenerate the bindings from the Capstone headers pkg-config points at":
  exec "nim c tools/gen.nim"
