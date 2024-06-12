{.passL: "`pkg-config --libs capstone`".}
{.passL: "`pkg-config --cflags capstone`".}

from os import parentDir, `/`

template CPTR*(s: untyped): cstring = cast[cstring](s[0].addr)

when defined(useFuthark) or defined(useFutharkForLibcapstone):
  import futhark

  importc:
    outputPath currentSourcePath.parentDir / "libcapstone_generated.nim"
    path "/usr/include/capstone"
    "capstone.h"
else:
  include "libcapstone_generated.nim"
