## The Capstone C API.
##
## The declarations come from a Futhark-generated module, one per supported
## Capstone major version, selected at compile time (see `private/config`).
## This module re-exports them, replaces the few declarations the generator
## gets wrong, and refuses to work with a Capstone version the bindings were
## not generated for:
##
## * at build time, the version pkg-config reports and the headers the C
##   compiler sees are checked against the bindings;
## * at run time, `cs_open` returns `CS_ERR_VERSION` when the loaded library
##   is another version.

import std/strutils
import private/config

{.passl: linkFlags.}

when libMajor == 4:
  import gen_v4 as gen
  # `cs_disasm_ex` is deprecated in Capstone 4 and gone in Capstone 5.
  export gen except cs_open, cs_regs_access, cs_vsnprintf_t, cs_opt_mem, struct_cs_opt_mem,
    cs_disasm_ex
elif libMajor == 5:
  when pkgVersion in ["5.0", "5.0.0", "5.0.1"]:
    # They number CS_OP_MEM and CS_OP_FP differently from every later 5.0.x.
    {.error: "libcapstone: Capstone " & pkgVersion & " is not supported; 5.0.2 or later is.".}
  import gen_v5 as gen
  export gen except cs_open, cs_regs_access, cs_vsnprintf_t, cs_opt_mem, struct_cs_opt_mem
else:
  {.error: "libcapstone: Capstone " & (if pkgVersion.len > 0: pkgVersion else: $libMajor & ".x") &
           " is not supported. Bindings exist for Capstone 4.0.x and 5.0.x (5.0.2 or later).".}

when pkgVersion.len > 0 and (libMajor != CS_API_MAJOR or libMinor != CS_API_MINOR):
  {.error: "libcapstone: the bindings are for Capstone " & $CS_API_MAJOR & "." & $CS_API_MINOR &
           ".x, but pkg-config reports Capstone " & pkgVersion & ".".}

when headersKnown and not defined(capstoneNoHeaderCheck):
  {.compile("private/abi_check.c", headerFlags &
    " -DLCN_API_MAJOR=" & $CS_API_MAJOR &
    " -DLCN_API_MINOR=" & $CS_API_MINOR &
    " -DLCN_SIZEOF_CS_INSN=" & $sizeof(cs_insn) &
    " -DLCN_SIZEOF_CS_DETAIL=" & $sizeof(cs_detail) &
    " -DLCN_CS_OP_MEM=" & $ord(CS_OP_MEM) &
    " -DLCN_CS_OP_FP=" & $ord(CS_OP_FP) &
    " -DLCN_X86_INS_ENDING=" & $ord(X86_INS_ENDING) &
    " -DLCN_ARM_INS_ENDING=" & $ord(ARM_INS_ENDING) &
    " -DLCN_PPC_INS_ENDING=" & $ord(PPC_INS_ENDING)).}

# Replacements for declarations the generator gets wrong.

proc libraryMatchesBindings*(): bool =
  ## Whether the Capstone library in this process is the version the bindings
  ## were generated for. Struct layouts and enum values differ between versions,
  ## so nothing but `cs_version`, `cs_support` and `cs_strerror` is safe to use
  ## when this is false.
  var major, minor: cint
  discard cs_version(addr major, addr minor)
  major == CS_API_MAJOR and minor == CS_API_MINOR

proc cs_open*(arch: cs_arch; mode: cs_mode; handle: ptr csh): cs_err =
  ## C `cs_open`, except that it fails with `CS_ERR_VERSION` when
  ## `libraryMatchesBindings()` is false. Every other call needs a handle, so
  ## this keeps a mismatched library from being used at all.
  if not libraryMatchesBindings():
    if handle != nil: handle[] = 0
    return CS_ERR_VERSION
  gen.cs_open(arch, mode, handle)

proc cs_regs_access*(handle: csh; insn: ptr cs_insn;
                     regs_read: var cs_regs; regs_read_count: ptr uint8;
                     regs_write: var cs_regs; regs_write_count: ptr uint8): cs_err {.
    cdecl, importc.}
  ## The generator declares the two arrays as by-value inputs; C writes to them.

type
  va_list* {.importc, header: "<stdarg.h>", bycopy.} = object
  cs_vsnprintf_t* = proc (str: cstring; size: csize_t; format: cstring; ap: va_list): cint {.cdecl.}
    ## The generator drops the `va_list` parameter.
  cs_opt_mem* {.bycopy.} = object
    ## User-defined memory management for `CS_OPT_MEM`.
    malloc*: cs_malloc_t
    calloc*: cs_calloc_t
    realloc*: cs_realloc_t
    free*: cs_free_t
    vsnprintf*: cs_vsnprintf_t

# Overloads for the types client code has at hand.

func `or`*(a, b: cs_mode): cs_mode {.borrow.}
func `and`*(a, b: cs_mode): cs_mode {.borrow.}
func `==`*(a, b: cs_mode): bool {.borrow.}
func `$`*(mode: cs_mode): string =
  ## The mode bits in hex. The same bit means different things on different
  ## architectures, so there is no single name to print.
  "0x" & toHex(uint32(mode))

template CPTR*(s: untyped): cstring = cast[cstring](s[0].addr)
