import std/unittest
import libcapstone

const code = [0x55'u8, 0x48, 0x89, 0xe5, 0xc3] # push rbp; mov rbp, rsp; ret

suite "raw API":
  var
    handle: csh
    insn: ptr cs_insn
    count: csize_t

  setup:
    require cs_open(CS_ARCH_X86, CS_MODE_64, addr handle) == CS_ERR_OK
    require cs_option(handle, CS_OPT_DETAIL, CS_OPT_ON) == CS_ERR_OK
    count = cs_disasm(handle, code, 0x1000, 0, addr insn)
    require count == 3
    let insns {.inject, used.} = cast[ptr UncheckedArray[cs_insn]](insn)

  teardown:
    cs_free(insn, count)
    check cs_close(addr handle) == CS_ERR_OK

  test "the loaded library is the version the bindings were generated for":
    check libraryMatchesBindings()

  test "instructions carry address, mnemonic and operands":
    check insns[1].address == 0x1001
    check $insns[1].mnemonic == "mov"
    check $insns[1].op_str == "rbp, rsp"
    check insns[2].address == 0x1004
    check $insns[2].mnemonic == "ret"
    check CS_INSN_OFFSET(insns, 3) == 4'u64

  test "an empty buffer disassembles to nothing":
    var none: ptr cs_insn = insn
    check cs_disasm(handle, newSeq[byte](), 0, 0, addr none) == 0
    check none == nil

  test "ids can be passed as the enums they come from":
    check $cs_reg_name(handle, X86_REG_RBP) == "rbp"
    check $cs_insn_name(handle, X86_INS_MOV) == "mov"
    check $cs_group_name(handle, X86_GRP_RET) == "ret"
    check cs_insn_group(handle, addr insns[2], X86_GRP_RET)
    check not cs_insn_group(handle, addr insns[1], X86_GRP_RET)
    check cs_reg_read(handle, addr insns[0], X86_REG_RSP) # push reads rsp implicitly
    check cs_reg_write(handle, addr insns[0], X86_REG_RSP)
    check cs_op_count(handle, addr insns[1], X86_OP_REG) == 2
    check cs_op_index(handle, addr insns[1], X86_OP_REG, 2) == 1
    check cs_support(CS_ARCH_X86)

  test "options take their constants directly":
    check cs_option(handle, CS_OPT_SYNTAX, CS_OPT_SYNTAX_ATT) == CS_ERR_OK
    var att: ptr cs_insn
    let n = cs_disasm(handle, code, 0x1000, 0, addr att)
    require n == 3
    check $cast[ptr UncheckedArray[cs_insn]](att)[1].op_str == "%rsp, %rbp"
    cs_free(att, n)

  test "struct options take a pointer":
    var rename = cs_opt_mnem(id: cuint(ord(X86_INS_RET)), mnemonic: "return")
    check cs_option(handle, CS_OPT_MNEMONIC, addr rename) == CS_ERR_OK
    var renamed: ptr cs_insn
    let n = cs_disasm(handle, code, 0x1000, 0, addr renamed)
    require n == 3
    check $cast[ptr UncheckedArray[cs_insn]](renamed)[2].mnemonic == "return"
    cs_free(renamed, n)

  test "cs_regs_access fills the caller's arrays":
    var
      regsRead, regsWrite: cs_regs
      readCount, writeCount: uint8
    check cs_regs_access(handle, addr insns[1], regsRead, addr readCount,
                         regsWrite, addr writeCount) == CS_ERR_OK
    check readCount == 1
    check $cs_reg_name(handle, regsRead[0].cuint) == "rsp"
    check writeCount == 1
    check $cs_reg_name(handle, regsWrite[0].cuint) == "rbp"

  test "cs_regs_access does not accept arrays it could not write to":
    let frozen = default(cs_regs)
    var
      regsWrite: cs_regs
      readCount, writeCount: uint8
    check not compiles(cs_regs_access(handle, insn, frozen, addr readCount,
                                      regsWrite, addr writeCount))

  test "cs_disasm_ex, which Capstone 5 removed, is not exported":
    check not declared(cs_disasm_ex)

suite "modes":
  test "modes combine with `or`":
    var handle: csh
    require cs_open(CS_ARCH_MIPS, CS_MODE_MIPS32 or CS_MODE_BIG_ENDIAN, addr handle) == CS_ERR_OK
    var insn: ptr cs_insn
    let n = cs_disasm(handle, [0x0c'u8, 0x10, 0x00, 0x97], 0x1000, 0, addr insn)
    require n == 1
    check $insn.mnemonic == "jal"
    check $insn.op_str == "0x40025c"
    cs_free(insn, n)
    check cs_close(addr handle) == CS_ERR_OK

  test "a mode prints as its bits":
    check $(CS_MODE_MIPS32 or CS_MODE_BIG_ENDIAN) == "0x80000004"
    check (CS_MODE_64 and CS_MODE_32) == CS_MODE_LITTLE_ENDIAN

  test "an invalid combination is rejected by Capstone, not by a cast":
    var handle: csh
    check cs_open(CS_ARCH_X86, CS_MODE_THUMB or CS_MODE_MCLASS, addr handle) == CS_ERR_MODE

suite "macros":
  test "X86_REL_ADDR resolves relative targets":
    var handle: csh
    require cs_open(CS_ARCH_X86, CS_MODE_64, addr handle) == CS_ERR_OK
    require cs_option(handle, CS_OPT_DETAIL, CS_OPT_ON) == CS_ERR_OK
    const relative = [0xe8'u8, 0x00, 0x00, 0x00, 0x00,          # call next instruction
                      0x48, 0x8d, 0x05, 0x10, 0x00, 0x00, 0x00] # lea rax, [rip + 0x10]
    var insn: ptr cs_insn
    let n = cs_disasm(handle, relative, 0x1000, 0, addr insn)
    require n == 2
    let insns = cast[ptr UncheckedArray[cs_insn]](insn)
    check X86_REL_ADDR(insns[0]) == 0x1005'u64
    check X86_REL_ADDR(insns[1]) == 0x101c'u64 # 0x1005 + 7 bytes + 0x10
    cs_free(insn, n)
    check cs_close(addr handle) == CS_ERR_OK

  test "CS_MAKE_VERSION matches cs_version":
    check cs_version(nil, nil) == cuint(CS_MAKE_VERSION(CS_API_MAJOR, CS_API_MINOR))
