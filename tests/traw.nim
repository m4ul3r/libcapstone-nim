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
    require cs_option(handle, CS_OPT_DETAIL, CS_OPT_ON.csize_t) == CS_ERR_OK
    count = cs_disasm(handle, addr code[0], csize_t(code.len), 0x1000, 0, addr insn)
    require count == 3
    let insns {.inject, used.} = cast[ptr UncheckedArray[cs_insn]](insn)

  teardown:
    cs_free(insn, count)
    check cs_close(addr handle) == CS_ERR_OK

  test "the loaded library is the version the bindings were generated for":
    check libraryMatchesBindings()

  test "instructions carry address, mnemonic and operands":
    check insns[1].address == 0x1001
    check $cast[cstring](addr insns[1].mnemonic) == "mov"
    check $cast[cstring](addr insns[1].op_str) == "rbp, rsp"
    check insns[2].address == 0x1004
    check $cast[cstring](addr insns[2].mnemonic) == "ret"

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
