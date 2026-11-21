/* Build-time check that the Capstone headers the C compiler sees are the ones
 * the Nim bindings were generated from. Capstone changes struct layouts and
 * renumbers enums between releases (and between 6.0 alphas that all report the
 * same version), and the Nim side cannot notice on its own.
 *
 * The expected values are passed as -DLCN_* by raw.nim. */

#if defined(__has_include)
#  if !__has_include(<capstone.h>) && __has_include(<capstone/capstone.h>)
#    include <capstone/capstone.h>
#  else
#    include <capstone.h>
#  endif
#else
#  include <capstone.h>
#endif

#if CS_API_MAJOR != LCN_API_MAJOR || CS_API_MINOR != LCN_API_MINOR
#  error "libcapstone: capstone.h is not the Capstone version the Nim bindings were generated from"
#endif

#if defined(__cplusplus)
#  define LCN_CHECK(cond, msg) static_assert(cond, msg)
#elif defined(__STDC_VERSION__) && __STDC_VERSION__ >= 201112L
#  define LCN_CHECK(cond, msg) _Static_assert(cond, msg)
#else
#  define LCN_JOIN2(a, b) a##b
#  define LCN_JOIN(a, b) LCN_JOIN2(a, b)
#  define LCN_CHECK(cond, msg) typedef char LCN_JOIN(lcn_check_, __LINE__)[(cond) ? 1 : -1]
#endif

LCN_CHECK(sizeof(cs_insn) == LCN_SIZEOF_CS_INSN,
          "libcapstone: cs_insn layout differs from the Nim bindings");
LCN_CHECK(sizeof(cs_detail) == LCN_SIZEOF_CS_DETAIL,
          "libcapstone: cs_detail layout differs from the Nim bindings");
LCN_CHECK(CS_OP_MEM == LCN_CS_OP_MEM && CS_OP_FP == LCN_CS_OP_FP,
          "libcapstone: cs_op_type numbering differs from the Nim bindings");
LCN_CHECK(X86_INS_ENDING == LCN_X86_INS_ENDING,
          "libcapstone: x86_insn numbering differs from the Nim bindings");
LCN_CHECK(ARM_INS_ENDING == LCN_ARM_INS_ENDING,
          "libcapstone: arm_insn numbering differs from the Nim bindings");
LCN_CHECK(PPC_INS_ENDING == LCN_PPC_INS_ENDING,
          "libcapstone: ppc_insn numbering differs from the Nim bindings");
