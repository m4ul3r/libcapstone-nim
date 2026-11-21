# libcapstone-nim

Nim bindings for the [Capstone](https://www.capstone-engine.org) disassembly framework, versions 4.0.x and 5.0.x:

- the C API under its C names, generated with [Futhark](https://github.com/PMunch/futhark);
- a small Nim API on top: a disassembler object that closes itself, iteration over instructions, checked access to instruction detail, exceptions instead of error codes.

```nim
import libcapstone

let cs = initCapstone(CS_ARCH_X86, CS_MODE_64, detail = true)

for insn in cs.disasm([0x55'u8, 0x48, 0x89, 0xe5, 0xc3], address = 0x1000):
  echo insn                                  # 0x1001: mov rbp, rsp
  for op in insn.x86.ops:
    if op.kind == X86_OP_REG:
      echo "  ", cs.regName(op.value.reg)
```

## Install

Capstone itself comes from the system:

| System | Package |
|---|---|
| Debian, Ubuntu | `libcapstone-dev` |
| Fedora | `capstone-devel` |
| Arch, Homebrew, MSYS2 | `capstone` |

Then `nimble install libcapstone`. The build finds Capstone through `pkg-config`; see [Build options](#build-options) for the other cases.

Needs Nim 2.0 or later. Tested on Linux x86-64 with Nim 2.0.16, 2.2.10 and 2.4.2 against Capstone 4.0.2 and 5.0.9, and cross-compiled to Windows with MinGW (run under Wine). macOS is untested.

## The Nim API

Needs `--mm:orc` or `--mm:arc`, the defaults. `nimble docs` builds the full reference; `examples/basic.nim` and `examples/x86_detail.nim` show it in use.

```nim
import libcapstone

let code = "\x55\x48\x89\xe5\xe8\x00\x00\x00\x00\xc3"   # an openArray[byte] works too

var cs = initCapstone(CS_ARCH_X86, CS_MODE_64)

# Options.
cs.detail = true
cs.syntax = CS_OPT_SYNTAX_ATT
cs.enableSkipdata(mnemonic = "db")      # keep going over bytes that do not decode
cs.setMnemonic(X86_INS_RET, "return")

# One instruction at a time, in constant memory.
for insn in cs.disasm(code, address = 0x1000):
  echo insn.address, " ", insn.size, " ", insn.mnemonic, " ", insn.opStr   # cstrings; `$` to keep
  echo insn.bytes                       # openArray[byte] of `size` bytes
  if insn.id(x86_insn) == X86_INS_CALL: echo "a call"
  if insn.inGroup(X86_GRP_RET): echo "a return"

# All at once; the result owns the instructions.
let insns = cs.disasmAll(code, address = 0x1000)
echo insns.len, " instructions, the first is ", insns[0]

# Modes combine with `or`.
let mips = initCapstone(CS_ARCH_MIPS, CS_MODE_MIPS32 or CS_MODE_BIG_ENDIAN)
```

- **Lifetime.** `Capstone` and `Instructions` free what they own when they go out of scope and cannot be copied. An `Insn` is a view: inside `disasm` it is overwritten by the next step, and one taken from `Instructions` dies with them.
- **Detail.** `insn.detail`, `insn.groups`, `insn.regsRead`, `insn.regsWrite` and the per-architecture accessors (`insn.x86`, `insn.arm`, `insn.arm64`, `insn.mips`, `insn.ppc`, ...) raise `CapstoneError` when there is nothing to read: detail is off, the item is skipped data, or the instruction is of another architecture. `insn.hasDetail` asks first. `cs.regsAccess(insn)` lists every register read and written.
- **Errors.** `CapstoneError` carries Capstone's error code in `code`.
- **Disassembly stops** at the first bytes that do not decode unless skipdata is on. Skipped data comes out as items with `id == 0`.
- **Threads.** One `Capstone` per thread. Capstone keeps unsynchronised state per handle.
- `cs.handle` gives the C handle, and `cs.toInsn(ptr)` wraps a `ptr cs_insn`, so both APIs can be mixed.

## The C API

`import libcapstone` (or only `import libcapstone/raw`) gives Capstone's own names and signatures, so C code and the Capstone documentation carry over. `examples/raw_api.nim` is a complete program. It works with every memory manager.

Where it differs from C:

| C | Here | Why |
|---|---|---|
| `cs_open` | returns `CS_ERR_VERSION` if the loaded library is not the version the bindings are for | struct layouts differ between versions; see below |
| `cs_mode` enum | `distinct uint32`; combine with `or` | a Nim enum cannot hold `CS_MODE_MIPS32 \| CS_MODE_BIG_ENDIAN` |
| field `type` | `kind` | `type` is a keyword in Nim |
| anonymous unions | `detail.arch.x86`, `op.value.reg` / `.imm` / `.mem`, `x86.flags.eflags`, `m68k_op_size.size` | Nim needs a name for them |
| `cs_regs_access(..., cs_regs regs_read, ...)` | takes `var cs_regs` | C writes into the arrays |
| `cs_disasm_ex` | not available | deprecated in Capstone 4, removed in 5 |
| `MIPS_INS_DIV_U`, `MIPS_INS_MAX_A`, `MIPS_INS_MIN_A`, `MIPS_INS_MOD_U`, `PPC_INS_DCBZ_L` | carry the suffix `_enumval` | Nim ignores underscores in names, so they collide with `MIPS_INS_DIVU` and friends |

Added on top, because C takes plain integers and pointers:

- `$insn.mnemonic` and `$insn.op_str` give the text of the fixed C buffers.
- `cs_disasm(handle, code, address, count, addr insn)` takes an `openArray[byte]`.
- `cs_option(handle, CS_OPT_DETAIL, CS_OPT_ON)` takes the option constant; struct options take a pointer.
- `cs_reg_name`, `cs_insn_name`, `cs_group_name`, `cs_insn_group`, `cs_reg_read`, `cs_reg_write`, `cs_op_count`, `cs_op_index` and `cs_support` accept the enums the ids come from.
- The macros the generator cannot translate are written by hand: `X86_EFLAGS_*`, `X86_FPU_FLAGS_*`, `CS_SUPPORT_DIET`, `CS_SUPPORT_X86_REDUCE`, `CS_MAKE_VERSION`, `CS_INSN_OFFSET`, `X86_REL_ADDR`.

## Supported Capstone versions

| Capstone | Status | Shipped by (late 2026) |
|---|---|---|
| 4.0.x | supported | Ubuntu 22.04 and 24.04, Debian 11 and 12 |
| 5.0.2 and later 5.0.x | supported | Ubuntu 25.04 and later, Debian 13, Fedora 43 and later, Arch, Homebrew, MSYS2, vcpkg |
| 5.0, 5.0.1 | refused | Fedora 40 to 42, CentOS Stream 10, Alpine 3.19 and 3.20 |
| 6.x | refused until 6.0.0 is released | none |

Capstone changes struct layouts and renumbers enums between major versions, and 5.0 / 5.0.1 number two operand-type constants differently from later 5.0.x. Bindings for one version used with a library of another read garbage, so this package checks three times:

1. **Build time, pkg-config.** The reported version selects the bindings; an unsupported one stops the build.
2. **Build time, headers.** A small C file compares `capstone.h` with the bindings (struct sizes, enum sentinels).
3. **Run time.** `cs_open` and `initCapstone` fail with `CS_ERR_VERSION` when the library actually loaded is another version. `libraryMatchesBindings()` tells without opening anything.

## Build options

| Define | Effect |
|---|---|
| `-d:capstoneStatic` | link `libcapstone.a` from pkg-config's library directory instead of the shared library |
| `-d:capstoneLibs="..."` | linker flags to use; pkg-config is not consulted at all |
| `-d:capstoneMajor=4` or `5` | major version of that library; required with `capstoneLibs` |
| `-d:capstoneCflags="..."` | where that library's headers are; without it the header check is skipped |
| `-d:capstoneNoHeaderCheck` | skip the header check |

Cross-compiling uses the last three, because pkg-config describes the host. For Windows from Linux, with a Capstone built by MinGW in `$CS`:

```
nim c -d:mingw --cpu:amd64 \
  -d:capstoneLibs="$CS/lib/libcapstone.a" -d:capstoneMajor=5 \
  -d:capstoneCflags="-I$CS/include/capstone" app.nim
```

`nim check` and nimsuggest cannot run pkg-config; there the Capstone 5 bindings are assumed unless `-d:capstoneMajor` says otherwise.

## Development

```
nimble test        # needs pkg-config and a C compiler; the layout test also needs clang
nimble examples
nimble docs        # into htmldocs/
```

To test against another Capstone than the system one:

```
PKG_CONFIG_PATH=<prefix>/lib/pkgconfig LD_LIBRARY_PATH=<prefix>/lib nimble test
```

Layout:

| Path | Content |
|---|---|
| `src/libcapstone.nim` | the Nim API; re-exports the C API |
| `src/libcapstone/raw.nim` | selects the bindings for the installed Capstone, version checks, corrections and overloads |
| `src/libcapstone/gen_v4.nim`, `gen_v5.nim` | generated bindings; do not edit |
| `src/libcapstone/cmacros.nim` | hand-written C macros |
| `src/libcapstone/private/` | build configuration, header check |
| `tools/gen.nim` | the generator |

### Regenerating the bindings

`nimble regen` rewrites `src/libcapstone/gen_v<major>.nim` from the headers pkg-config points at; set `PKG_CONFIG_PATH` to generate for another Capstone. It takes a few seconds and its output is reproducible. Run the tests afterwards: `tests/tlayout.nim` compares every struct with the C compiler's layout.

It needs:

- Nim 2.4 or later;
- Futhark 0.16.1 (the nimble task pins it) with its `opir` helper on the `PATH`;
- a `clang` on the `PATH` whose major version matches the libclang `opir` was linked against; otherwise the headers fail to parse (`unknown type name 'intmax_t'`).

Installing Futhark needs an unversioned `libclang.so`. On Debian and Ubuntu that comes with `libclang-dev`; without it:

```
ln -s /usr/lib/llvm-18/lib/libclang.so.1 <dir>/libclang.so
nimble install --passL:"-L<dir>" futhark@0.16.1
```

## License

MIT, see `LICENSE`. Capstone has its own license (BSD 3-clause).
