import std/[strformat, strutils]
import libcapstone

# msfvenom -p windows/x64/exec CMD="calc.exe" EXITFUNC=thread -f nim
let shellcode: array[276, byte] = [
  byte 0xfc,0x48,0x83,0xe4,0xf0,0xe8,0xc0,0x00,0x00,0x00,0x41,
  0x51,0x41,0x50,0x52,0x51,0x56,0x48,0x31,0xd2,0x65,0x48,0x8b,
  0x52,0x60,0x48,0x8b,0x52,0x18,0x48,0x8b,0x52,0x20,0x48,0x8b,
  0x72,0x50,0x48,0x0f,0xb7,0x4a,0x4a,0x4d,0x31,0xc9,0x48,0x31,
  0xc0,0xac,0x3c,0x61,0x7c,0x02,0x2c,0x20,0x41,0xc1,0xc9,0x0d,
  0x41,0x01,0xc1,0xe2,0xed,0x52,0x41,0x51,0x48,0x8b,0x52,0x20,
  0x8b,0x42,0x3c,0x48,0x01,0xd0,0x8b,0x80,0x88,0x00,0x00,0x00,
  0x48,0x85,0xc0,0x74,0x67,0x48,0x01,0xd0,0x50,0x8b,0x48,0x18,
  0x44,0x8b,0x40,0x20,0x49,0x01,0xd0,0xe3,0x56,0x48,0xff,0xc9,
  0x41,0x8b,0x34,0x88,0x48,0x01,0xd6,0x4d,0x31,0xc9,0x48,0x31,
  0xc0,0xac,0x41,0xc1,0xc9,0x0d,0x41,0x01,0xc1,0x38,0xe0,0x75,
  0xf1,0x4c,0x03,0x4c,0x24,0x08,0x45,0x39,0xd1,0x75,0xd8,0x58,
  0x44,0x8b,0x40,0x24,0x49,0x01,0xd0,0x66,0x41,0x8b,0x0c,0x48,
  0x44,0x8b,0x40,0x1c,0x49,0x01,0xd0,0x41,0x8b,0x04,0x88,0x48,
  0x01,0xd0,0x41,0x58,0x41,0x58,0x5e,0x59,0x5a,0x41,0x58,0x41,
  0x59,0x41,0x5a,0x48,0x83,0xec,0x20,0x41,0x52,0xff,0xe0,0x58,
  0x41,0x59,0x5a,0x48,0x8b,0x12,0xe9,0x57,0xff,0xff,0xff,0x5d,
  0x48,0xba,0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x48,0x8d,
  0x8d,0x01,0x01,0x00,0x00,0x41,0xba,0x31,0x8b,0x6f,0x87,0xff,
  0xd5,0xbb,0xe0,0x1d,0x2a,0x0a,0x41,0xba,0xa6,0x95,0xbd,0x9d,
  0xff,0xd5,0x48,0x83,0xc4,0x28,0x3c,0x06,0x7c,0x0a,0x80,0xfb,
  0xe0,0x75,0x05,0xbb,0x47,0x13,0x72,0x6f,0x6a,0x00,0x59,0x41,
  0x89,0xda,0xff,0xd5,0x63,0x61,0x6c,0x63,0x2e,0x65,0x78,0x65,
  0x00]

type
  platform = object
    arch:      cs_arch
    mode:      cs_mode
    code:      ptr uint8
    size:      csize_t
    comment:   string
    opt_type:  cs_opt_type
    opt_value: cs_opt_value

var handle: csh

proc printStringHex(comment: cstring, str: ptr uint8, len: csize_t) =
  var pStr = cast[ptr UncheckedArray[uint8]](str)
  stdout.write &"{comment}"
  for i in 0 ..< len:
    stdout.write &"0x{(pStr[i] and 0xff):#>02X} "
  stdout.writeLine ""


