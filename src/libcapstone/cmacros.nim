## C macros of the Capstone headers that the generator cannot translate: it
## only understands macros that are plain literals. Included by `raw.nim`.
## The same in Capstone 4 and 5; `tests/tmacros.nim` compares the values with
## the installed headers.

const
  CS_SUPPORT_DIET* = cint(ord(CS_ARCH_ALL) + 1)
    ## Query for `cs_support`: is the library a "diet" build?
  CS_SUPPORT_X86_REDUCE* = cint(ord(CS_ARCH_ALL) + 2)
    ## Query for `cs_support`: was the library built with the reduced x86 set?

template CS_MAKE_VERSION*(major, minor: untyped): untyped =
  ## The value `cs_version` returns for `major.minor`.
  (major shl 8) + minor

template CS_INSN_OFFSET*(insns: ptr UncheckedArray[cs_insn]; post: int): uint64 =
  ## Offset of instruction number `post` (counted from 1) from the first one.
  insns[post - 1].address - insns[0].address

func X86_REL_ADDR*(insn: cs_insn): uint64 =
  ## Target of an x86 instruction that addresses relative to itself. Needs
  ## `CS_OPT_DETAIL`.
  let x86 = addr insn.detail.arch.x86
  if x86.operands[0].kind == X86_OP_IMM:
    cast[uint64](x86.operands[0].value.imm)
  else:
    insn.address + insn.size + cast[uint64](x86.disp)

