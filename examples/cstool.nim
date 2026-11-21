## A small command-line disassembler in the spirit of Capstone's `cstool`.
##
##   cstool [-d] <target> <hex bytes> [start address]
##   cstool -d x64 "55 48 89 e5 e8 00 00 00 00 c3" 0x1000
##
## Bytes that do not decode are printed as data and skipped one at a time,
## which is what stepping with `decode` is for.

import std/[os, sequtils, strutils]
import libcapstone

const targets = {
  "x16": (CS_ARCH_X86, CS_MODE_16),
  "x32": (CS_ARCH_X86, CS_MODE_32),
  "x64": (CS_ARCH_X86, CS_MODE_64),
  "arm": (CS_ARCH_ARM, CS_MODE_ARM),
  "armbe": (CS_ARCH_ARM, CS_MODE_ARM or CS_MODE_BIG_ENDIAN),
  "thumb": (CS_ARCH_ARM, CS_MODE_THUMB),
  "thumbbe": (CS_ARCH_ARM, CS_MODE_THUMB or CS_MODE_BIG_ENDIAN),
  "arm64": (CS_ARCH_ARM64, CS_MODE_ARM),
  "arm64be": (CS_ARCH_ARM64, CS_MODE_ARM or CS_MODE_BIG_ENDIAN),
  "mips": (CS_ARCH_MIPS, CS_MODE_MIPS32 or CS_MODE_LITTLE_ENDIAN),
  "mipsbe": (CS_ARCH_MIPS, CS_MODE_MIPS32 or CS_MODE_BIG_ENDIAN),
  "mips64": (CS_ARCH_MIPS, CS_MODE_MIPS64 or CS_MODE_LITTLE_ENDIAN),
  "mips64be": (CS_ARCH_MIPS, CS_MODE_MIPS64 or CS_MODE_BIG_ENDIAN),
  "ppc64": (CS_ARCH_PPC, CS_MODE_64 or CS_MODE_LITTLE_ENDIAN),
  "ppc64be": (CS_ARCH_PPC, CS_MODE_64 or CS_MODE_BIG_ENDIAN),
  "sparc": (CS_ARCH_SPARC, CS_MODE_BIG_ENDIAN),
}

proc usage() {.noreturn.} =
  quit "usage: cstool [-d] <target> <hex bytes> [start address]\n" &
       "  -d       also print groups and the registers read and modified\n" &
       "  targets: " & targets.mapIt(it[0]).join(" ")

proc parseHex(text: string): seq[byte] =
  ## Accepts "55 48", "5548", "0x55,0x48" and "\x55\x48".
  let digits = text.multiReplace(("0x", ""), ("\\x", "")).filterIt(it in HexDigits).join
  if digits.len == 0 or digits.len mod 2 != 0:
    quit "cstool: expected an even number of hex digits, got " & $digits.len
  for i in countup(0, digits.high, 2):
    result.add byte(parseHexInt(digits[i .. i + 1]))

proc hex(bytes: openArray[byte]): string =
  bytes.mapIt(toHex(it).toLowerAscii).join(" ")

proc line(address: uint64; bytes: openArray[byte]; text: string): string =
  var digits = toHex(address).strip(trailing = false, chars = {'0'}).toLowerAscii
  if digits.len == 0: digits = "0"
  align(digits, 4) & "  " & alignLeft(hex(bytes), 30) & " " & text

proc printDetail(cs: Capstone; insn: Insn) =
  let groups = @(insn.groups)
  if groups.len > 0:
    echo "\tgroups: ", groups.mapIt($cs.groupName(it)).join(" ")
  try:
    let (read, written) = cs.regsAccess(insn)
    if read.len > 0: echo "\tregisters read: ", read.mapIt($cs.regName(it)).join(" ")
    if written.len > 0: echo "\tregisters modified: ", written.mapIt($cs.regName(it)).join(" ")
  except CapstoneError:
    discard # Capstone does not list register use for this architecture

var args = commandLineParams()
let detail = args.len > 0 and args[0] == "-d"
if detail: args.delete(0)
if args.len notin 2 .. 3: usage()

let target = targets.filterIt(it[0] == args[0])
if target.len == 0: usage()
let
  (arch, mode) = target[0][1]
  code = parseHex(args[1])
  cs = initCapstone(arch, mode, detail = detail)
  insn = cs.newInsn()
var
  offset = 0
  address = if args.len == 3: uint64(parseHexInt(args[2])) else: 0'u64

while offset < code.len:
  let start = offset
  if cs.decode(insn, code, offset, address):
    var text = $insn.mnemonic
    if insn.opStr[0] != '\0': text.add " " & $insn.opStr
    echo line(insn.address, code.toOpenArray(start, offset - 1), text)
    if detail: printDetail(cs, insn)
  else:
    echo line(address, [code[offset]], ".byte")
    inc offset
    inc address
