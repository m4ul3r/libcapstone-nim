## Build configuration: where the Capstone library is and which version it is.
##
## By default everything comes from `pkg-config capstone`. For cross builds,
## static archives or systems without pkg-config, pass the linker flags
## yourself; pkg-config is then not consulted at all:
##
## * `-d:capstoneLibs="-L/opt/cs/lib -lcapstone"`: linker flags.
## * `-d:capstoneMajor=4`: major version of that library; required with
##   `capstoneLibs`.
## * `-d:capstoneCflags="-I/opt/cs/include/capstone"`: where its headers are.
##   Without it the build-time header check is skipped. Given on its own, it
##   replaces pkg-config's C flags.

import std/[macros, strutils]

const
  capstoneLibs {.strdefine.} = ""
  capstoneCflags {.strdefine.} = ""
  capstoneMajor {.intdefine.} = 0

const installHint =
  "Install the Capstone development package (Debian/Ubuntu: libcapstone-dev, " &
  "Fedora: capstone-devel, Arch/Homebrew: capstone), or pass " &
  "-d:capstoneLibs=\"-L<dir> -lcapstone\" -d:capstoneMajor=<N>."

proc pkgConfig(query: string): string {.compileTime.} =
  let (output, exitCode) = gorgeEx("pkg-config " & query & " capstone")
  if exitCode != 0:
    error("libcapstone: `pkg-config " & query & " capstone` failed:\n" &
          output.strip & "\n" & installHint)
  output.strip

proc versionPart(version: string; index: int): int {.compileTime.} =
  ## Numeric value of the dot-separated component `index`; -1 when absent.
  let parts = version.split('.')
  if index >= parts.len: return -1
  var digits = ""
  for c in parts[index]:
    if c notin Digits: break
    digits.add c
  if digits.len == 0: -1 else: parseInt(digits)

when capstoneLibs.len > 0:
  when capstoneMajor == 0:
    {.error: "libcapstone: -d:capstoneLibs also needs -d:capstoneMajor=<N>, " &
             "the major version of that Capstone library.".}
  const
    linkFlags* = capstoneLibs
    headerFlags* = capstoneCflags
    headersKnown* = capstoneCflags.len > 0
    pkgVersion* = ""          ## Version reported by pkg-config; empty when it was not consulted.
    libMajor* = capstoneMajor
    libMinor* = -1
elif defined(nimcheck) or defined(nimsuggest):
  # `nim check` and nimsuggest do not run external programs, so pkg-config
  # cannot be asked. Nothing is compiled or linked in these modes either; all
  # that matters is which bindings the code is checked against.
  const
    linkFlags* = ""
    headerFlags* = ""
    headersKnown* = false
    pkgVersion* = ""
    libMajor* = (if capstoneMajor != 0: capstoneMajor else: 4)
    libMinor* = -1
else:
  const
    linkFlags* = pkgConfig("--libs")
    headerFlags* = (if capstoneCflags.len > 0: capstoneCflags else: pkgConfig("--cflags"))
    headersKnown* = true
    pkgVersion* = pkgConfig("--modversion")
    libMajor* = versionPart(pkgVersion, 0)
    libMinor* = versionPart(pkgVersion, 1)
  when capstoneMajor != 0 and capstoneMajor != libMajor:
    {.error: "libcapstone: -d:capstoneMajor=" & $capstoneMajor & " contradicts pkg-config, " &
             "which reports Capstone " & pkgVersion & ". To link a different library pass " &
             "-d:capstoneLibs as well.".}
