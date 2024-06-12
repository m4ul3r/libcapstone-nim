import libcapstone

import std/[strformat, strutils]

var handle: csh

type
  platform = object
    arch:      cs_arch
    mode:      cs_mode
    code:      ptr uint8
    size:      csize_t
    comment:   string
  
proc printStringHex(comment: cstring, str: ptr uint8, len: csize_t) =
  var pStr = cast[ptr UncheckedArray[uint8]](str)
  stdout.write &"{comment}"
  for i in 0 ..< len:
    stdout.write &"{(pStr[i] and 0xff):#>02X} "
  stdout.writeLine ""

let
  MIPS_CODE  = "\x0C\x10\x00\x97\x00\x00\x00\x00\x24\x02\x00\x0c\x8f\xa2\x00\x00\x34\x21\x34\x56"
  MIPS_CODE2 = "\x56\x34\x21\x34\xc2\x17\x01\x00"
  MIPS_32R6M = "\x00\x07\x00\x07\x00\x11\x93\x7c\x01\x8c\x8b\x7c\x00\xc7\x48\xd0"
  MIPS_32R6  = "\xec\x80\x00\x19\x7c\x43\x22\xa0"
  MIPS_64SD  = "\x70\x00\xb2\xff"

proc test() =
  var platforms: array[6, platform] = [
    platform(
      arch: CS_ARCH_MIPS, 
      mode: cast[cs_mode](CS_MODE_MIPS32.int or CS_MODE_BIG_ENDIAN.int), 
      code: cast[ptr uint8](MIPS_CODE[0].addr), 
      size: MIPS_CODE.len.csize_t, 
      comment: "MIPS-32 (Big-endian)"),
    platform(
      arch: CS_ARCH_MIPS, 
      mode: cast[cs_mode](CS_MODE_MIPS64.int or CS_MODE_LITTLE_ENDIAN.int), 
      code: cast[ptr uint8](MIPS_CODE2[0].addr), 
      size: MIPS_CODE2.len.csize_t, 
      comment: "MIPS-64-EL (Little-endian)"),
    platform(
      arch: CS_ARCH_MIPS, 
      mode: cast[cs_mode](CS_MODE_MIPS32R6.int or CS_MODE_MICRO.int or CS_MODE_BIG_ENDIAN.int), 
      code: cast[ptr uint8](MIPS_32R6M[0].addr), 
      size: MIPS_32R6M.len.csize_t, 
      comment: "MIPS-32R6 | Micro (Big-endian)"),
    platform(
      arch: CS_ARCH_MIPS, 
      mode: cast[cs_mode](CS_MODE_MIPS32R6.int or CS_MODE_BIG_ENDIAN.int), 
      code: cast[ptr uint8](MIPS_32R6[0].addr), 
      size: MIPS_32R6.len.csize_t, 
      comment: "MIPS-32R6 (Big-endian)"),
    platform(
      arch: CS_ARCH_MIPS, 
      mode: cast[cs_mode](CS_MODE_MIPS64.int or CS_MODE_MIPS2.int or CS_MODE_LITTLE_ENDIAN.int), 
      code: cast[ptr uint8](MIPS_64SD[0].addr), 
      size: MIPS_64SD.len.csize_t, 
      comment: "MIPS-64-EL + Mips II (Little-endian)"),
    platform(
      arch: CS_ARCH_MIPS, 
      mode: cast[cs_mode](CS_MODE_MIPS64.int or CS_MODE_LITTLE_ENDIAN.int), 
      code: cast[ptr uint8](MIPS_64SD[0].addr), 
      size: MIPS_64SD.len.csize_t, 
      comment: "MIPS-64-EL (Little-endian)"),
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
  test()