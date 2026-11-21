## `CS_OPT_MEM` replaces Capstone's allocator and formatter for the whole
## process, so this lives in its own test binary.

import std/unittest
import libcapstone

proc c_malloc(size: csize_t): pointer {.cdecl, importc: "malloc", header: "<stdlib.h>".}
proc c_calloc(count, size: csize_t): pointer {.cdecl, importc: "calloc", header: "<stdlib.h>".}
proc c_realloc(p: pointer; size: csize_t): pointer {.cdecl, importc: "realloc", header: "<stdlib.h>".}
proc c_free(p: pointer) {.cdecl, importc: "free", header: "<stdlib.h>".}
proc c_vsnprintf(str: cstring; size: csize_t; format: cstring; ap: va_list): cint {.
  cdecl, importc: "vsnprintf", header: "<stdio.h>".}

var formatCalls = 0

proc countingVsnprintf(str: cstring; size: csize_t; format: cstring; ap: va_list): cint {.cdecl.} =
  inc formatCalls
  c_vsnprintf(str, size, format, ap)

test "CS_OPT_MEM accepts a vsnprintf written in Nim and Capstone formats through it":
  var mem = cs_opt_mem(malloc: c_malloc, calloc: c_calloc, realloc: c_realloc,
                       free: c_free, vsnprintf: countingVsnprintf)
  require cs_option(0, CS_OPT_MEM, cast[csize_t](addr mem)) == CS_ERR_OK

  var handle: csh
  require cs_open(CS_ARCH_X86, CS_MODE_64, addr handle) == CS_ERR_OK
  let code = [0xb8'u8, 0x34, 0x12, 0x00, 0x00] # mov eax, 0x1234
  var insn: ptr cs_insn
  let count = cs_disasm(handle, addr code[0], csize_t(code.len), 0, 0, addr insn)
  require count == 1
  check $cast[cstring](addr insn.op_str) == "eax, 0x1234"
  check formatCalls > 0
  cs_free(insn, count)
  check cs_close(addr handle) == CS_ERR_OK