const
  # Bits of `cs_x86.flags.eflags`.
  X86_EFLAGS_MODIFY_AF* = 1'u64 shl 0
  X86_EFLAGS_MODIFY_CF* = 1'u64 shl 1
  X86_EFLAGS_MODIFY_SF* = 1'u64 shl 2
  X86_EFLAGS_MODIFY_ZF* = 1'u64 shl 3
  X86_EFLAGS_MODIFY_PF* = 1'u64 shl 4
  X86_EFLAGS_MODIFY_OF* = 1'u64 shl 5
  X86_EFLAGS_MODIFY_TF* = 1'u64 shl 6
  X86_EFLAGS_MODIFY_IF* = 1'u64 shl 7
  X86_EFLAGS_MODIFY_DF* = 1'u64 shl 8
  X86_EFLAGS_MODIFY_NT* = 1'u64 shl 9
  X86_EFLAGS_MODIFY_RF* = 1'u64 shl 10
  X86_EFLAGS_PRIOR_OF* = 1'u64 shl 11
  X86_EFLAGS_PRIOR_SF* = 1'u64 shl 12
  X86_EFLAGS_PRIOR_ZF* = 1'u64 shl 13
  X86_EFLAGS_PRIOR_AF* = 1'u64 shl 14
  X86_EFLAGS_PRIOR_PF* = 1'u64 shl 15
  X86_EFLAGS_PRIOR_CF* = 1'u64 shl 16
  X86_EFLAGS_PRIOR_TF* = 1'u64 shl 17
  X86_EFLAGS_PRIOR_IF* = 1'u64 shl 18
  X86_EFLAGS_PRIOR_DF* = 1'u64 shl 19
  X86_EFLAGS_PRIOR_NT* = 1'u64 shl 20
  X86_EFLAGS_RESET_OF* = 1'u64 shl 21
  X86_EFLAGS_RESET_CF* = 1'u64 shl 22
  X86_EFLAGS_RESET_DF* = 1'u64 shl 23
  X86_EFLAGS_RESET_IF* = 1'u64 shl 24
  X86_EFLAGS_RESET_SF* = 1'u64 shl 25
  X86_EFLAGS_RESET_AF* = 1'u64 shl 26
  X86_EFLAGS_RESET_TF* = 1'u64 shl 27
  X86_EFLAGS_RESET_NT* = 1'u64 shl 28
  X86_EFLAGS_RESET_PF* = 1'u64 shl 29
  X86_EFLAGS_SET_CF* = 1'u64 shl 30
  X86_EFLAGS_SET_DF* = 1'u64 shl 31
  X86_EFLAGS_SET_IF* = 1'u64 shl 32
  X86_EFLAGS_TEST_OF* = 1'u64 shl 33
  X86_EFLAGS_TEST_SF* = 1'u64 shl 34
  X86_EFLAGS_TEST_ZF* = 1'u64 shl 35
  X86_EFLAGS_TEST_PF* = 1'u64 shl 36
  X86_EFLAGS_TEST_CF* = 1'u64 shl 37
  X86_EFLAGS_TEST_NT* = 1'u64 shl 38
  X86_EFLAGS_TEST_DF* = 1'u64 shl 39
  X86_EFLAGS_UNDEFINED_OF* = 1'u64 shl 40
  X86_EFLAGS_UNDEFINED_SF* = 1'u64 shl 41
  X86_EFLAGS_UNDEFINED_ZF* = 1'u64 shl 42
  X86_EFLAGS_UNDEFINED_PF* = 1'u64 shl 43
  X86_EFLAGS_UNDEFINED_AF* = 1'u64 shl 44
  X86_EFLAGS_UNDEFINED_CF* = 1'u64 shl 45
  X86_EFLAGS_RESET_RF* = 1'u64 shl 46
  X86_EFLAGS_TEST_RF* = 1'u64 shl 47
  X86_EFLAGS_TEST_IF* = 1'u64 shl 48
  X86_EFLAGS_TEST_TF* = 1'u64 shl 49
  X86_EFLAGS_TEST_AF* = 1'u64 shl 50
  X86_EFLAGS_RESET_ZF* = 1'u64 shl 51
  X86_EFLAGS_SET_OF* = 1'u64 shl 52
  X86_EFLAGS_SET_SF* = 1'u64 shl 53
  X86_EFLAGS_SET_ZF* = 1'u64 shl 54
  X86_EFLAGS_SET_AF* = 1'u64 shl 55
  X86_EFLAGS_SET_PF* = 1'u64 shl 56
  X86_EFLAGS_RESET_0F* = 1'u64 shl 57
  X86_EFLAGS_RESET_AC* = 1'u64 shl 58

  # Bits of `cs_x86.flags.fpu_flags`.
  X86_FPU_FLAGS_MODIFY_C0* = 1'u64 shl 0
  X86_FPU_FLAGS_MODIFY_C1* = 1'u64 shl 1
  X86_FPU_FLAGS_MODIFY_C2* = 1'u64 shl 2
  X86_FPU_FLAGS_MODIFY_C3* = 1'u64 shl 3
  X86_FPU_FLAGS_RESET_C0* = 1'u64 shl 4
  X86_FPU_FLAGS_RESET_C1* = 1'u64 shl 5
  X86_FPU_FLAGS_RESET_C2* = 1'u64 shl 6
  X86_FPU_FLAGS_RESET_C3* = 1'u64 shl 7
  X86_FPU_FLAGS_SET_C0* = 1'u64 shl 8
  X86_FPU_FLAGS_SET_C1* = 1'u64 shl 9
  X86_FPU_FLAGS_SET_C2* = 1'u64 shl 10
  X86_FPU_FLAGS_SET_C3* = 1'u64 shl 11
  X86_FPU_FLAGS_UNDEFINED_C0* = 1'u64 shl 12
  X86_FPU_FLAGS_UNDEFINED_C1* = 1'u64 shl 13
  X86_FPU_FLAGS_UNDEFINED_C2* = 1'u64 shl 14
  X86_FPU_FLAGS_UNDEFINED_C3* = 1'u64 shl 15
  X86_FPU_FLAGS_TEST_C0* = 1'u64 shl 16
  X86_FPU_FLAGS_TEST_C1* = 1'u64 shl 17
  X86_FPU_FLAGS_TEST_C2* = 1'u64 shl 18
  X86_FPU_FLAGS_TEST_C3* = 1'u64 shl 19
