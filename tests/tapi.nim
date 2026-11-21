import std/[sequtils, unittest]
import libcapstone

const
  prologue = [0x55'u8, 0x48, 0x89, 0xe5, 0xc3]         # push rbp; mov rbp, rsp; ret
  withData = [0x55'u8, 0x06, 0x07, 0xc3]               # push rbp; two invalid bytes; ret
  callNext = [0xe8'u8, 0x00, 0x00, 0x00, 0x00]         # call 0x1005
  loadMem = [0x48'u8, 0x8b, 0x44, 0x8b, 0x10]          # mov rax, qword ptr [rbx + rcx*4 + 0x10]

proc listing(cs: Capstone; code: openArray[byte]; address = 0x1000'u64): seq[string] =
  for insn in cs.disasm(code, address): result.add $insn

suite "disassembly":
  test "instructions come out in order with address, text and bytes":
    let cs = initCapstone(CS_ARCH_X86, CS_MODE_64)
    check cs.listing(prologue) == @["0x1000: push rbp", "0x1001: mov rbp, rsp", "0x1004: ret"]
    for insn in cs.disasm(prologue, 0x1000):
      if insn.address == 0x1001:
        check insn.size == 3
        check @(insn.bytes) == @[0x48'u8, 0x89, 0xe5]
        check insn.mnemonic == "mov"
        check insn.opStr == "rbp, rsp"
        check insn.id(x86_insn) == X86_INS_MOV
        check cs.insnName(insn.id) == "mov"

  test "a string is disassembled as its bytes":
    let cs = initCapstone(CS_ARCH_X86, CS_MODE_64)
    var texts: seq[string]
    for insn in cs.disasm("\x55\xc3"): texts.add $insn
    check texts == @["0x0: push rbp", "0x1: ret"]
    check cs.disasmAll("\x55\xc3").len == 2
    check cs.disasmAll("").len == 0

  test "empty input yields nothing":
    let cs = initCapstone(CS_ARCH_X86, CS_MODE_64)
    check cs.listing(newSeq[byte]()).len == 0
    check cs.disasmAll(newSeq[byte]()).len == 0

  test "leaving the loop early is fine":
    let cs = initCapstone(CS_ARCH_X86, CS_MODE_64)
    for insn in cs.disasm(prologue):
      break
    check cs.listing(prologue).len == 3

  test "disassembly stops at bytes that do not decode":
    let cs = initCapstone(CS_ARCH_X86, CS_MODE_64)
    check cs.listing(withData) == @["0x1000: push rbp"]

  test "modes combine with `or`":
    let cs = initCapstone(CS_ARCH_MIPS, CS_MODE_MIPS32 or CS_MODE_BIG_ENDIAN)
    check cs.listing([0x0c'u8, 0x10, 0x00, 0x97]) == @["0x1000: jal 0x40025c"]

  test "disasmAll owns a batch that can be indexed and iterated":
    let cs = initCapstone(CS_ARCH_X86, CS_MODE_64)
    let insns = cs.disasmAll(prologue, 0x1000)
    check insns.len == 3
    check $insns[2] == "0x1004: ret"
    check insns.mapIt($it.mnemonic) == @["push", "mov", "ret"]
    expect IndexDefect: discard insns[3]
    check cs.disasmAll(prologue, 0x1000, maxCount = 1).len == 1

suite "options":
  test "syntax can be switched":
    var cs = initCapstone(CS_ARCH_X86, CS_MODE_64)
    cs.syntax = CS_OPT_SYNTAX_ATT
    check cs.listing(prologue)[1] == "0x1001: movq %rsp, %rbp"

  test "skipdata turns undecodable bytes into data items without detail":
    var cs = initCapstone(CS_ARCH_X86, CS_MODE_64, detail = true)
    cs.enableSkipdata(mnemonic = "db")
    check cs.listing(withData) == @["0x1000: push rbp", "0x1001: db 0x06", "0x1002: db 0x07", "0x1003: ret"]
    for insn in cs.disasm(withData):
      check insn.hasDetail == (insn.id != 0)
    cs.disableSkipdata()
    check cs.listing(withData).len == 1

  test "the skipdata mnemonic survives moving the Capstone object":
    proc make(): Capstone =
      result = initCapstone(CS_ARCH_X86, CS_MODE_64)
      result.enableSkipdata(mnemonic = "raw_byte")
    let cs = make()
    check cs.listing(withData)[1] == "0x1001: raw_byte 0x06"

  test "a mnemonic can be replaced and restored":
    var cs = initCapstone(CS_ARCH_X86, CS_MODE_64)
    cs.setMnemonic(X86_INS_RET, "return")
    check cs.listing(prologue)[2] == "0x1004: return"
    cs.setMnemonic(X86_INS_RET, "")
    check cs.listing(prologue)[2] == "0x1004: ret"

  test "detail can be turned on later":
    var cs = initCapstone(CS_ARCH_X86, CS_MODE_64)
    check not cs.detail
    cs.detail = true
    check cs.detail
    for insn in cs.disasm(prologue): check insn.hasDetail

  test "the mode can be switched on an open disassembler":
    var cs = initCapstone(CS_ARCH_ARM, CS_MODE_ARM)
    check cs.listing([0x1e'u8, 0xff, 0x2f, 0xe1]) == @["0x1000: bx lr"]
    cs.mode = CS_MODE_THUMB
    check cs.listing([0x70'u8, 0x47]) == @["0x1000: bx lr"]

  test "other options go through setOption":
    var cs = initCapstone(CS_ARCH_X86, CS_MODE_32)
    const subMinusOne = [0x83'u8, 0xe8, 0xff]
    check cs.listing(subMinusOne) == @["0x1000: sub eax, -1"]
    cs.setOption(CS_OPT_UNSIGNED, CS_OPT_ON)
    check cs.listing(subMinusOne) == @["0x1000: sub eax, 0xffffffff"]

suite "detail":
  test "operands, groups and registers":
    let cs = initCapstone(CS_ARCH_X86, CS_MODE_64, detail = true)
    let insns = cs.disasmAll(prologue, 0x1000)

    let mov = insns[1]
    check mov.x86.ops.len == 2
    check mov.x86.ops[0].kind == X86_OP_REG
    check cs.regName(mov.x86.ops[0].value.reg) == "rbp"
    check cs.regName(mov.x86.ops[1].value.reg) == "rsp"
    let (read, written) = cs.regsAccess(mov)
    check read.mapIt($cs.regName(it)) == @["rsp"]
    check written.mapIt($cs.regName(it)) == @["rbp"]

    let push = insns[0]
    check @(push.regsRead).mapIt($cs.regName(it)) == @["rsp"]
    check @(push.regsWrite).mapIt($cs.regName(it)) == @["rsp"]

    let ret = insns[2]
    check ret.inGroup(X86_GRP_RET)
    check not mov.inGroup(X86_GRP_RET)
    check cs.groupName(X86_GRP_RET) == "ret"
    check uint8(ord(X86_GRP_RET)) in @(ret.groups)

  test "immediate and memory operands":
    let cs = initCapstone(CS_ARCH_X86, CS_MODE_64, detail = true)
    for insn in cs.disasm(callNext, 0x1000):
      check insn.inGroup(X86_GRP_CALL)
      check insn.x86.ops[0].kind == X86_OP_IMM
      check insn.x86.ops[0].value.imm == 0x1005
    for insn in cs.disasm(loadMem):
      let mem = insn.x86.ops[1]
      check mem.kind == X86_OP_MEM
      check mem.value.mem.base == X86_REG_RBX
      check mem.value.mem.index == X86_REG_RCX
      check mem.value.mem.scale == 4
      check mem.value.mem.disp == 0x10

  test "detail of another architecture":
    let cs = initCapstone(CS_ARCH_ARM64, CS_MODE_ARM, detail = true)
    for insn in cs.disasm([0xe1'u8, 0x0b, 0x40, 0xb9]): # ldr w1, [sp, #8]
      check $insn == "0x0: ldr w1, [sp, #8]"
      check insn.arm64.ops.len == 2
      check insn.arm64.ops[0].kind == ARM64_OP_REG
      check insn.arm64.ops[1].kind == ARM64_OP_MEM
      check insn.arm64.ops[1].value.mem.disp == 8

  test "asking for detail that is not there raises instead of crashing":
    let cs = initCapstone(CS_ARCH_X86, CS_MODE_64)
    for insn in cs.disasm(prologue):
      check not insn.hasDetail
      expect CapstoneError: discard insn.x86.op_count
      expect CapstoneError: discard insn.inGroup(X86_GRP_RET)

  test "asking for another architecture's detail raises instead of reading garbage":
    let cs = initCapstone(CS_ARCH_X86, CS_MODE_64, detail = true)
    for insn in cs.disasm(prologue):
      check insn.arch == CS_ARCH_X86
      expect CapstoneError: discard insn.arm64.op_count

suite "errors":
  test "an invalid mode raises with Capstone's error":
    try:
      discard initCapstone(CS_ARCH_X86, CS_MODE_THUMB or CS_MODE_MCLASS)
      fail()
    except CapstoneError as e:
      check e.code == CS_ERR_MODE
      check e.msg == $cs_strerror(CS_ERR_MODE)

  test "the library version is the one the bindings are for":
    check libraryVersion() == (major: int(CS_API_MAJOR), minor: int(CS_API_MINOR))

  test "the C API can be mixed in through the handle":
    let cs = initCapstone(CS_ARCH_X86, CS_MODE_64, detail = true)
    check cs.arch == CS_ARCH_X86
    check $cs_reg_name(cs.handle, X86_REG_RAX) == "rax"
    var first: ptr cs_insn
    let n = cs_disasm(cs.handle, prologue, 0x1000, 0, addr first)
    require n == 3
    check $cs.toInsn(first) == "0x1000: push rbp"
    check cs.toInsn(first).x86.ops.len == 1
    cs_free(first, n)