proc printInsnDetail(ud: csh, mode: cs_mode, ins: ptr cs_insn) = 
  var
    i, count: int
    x86: ptr cs_x86
    regs_read, regs_write: cs_regs
    regs_read_count, regs_write_count: uint8

  # detail can be NULL on data instructions if SKIPDATA option is turned on
  if (cast[bool](ins.detail.anon0.x86)):
    return

  x86 = (ins.detail.anon0.x86).addr
  printStringHex("\tPrefix: ", cast[ptr uint8](x86.prefix[0].addr), 4)
  printStringHex("\tOpcode: ", cast[ptr uint8](x86.opcode[0].addr), 4)
  echo &"\trex: {x86.rex:#X}"
  echo &"\taddr_size: {x86.addr_size:#X}"
  echo &"\tmodrm: {x86.modrm:#X}"
  if (x86.encoding.modrmoffset != 0):
    echo &"\tmodrm_offset: {x86.encoding.modrmoffset:#X}"
  echo &"\tdisp: {x86.disp:#X}"
  if (x86.encoding.disp_offset != 0):
    echo &"\tdisp_offset: {x86.encoding.disp_offset:#X}"
  if (x86.encoding.disp_size != 0):
    echo &"\tdisp_offset: {x86.encoding.disp_size:#X}"
  
  # SIB is not available in 16-bit mode
  if ((mode.int and CS_MODE_16.int) == 0):
    echo &"\ttisb: {x86.sib:#X}"
    if (x86.sib_base != X86_REG_INVALID):
      echo &"\ttsib_base: {cs_reg_name(handle, x86.sib_base.cuint)}"
    if (x86.sib_index != X86_REG_INVALID):
      echo &"\ttsib_index: {cs_reg_name(handle, x86.sib_index.cuint)}"
    if (x86.sib_scale != 0):
      echo &"\ttsib_scale: {x86.sib_scale:}"
  
  # XOP code condition
  if (x86.xop_cc != X86_XOP_CC_INVALID):
    echo &"\txop_cc: {x86.xop_cc}"
  
  # SSE code condition
  if (x86.sse_cc != X86_SSE_CC_INVALID):
    echo &"\tsse_cc: {x86.sse_cc}"
  
  # AVX code condition
  if (x86.avx_cc != X86_AVX_CC_INVALID):
    echo &"\tavx_cc: {x86.avx_cc}"

  # AVX Suppress All Exception
  if (x86.avx_sae.bool):
    echo &"\tavx_ase: {x86.avx_sae}"
  
  # AVX Rounding Mode
  if (x86.avx_rm != X86_AVX_RM_INVALID):
    echo &"\tavc_rm: {x86.avx_rm}"

  # Print out all immediate operands
  count = cs_op_count(ud, ins, X86_OP_IMM.cuint)
  if (count.bool):
    echo &"\timm_count: {count}"
    var pOperands = cast[ptr UncheckedArray[csx86op]](x86.operands[0].addr)
    for i in 1 ..< count+1:
      var index = cs_op_index(ud, ins, X86_OP_IMM.cuint, i.cuint)
      echo &"\t\timms[{i}]: {pOperands[index].anon0.imm:#X}"
      if (x86.encoding.imm_offset != 0):
        echo &"\timm_offset: {x86.encoding.imm_offset:#X}"
      if (x86.encoding.imm_size != 0):
        echo &"\timm_size: {x86.encoding.imm_size:#X}"
  
  if (x86.op_count.bool):
    echo &"\top_count: {x86.op_count}"

  # print out all operands
  var pOperands = cast[ptr UncheckedArray[csx86op]](x86.operands[0].addr)
  for i in 0'u8 ..< x86.op_count:
    var op: ptr cs_x86_op = (pOperands[i].addr)

    case (cast[int](op.typefield)):
    of X86_OP_REG.int:
      echo &"\t\toperands[{i}].type: REG = {cs_reg_name(handle, op.anon0.reg.cuint)}"
    of X86_OP_IMM.int:
      echo &"\t\toperands[{i}].type: IMM = {cs_reg_name(handle, op.anon0.imm.cuint)}"
    of X86_OP_MEM.int:
      echo &"\t\toperands[{i}].type: MEM"
      if (op.anon0.mem.segment != X86_REG_INVALID):
        echo &"\t\toperands[{i}].mem.segment: REG = {cs_reg_name(handle, op.anon0.mem.segment.cuint)}"
      if (op.anon0.mem.base != X86_REG_INVALID):
        echo &"\t\toperands[{i}].mem.base: REG = {cs_reg_name(handle, op.anon0.mem.base.cuint)}"
      if (op.anon0.mem.index != X86_REG_INVALID):
        echo &"\t\toperands[{i}].mem.index: REG = {cs_reg_name(handle, op.anon0.mem.index.cuint)}"
      if (op.anon0.mem.scale != 1):
        echo &"\t\toperands[{i}].mem.scale: {op.anon0.mem.scale.cuint}"
      if (op.anon0.mem.disp != 0):
        echo &"\t\toperands[{i}].mem.disp: {op.anon0.mem.disp.cuint:#X}"
    else:
      discard

    # AVX broadcast type
    if (op.avx_bcast != X86_AVX_BCAST_INVALID):
      echo &"\t\toperands[{i}].avx_bcast: {op.avx_bcast}"
    
    # AVX zero opmask {z}
    if (op.avx_zero_opmask != false):
      echo &"\t\toperands[{i}].avx_bcast: TRUE"
    
    echo &"\t\toperands[{i}].size: {op.size}"

    case (op.access):
    of CS_AC_READ.uint8:
      echo &"\t\toperands[{i}].access: READ"
    of CS_AC_WRITE.uint8:
      echo &"\t\toperands[{i}].access: WRITE"
    of CS_AC_READ.uint8 or CS_AC_WRITE.uint8:
      echo &"\t\toperands[{i}].access: READ | WRITE"
    else:
      discard
  
  # Print out all registers accessed by this instruction (either implicit or explicit)
  if (cs_regs_access(ud, ins, regs_read, regs_read_count.addr, regs_write, regs_write_count.addr).int == 0):
    var 
      pRegsRead  = cast[ptr UncheckedArray[uint16]](regs_read.addr)
      pRegsWrite = cast[ptr UncheckedArray[uint16]](regs_write.addr)
    if (regs_read_count != 0):
      stdout.write "\tRegisters read:"
      for i in 0'u8 ..< regs_read_count:
        stdout.write &" {cs_reg_name(handle, pRegsRead[i])}"
      stdout.writeLine ""
    if (regs_write_count != 0):
      stdout.write "\tRegisters modified:"
      for i in 0'u8 ..< regs_read_count:
        stdout.write &" {cs_reg_name(handle, pRegsWrite[i])}"
      stdout.writeLine ""
  
  if (x86.anon0.eflags.bool or x86.anon0.fpu_flags.bool):
    var pGroups = cast[ptr UncheckedArray[uint8]](ins.detail.groups[0].addr)
    for i in 0'u8 ..< ins.detail.groups_count:
      if (pGroups[i] == X86_GRP_FPU.uint8):
        stdout.write "\tFPU_FLAGS:"
        for j in 0 .. 63:
          if (x86.anon0.fpu_flags.int and (1'u8 shl i).int).bool:
            discard
            # stdout.write &" {get_fpu_flag_name(1 shl i)}" # TODO: not implemented
          echo ""
      if (i == ins.detail.groups_count):
        stdout.write "\tEFLAGS:"
        for j in 0 .. 63:
          if (x86.anon0.eflags.int and (1'u8 shl i).int).bool:
            # stdout.write &" {get_eflag_name(1 shl i)}" # TODO: not implemented
            discard
          echo ""
  echo ""






proc main() =
  var platforms: array[1, platform] = [
    platform(
      arch: CS_ARCH_x86, 
      mode: CS_MODE_64, 
      code: cast[ptr uint8](shellcode[0].addr), 
      size: shellcode.len.csize_t, 
      comment: "X86 64bit (Intel Sytax)")
  ]
  var
    address: uint = 0x1000
    insn: ptr cs_insn
    count: csize_t

  for i in 0 ..< platforms.len:
    let err: cs_err = cs_open(platforms[i].arch, platforms[i].mode, handle.addr)
    if err.bool:
      echo "[!] Failed on cs_open() with error returned: ", err
      quit(1)
    
    if cast[bool](platforms[i].opt_type):
      discard cs_option(handle, platforms[i].opt_type, platforms[i].opt_value.csize_t)

    discard cs_option(handle, CS_OPT_DETAIL, CS_OPT_ON.csize_t)
    
    count = cs_disasm(handle, platforms[i].code, platforms[i].size, address, 0, insn.addr)
    if count.bool:
      echo "****************"
      echo &"Platform: {platforms[i].comment}"
      printStringHex("Code: ", platforms[i].code, platforms[i].size)
      echo "Disasm:"
      var 
        pinsn = cast[ptr UncheckedArray[cs_insn]](insn)

      for j in 0 ..< count:
        echo &"{pinsn[j].address:#X}:\t{CPTR(pinsn[j].mnemonic)}\t{CPTR(pinsn[j].op_str)}"
        printInsnDetail(handle, platforms[i].mode, pinsn[j].addr)
      echo &"{(pinsn[count-1].address + pinsn[count-1].size):#X}"
      cs_free(insn, count)
    else:
      echo "****************"
      echo &"Platform: {platforms[i].comment}"
      printStringHex("Code: ", platforms[i].code, platforms[i].size)
      echo "[!] Failed to disasm given code"
      quit(1)
    discard cs_close(handle.addr)

  


when isMainModule:
  main()