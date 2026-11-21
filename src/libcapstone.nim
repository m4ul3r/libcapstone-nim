## Nim bindings for the `Capstone <https://www.capstone-engine.org>`_
## disassembly framework.
##
## This module exports two layers:
##
## * the C API under its C names (`cs_open`, `cs_disasm`, `CS_ARCH_X86`, ...),
##   from `libcapstone/raw <libcapstone/raw.html>`_;
## * a small Nim API on top of it: a `Capstone` object that closes itself,
##   iteration over instructions, checked access to instruction detail, and
##   exceptions instead of error codes.
##
## The Nim API needs `--mm:orc` or `--mm:arc` (the default). The C API works
## with any memory manager.
##
## A `Capstone` object belongs to one thread at a time: Capstone keeps
## per-handle state that is not synchronised. Use one object per thread.

runnableExamples:
  let cs = initCapstone(CS_ARCH_X86, CS_MODE_64, detail = true)
  var listing: seq[string]
  for insn in cs.disasm([0x55'u8, 0x48, 0x89, 0xe5, 0xc3], address = 0x1000):
    listing.add $insn
    if insn.id(x86_insn) == X86_INS_MOV:
      for op in insn.x86.ops:
        doAssert op.kind == X86_OP_REG
        doAssert $cs.regName(op.value.reg) in ["rbp", "rsp"]
  doAssert listing == @["0x1000: push rbp", "0x1001: mov rbp, rsp", "0x1004: ret"]

import libcapstone/raw
export raw

when defined(gcDestructors):
  import std/[macros, strutils]

  type
    CapstoneError* = object of CatchableError
      ## A Capstone call failed, or instruction detail was asked for that is
      ## not there. `code` is Capstone's error code.
      code*: cs_err

    Capstone* = object
      ## An open disassembler for one architecture and mode. It is closed when
      ## it goes out of scope, and it cannot be copied, only moved.
      handle: csh
      archValue: cs_arch
      detailOn: bool
      skipdataMnemonic: string # Capstone keeps a pointer to its characters

    Insn* = object
      ## A view of one disassembled instruction. It borrows memory that
      ## `disasm` reuses for the next instruction and that `Instructions`
      ## frees. To keep an instruction longer, `clone` it.
      p: ptr cs_insn
      archValue: cs_arch

    OwnedInsn* = ref object
      ## An instruction that owns its memory: a `clone` of a view, or the slot
      ## `decode` fills. Everything that takes an `Insn` takes this too.
      data: cs_insn
      detailStore: ref cs_detail
      archValue: cs_arch

    Instructions* = object
      ## The instructions of one `disasmAll` call. Owns their memory.
      first: ptr UncheckedArray[cs_insn]
      count: int
      archValue: cs_arch

    ArchUnion = typeof(cs_detail().arch) # the per-architecture union in `cs_detail`

  proc raiseCapstone(code: cs_err; message = "") {.noreturn.} =
    raise (ref CapstoneError)(code: code,
                              msg: if message.len > 0: message else: $cs_strerror(code))

  template check(code: cs_err) =
    let checked = code
    if checked != CS_ERR_OK: raiseCapstone(checked)

  func libraryVersion*(): tuple[major, minor: int] =
    ## The version of the Capstone library in this process.
    var major, minor: cint
    discard cs_version(addr major, addr minor)
    (int(major), int(minor))

  # Capstone

  proc `=destroy`*(cs: Capstone) =
    if cs.handle != 0:
      var handle = cs.handle
      discard cs_close(addr handle)
    `=destroy`(cs.skipdataMnemonic)

  proc `=copy`*(dest: var Capstone; source: Capstone) {.error:
    "a Capstone object cannot be copied; move it or pass it by reference".}

  proc initCapstone*(arch: cs_arch; mode: cs_mode; detail = false): Capstone =
    ## Opens a disassembler. Modes combine with `or`:
    ## `initCapstone(CS_ARCH_MIPS, CS_MODE_MIPS32 or CS_MODE_BIG_ENDIAN)`.
    ##
    ## `detail` asks Capstone to fill in operands, groups and register use for
    ## every instruction (see `detail`); it costs time and memory.
    ##
    ## Raises `CapstoneError`; with `CS_ERR_VERSION` when the Capstone library
    ## in the process is not the version these bindings were generated for.
    var handle: csh
    var err = cs_open(arch, mode, addr handle)
    if err == CS_ERR_VERSION and not libraryMatchesBindings():
      let (major, minor) = libraryVersion()
      raiseCapstone(err, "the loaded Capstone library is version " & $major & "." & $minor &
        ", but these bindings are for Capstone " & $CS_API_MAJOR & "." & $CS_API_MINOR)
    check err
    if detail:
      err = cs_option(handle, CS_OPT_DETAIL, CS_OPT_ON)
      if err != CS_ERR_OK:
        discard cs_close(addr handle)
        raiseCapstone(err)
    Capstone(handle: handle, archValue: arch, detailOn: detail)

  func handle*(cs: Capstone): csh =
    ## The underlying handle, for calling the C API directly. Do not close it.
    cs.handle

  func arch*(cs: Capstone): cs_arch = cs.archValue

  func detail*(cs: Capstone): bool =
    ## Whether instructions come with detail.
    cs.detailOn

  proc `detail=`*(cs: var Capstone; on: bool) =
    check cs_option(cs.handle, CS_OPT_DETAIL, if on: CS_OPT_ON else: CS_OPT_OFF)
    cs.detailOn = on

  proc `syntax=`*(cs: var Capstone; syntax: cs_opt_value) =
    ## Output syntax, such as `CS_OPT_SYNTAX_ATT`.
    check cs_option(cs.handle, CS_OPT_SYNTAX, syntax)

  proc `mode=`*(cs: var Capstone; mode: cs_mode) =
    ## Switches mode, for example between ARM and Thumb.
    check cs_option(cs.handle, CS_OPT_MODE, csize_t(mode))

  proc setOption*(cs: var Capstone; kind: cs_opt_type; value: cs_opt_value) =
    ## Any other `CS_OPT_*` option whose value is a `CS_OPT_*` constant.
    check cs_option(cs.handle, kind, value)

  proc enableSkipdata*(cs: var Capstone; mnemonic = ""; callback: cs_skipdata_cb_t = nil;
                       userData: pointer = nil) =
    ## Keeps going over bytes that do not decode: they come out as data
    ## pseudo-instructions with `id == 0` and no detail, instead of ending the
    ## disassembly. `mnemonic` names them (Capstone's default is ".byte");
    ## `callback` decides how many bytes to skip each time.
    cs.skipdataMnemonic = mnemonic
    var setup = cs_opt_skipdata(callback: callback, user_data: userData)
    if mnemonic.len > 0: setup.mnemonic = cstring(cs.skipdataMnemonic)
    check cs_option(cs.handle, CS_OPT_SKIPDATA_SETUP, addr setup)
    check cs_option(cs.handle, CS_OPT_SKIPDATA, CS_OPT_ON)

  proc disableSkipdata*(cs: var Capstone) =
    check cs_option(cs.handle, CS_OPT_SKIPDATA, CS_OPT_OFF)

  proc setMnemonic*[Id: enum](cs: var Capstone; insn: Id; mnemonic: string) =
    ## Prints `insn` as `mnemonic` from now on; an empty string restores the
    ## original.
    var custom = cs_opt_mnem(id: cuint(ord(insn)))
    if mnemonic.len > 0: custom.mnemonic = cstring(mnemonic)
    check cs_option(cs.handle, CS_OPT_MNEMONIC, addr custom)

  proc regName*[Reg: enum | SomeInteger](cs: Capstone; reg: Reg): cstring =
    ## Name of a register id, as an arch enum (`X86_REG_RAX`) or as the plain
    ## number found in `regsRead`, `regsWrite` and `regsAccess`.
    cs_reg_name(cs.handle, cuint(ord(reg)))

  proc insnName*[Id: enum | SomeInteger](cs: Capstone; insn: Id): cstring =
    cs_insn_name(cs.handle, cuint(ord(insn)))

  proc groupName*[Group: enum | SomeInteger](cs: Capstone; group: Group): cstring =
    cs_group_name(cs.handle, cuint(ord(group)))

  # Insn

  func toInsn*(cs: Capstone; raw: ptr cs_insn): Insn =
    ## A view of an instruction obtained from the C API with `cs.handle`.
    Insn(p: raw, archValue: cs.archValue)

  func raw*(insn: Insn): ptr cs_insn =
    ## The C struct behind the view.
    insn.p

  func arch*(insn: Insn): cs_arch = insn.archValue

  func id*(insn: Insn): cuint =
    ## Instruction id; 0 for data skipped in skipdata mode.
    insn.p.id

  func id*[Id: enum](insn: Insn; T: typedesc[Id]): Id =
    ## The id as the arch's instruction enum: `insn.id(x86_insn) == X86_INS_CALL`.
    T(insn.p.id)

  func address*(insn: Insn): uint64 = insn.p.address
  func size*(insn: Insn): int = int(insn.p.size)
  func mnemonic*(insn: Insn): cstring = cast[cstring](addr insn.p.mnemonic)
  func opStr*(insn: Insn): cstring = cast[cstring](addr insn.p.op_str)

  template bytes*(insn: Insn): openArray[byte] =
    ## The machine code of the instruction.
    toOpenArray(insn.raw.bytes, 0, insn.size - 1)

  func `$`*(insn: Insn): string =
    ## `"0x1000: mov rbp, rsp"`.
    result = "0x" & toLowerAscii(toHex(insn.address).strip(trailing = false, chars = {'0'}))
    if result.len == 2: result.add '0'
    result.add ": "
    result.add insn.mnemonic
    if insn.opStr[0] != '\0':
      result.add ' '
      result.add insn.opStr

  func hasDetail*(insn: Insn): bool =
    ## False when detail is off, and for data skipped in skipdata mode.
    # Skipped data has id 0, and under `disasm` a detail pointer left over from
    # the instruction before. In EVM, id 0 is a real instruction (STOP).
    insn.p.detail != nil and (insn.p.id != 0 or insn.archValue == CS_ARCH_EVM)

  proc detail*(insn: Insn): ptr cs_detail =
    ## The architecture-independent detail. Raises `CapstoneError`
    ## (`CS_ERR_DETAIL`) when there is none: detail is off, or this is data
    ## skipped in skipdata mode.
    if not insn.hasDetail:
      raiseCapstone(CS_ERR_DETAIL,
                    "no detail for this instruction: detail is off, or it is skipped data")
    insn.p.detail

  template groups*(insn: Insn): openArray[uint8] =
    ## Ids of the semantic groups the instruction belongs to.
    toOpenArray(detail(insn).groups, 0, int(detail(insn).groups_count) - 1)

  template regsRead*(insn: Insn): openArray[uint16] =
    ## Registers the instruction reads implicitly (not named in its operands).
    toOpenArray(detail(insn).regs_read, 0, int(detail(insn).regs_read_count) - 1)

  template regsWrite*(insn: Insn): openArray[uint16] =
    ## Registers the instruction modifies implicitly.
    toOpenArray(detail(insn).regs_write, 0, int(detail(insn).regs_write_count) - 1)

  proc inGroup*[Group: enum](insn: Insn; group: Group): bool =
    ## `insn.inGroup(X86_GRP_CALL)`.
    uint8(ord(group)) in insn.groups

  proc regsAccess*(cs: Capstone; insn: Insn): tuple[read, written: seq[uint16]] =
    ## Every register the instruction reads and modifies, named in its operands
    ## or implicit. Not available for every architecture.
    var
      read, written: cs_regs
      readCount, writtenCount: uint8
    check cs_regs_access(cs.handle, insn.p, read, addr readCount, written, addr writtenCount)
    (read[0 ..< int(readCount)], written[0 ..< int(writtenCount)])

  proc archDetail(insn: Insn; arch: cs_arch; member: string): ptr ArchUnion =
    if insn.archValue != arch:
      raiseCapstone(CS_ERR_DETAIL, "no " & member & " detail: this is a " & $insn.archValue &
                                   " instruction")
    addr detail(insn).arch

  macro declareArchAccessors(): untyped =
    ## For every member of the per-architecture union, such as `x86: cs_x86`:
    ## an accessor `insn.x86`. Also `ArchDetail`, the type class of the members
    ## that list operands.
    result = newStmtList()
    var withOperands: NimNode
    for member in bindSym("ArchUnion").getTypeImpl[2]:
      let
        text = member[0].strVal
        name = ident(text)
        arch = ident("CS_ARCH_" & text.toUpperAscii)
        doc = newCommentStmtNode("The " & text & " detail of the instruction. Raises " &
          "`CapstoneError` when there is no detail or the instruction is of another architecture.")
      result.add quote do:
        template `name`*(insn: Insn): untyped =
          `doc`
          archDetail(insn, `arch`, `text`).`name`
      var fields: seq[string]
      for field in member[1].getTypeImpl[2]: fields.add field[0].strVal
      if "operands" in fields and "op_count" in fields:
        withOperands = if withOperands == nil: member[1]
                       else: infix(withOperands, "|", member[1])
    let archDetail = ident("ArchDetail")
    result.add quote do:
      type `archDetail`* = `withOperands`

  declareArchAccessors()

  template ops*(detail: ArchDetail): untyped =
    ## The operands of the instruction: `for op in insn.x86.ops`.
    toOpenArray(detail.operands, 0, int(detail.op_count) - 1)

  # Disassembly

  iterator disasm*(cs: Capstone; code: openArray[byte]; address = 0'u64): Insn =
    ## Disassembles `code`, loaded at `address`, one instruction at a time and
    ## in constant memory. The yielded `Insn` is overwritten by the next step.
    ##
    ## Stops at the end of `code` or at the first bytes that do not decode;
    ## `enableSkipdata` makes it continue past those.
    if code.len > 0:
      let cache = cs_malloc(cs.handle)
      if cache == nil: raiseCapstone(CS_ERR_MEM)
      try:
        var
          cursor = unsafeAddr code[0]
          remaining = csize_t(code.len)
          address = address
        while cs_disasm_iter(cs.handle, addr cursor, addr remaining, addr address, cache):
          yield Insn(p: cache, archValue: cs.archValue)
        check cs_errno(cs.handle)
      finally:
        cs_free(cache, 1)

  iterator disasm*(cs: Capstone; code: string; address = 0'u64): Insn =
    ## `disasm` over the bytes of a string.
    for insn in cs.disasm(code.toOpenArrayByte(0, code.high), address):
      yield insn

  proc `=destroy`*(insns: Instructions) =
    if insns.first != nil: cs_free(addr insns.first[0], csize_t(insns.count))

  proc `=copy`*(dest: var Instructions; source: Instructions) {.error:
    "Instructions cannot be copied; move them or pass them by reference".}

  proc disasmAll*(cs: Capstone; code: openArray[byte]; address = 0'u64; maxCount = 0): Instructions =
    ## Disassembles `code` in one go, at most `maxCount` instructions (0: all).
    ## The result owns about 250 bytes per instruction, plus detail; prefer
    ## `disasm` for large inputs.
    result = Instructions(archValue: cs.archValue)
    if code.len > 0:
      var first: ptr cs_insn
      let count = cs_disasm(cs.handle, code, address, csize_t(maxCount), addr first)
      if count == 0: check cs_errno(cs.handle)
      result.first = cast[ptr UncheckedArray[cs_insn]](first)
      result.count = int(count)

  proc disasmAll*(cs: Capstone; code: string; address = 0'u64; maxCount = 0): Instructions =
    ## `disasmAll` over the bytes of a string.
    cs.disasmAll(code.toOpenArrayByte(0, code.high), address, maxCount)

  func len*(insns: Instructions): int = insns.count

  proc `[]`*(insns: Instructions; index: int): Insn =
    if index notin 0 ..< insns.count:
      raise newException(IndexDefect, "index " & $index & " not in 0 .. " & $(insns.count - 1))
    Insn(p: addr insns.first[index], archValue: insns.archValue)

  iterator items*(insns: Instructions): Insn =
    for index in 0 ..< insns.count:
      yield Insn(p: addr insns.first[index], archValue: insns.archValue)

  # Owned instructions

  converter toInsn*(owned: OwnedInsn): Insn =
    ## The view of an owned instruction; valid for as long as `owned` is alive.
    Insn(p: addr owned.data, archValue: owned.archValue)

  func `$`*(owned: OwnedInsn): string = $toInsn(owned)

  proc clone*(insn: Insn): OwnedInsn =
    ## A copy of the instruction, detail included, that stays valid after the
    ## loop that produced `insn` has moved on.
    result = OwnedInsn(data: insn.p[], archValue: insn.archValue)
    if insn.hasDetail:
      new(result.detailStore)
      result.detailStore[] = insn.p.detail[]
      result.data.detail = addr result.detailStore[]
    else:
      result.data.detail = nil

  proc newInsn*(cs: Capstone): OwnedInsn =
    ## An empty instruction for `decode` to fill.
    OwnedInsn(archValue: cs.archValue)

  proc decode*(cs: Capstone; into: OwnedInsn; code: openArray[byte]; offset: var int;
               address: var uint64): bool =
    ## Decodes the one instruction at `code[offset]` into `into`, which can be
    ## reused from call to call. On success, advances `offset` and `address`
    ## past the instruction and returns true.
    ##
    ## Returns false, leaving `offset` and `address` alone, at the end of `code`
    ## and when the bytes there do not decode. The caller decides how to go on,
    ## for example by skipping a byte; `into` is unspecified until the next
    ## successful call.
    if offset < 0 or offset >= code.len: return false
    # Capstone writes detail through this pointer whenever its detail option is
    # on, so it always gets real memory, even if `cs` believes detail is off.
    if into.detailStore == nil: new(into.detailStore)
    into.data.detail = addr into.detailStore[]
    into.archValue = cs.archValue
    var
      cursor = unsafeAddr code[offset]
      remaining = csize_t(code.len - offset)
      next = address
    let decoded = cs_disasm_iter(cs.handle, addr cursor, addr remaining, addr next, addr into.data)
    if not cs.detailOn: into.data.detail = nil
    if decoded:
      offset = code.len - int(remaining)
      address = next
    else:
      check cs_errno(cs.handle)
    decoded

  proc decode*(cs: Capstone; into: OwnedInsn; code: string; offset: var int;
               address: var uint64): bool =
    ## `decode` over the bytes of a string.
    cs.decode(into, code.toOpenArrayByte(0, code.high), offset, address)

else:
  template initCapstone*(arch: cs_arch; mode: cs_mode; detail = false): untyped =
    {.error: "libcapstone's Nim API needs --mm:orc or --mm:arc. " &
             "The C API (cs_open, cs_disasm, ...) works with any memory manager.".}
