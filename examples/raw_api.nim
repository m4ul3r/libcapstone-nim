## The C API, for code ported from C or for calls the Nim API does not cover.
## The names and signatures are Capstone's; `libcapstone` only adds overloads
## that take Nim types where C takes plain integers and pointers.

import std/[strformat, strutils]
import libcapstone

const code = [0x55'u8, 0x48, 0x8b, 0x05, 0xb8, 0x13, 0x00, 0x00, # push rbp; mov rax, [rip + 0x13b8]
              0xe8, 0x00, 0x00, 0x00, 0x00, 0xc3]                # call next; ret

var handle: csh
let err = cs_open(CS_ARCH_X86, CS_MODE_64, addr handle)
if err != CS_ERR_OK:
  quit "cs_open failed: " & $cs_strerror(err)
discard cs_option(handle, CS_OPT_DETAIL, CS_OPT_ON)

var first: ptr cs_insn
let count = cs_disasm(handle, code, 0x1000, 0, addr first)
let insns = cast[ptr UncheckedArray[cs_insn]](first)

for i in 0 ..< int(count):
  let insn = addr insns[i]
  echo strip(&"{insn.address:#x}: {$insn.mnemonic} {$insn.op_str}")
  if cs_insn_group(handle, insn, X86_GRP_CALL):
    echo &"  a call to {X86_REL_ADDR(insn[]):#x}"
  let x86 = addr insn.detail.arch.x86
  for j in 0 ..< int(x86.op_count):
    let op = x86.operands[j]
    case op.kind
    of X86_OP_REG:
      echo "  register ", cs_reg_name(handle, op.value.reg)
    of X86_OP_IMM:
      echo &"  immediate {op.value.imm:#x}"
    of X86_OP_MEM:
      echo &"  memory, base {cs_reg_name(handle, op.value.mem.base)}, displacement {op.value.mem.disp:#x}"
    else:
      discard

cs_free(first, count)
discard cs_close(addr handle)
