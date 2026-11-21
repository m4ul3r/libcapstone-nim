## Architectures and modes other than x86-64: that the mode constants select
## what they say, and that per-architecture detail is readable.

import std/unittest
import libcapstone

type Case = tuple
  name: string
  arch: cs_arch
  mode: cs_mode
  code: string
  count: int
  first, last: string

const cases: seq[Case] = @[
  ("x86 16-bit", CS_ARCH_X86, CS_MODE_16,
   "\x8d\x4c\x32\x08\x01\xd8\x81\xc6\x34\x12\x00\x00\x05\x23\x01\x00\x00\x36\x8b\x84\x91\x23\x01\x00\x00\x41\x8d\x84\x39\x89\x67\x00\x00\x8d\x87\x89\x67\x00\x00\xb4\xc6\x66\xe9\xb8\x00\x00\x00\x67\xff\xa0\x23\x01\x00\x00\x66\xe8\xcb\x00\x00\x00\x74\xfc",
   19, "0x1000: lea cx, [si + 0x32]", "0x103c: je 0x103a"),
  ("x86 32-bit", CS_ARCH_X86, CS_MODE_32,
   "\x8d\x4c\x32\x08\x01\xd8\x81\xc6\x34\x12\x00\x00\x05\x23\x01\x00\x00\x36\x8b\x84\x91\x23\x01\x00\x00\x41\x8d\x84\x39\x89\x67\x00\x00\x8d\x87\x89\x67\x00\x00\xb4\xc6\xe9\xea\xbe\xad\xde\xff\xa0\x23\x01\x00\x00\xe8\xdf\xbe\xad\xde\x74\xff",
   13, "0x1000: lea ecx, [edx + esi + 8]", "0x1039: je 0x103a"),
  ("x86 64-bit", CS_ARCH_X86, CS_MODE_64,
   "\x55\x48\x8b\x05\xb8\x13\x00\x00\xe9\xea\xbe\xad\xde\xff\x25\x23\x01\x00\x00\xe8\xdf\xbe\xad\xde\x74\xff",
   6, "0x1000: push rbp", "0x1018: je 0x1019"),
  ("ARM64", CS_ARCH_ARM64, CS_MODE_ARM,
   "\x09\x00\x38\xd5\xbf\x40\x00\xd5\x0c\x05\x13\xd5\x20\x50\x02\x0e\x20\xe4\x3d\x0f\x00\x18\xa0\x5f\xa2\x00\xae\x9e\x9f\x37\x03\xd5\xbf\x33\x03\xd5\xdf\x3f\x03\xd5\x21\x7c\x02\x9b\x21\x7c\x00\x53\x00\x40\x21\x4b\xe1\x0b\x40\xb9\x20\x04\x81\xda\x20\x08\x02\x8b\x10\x5b\xe8\x3c",
   17, "0x1000: mrs x9, midr_el1", "0x1040: ldr q16, [x24, w8, uxtw #4]"),
  ("MIPS32 big-endian", CS_ARCH_MIPS, CS_MODE_MIPS32 or CS_MODE_BIG_ENDIAN,
   "\x0c\x10\x00\x97\x00\x00\x00\x00\x24\x02\x00\x0c\x8f\xa2\x00\x00\x34\x21\x34\x56",
   5, "0x1000: jal 0x40025c", "0x1010: ori $at, $at, 0x3456"),
  ("MIPS64 little-endian", CS_ARCH_MIPS, CS_MODE_MIPS64 or CS_MODE_LITTLE_ENDIAN,
   "\x56\x34\x21\x34\xc2\x17\x01\x00",
   2, "0x1000: ori $at, $at, 0x3456", "0x1004: srl $v0, $at, 0x1f"),
  ("MIPS32R6 microMIPS big-endian", CS_ARCH_MIPS,
   CS_MODE_MIPS32R6 or CS_MODE_MICRO or CS_MODE_BIG_ENDIAN,
   "\x00\x07\x00\x07\x00\x11\x93\x7c\x01\x8c\x8b\x7c\x00\xc7\x48\xd0",
   4, "0x1000: break 7, 0", "0x100c: rotrv $t1, $a2, $a3"),
  ("MIPS32R6 big-endian", CS_ARCH_MIPS, CS_MODE_MIPS32R6 or CS_MODE_BIG_ENDIAN,
   "\xec\x80\x00\x19\x7c\x43\x22\xa0",
   2, "0x1000: addiupc $a0, 0x64", "0x1004: align $a0, $v0, $v1, 2"),
  # The same four bytes are a different instruction once MIPS II is selected.
  ("MIPS64 with MIPS II", CS_ARCH_MIPS, CS_MODE_MIPS64 or CS_MODE_MIPS2 or CS_MODE_LITTLE_ENDIAN,
   "\x70\x00\xb2\xff", 1, "0x1000: sdc3 $18, 0x70($sp)", "0x1000: sdc3 $18, 0x70($sp)"),
  ("MIPS64", CS_ARCH_MIPS, CS_MODE_MIPS64 or CS_MODE_LITTLE_ENDIAN,
   "\x70\x00\xb2\xff", 1, "0x1000: sd $s2, 0x70($sp)", "0x1000: sd $s2, 0x70($sp)"),
]

suite "architectures and modes":
  for c in cases:
    test c.name:
      let cs = initCapstone(c.arch, c.mode)
      var texts: seq[string]
      for insn in cs.disasm(c.code, 0x1000): texts.add $insn
      check texts.len == c.count
      if texts.len > 0:
        check texts[0] == c.first
        check texts[^1] == c.last

suite "detail per architecture":
  test "ARM":
    let cs = initCapstone(CS_ARCH_ARM, CS_MODE_ARM, detail = true)
    for insn in cs.disasm([0x01'u8, 0x00, 0xa0, 0xe1]): # mov r0, r1
      check $insn == "0x0: mov r0, r1"
      check insn.arm.ops.len == 2
      check insn.arm.ops[0].kind == ARM_OP_REG
      check cs.regName(insn.arm.ops[0].value.reg) == "r0"
      check cs.regName(insn.arm.ops[1].value.reg) == "r1"

  test "MIPS":
    let cs = initCapstone(CS_ARCH_MIPS, CS_MODE_MIPS32 or CS_MODE_BIG_ENDIAN, detail = true)
    for insn in cs.disasm([0x24'u8, 0x02, 0x00, 0x0c]): # addiu $v0, $zero, 0xc
      check $insn == "0x0: addiu $v0, $zero, 0xc"
      check insn.mips.ops.len == 3
      check insn.mips.ops[0].kind == MIPS_OP_REG
      check cs.regName(insn.mips.ops[0].value.reg) == "v0"
      check insn.mips.ops[2].kind == MIPS_OP_IMM
      check insn.mips.ops[2].value.imm == 12

  test "PowerPC":
    let cs = initCapstone(CS_ARCH_PPC, CS_MODE_BIG_ENDIAN, detail = true)
    for insn in cs.disasm([0x38'u8, 0x60, 0x00, 0x01]): # li r3, 1
      check insn.mnemonic == "li"
      check insn.ppc.ops.len == 2
      check insn.ppc.ops[0].kind == PPC_OP_REG
      check cs.regName(insn.ppc.ops[0].value.reg) == "r3"
      check insn.ppc.ops[1].kind == PPC_OP_IMM
      check insn.ppc.ops[1].value.imm == 1
