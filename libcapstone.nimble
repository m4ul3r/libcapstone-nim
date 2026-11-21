# Package

version       = "0.1.0"
author        = "m4ul3r"
description   = "Futhark generated wrapper around libcapstone"
license       = "MIT"
srcDir        = "src"


# Dependencies

requires "nim >= 2.0.0"


# Tasks

task examples, "Build and run the examples":
  for name in ["basic", "x86_detail", "raw_api"]:
    exec "nim c -r --hints:off -p:src examples/" & name & ".nim"

task docs, "Generate the API documentation into htmldocs/":
  exec "nim doc --project --index:on --outdir:htmldocs src/libcapstone.nim"

# Maintainer task; see the README for the toolchain it needs.
taskRequires "regen", "futhark == 0.16.1"

task regen, "Regenerate the bindings from the Capstone headers pkg-config points at":
  exec "nim c tools/gen.nim"
