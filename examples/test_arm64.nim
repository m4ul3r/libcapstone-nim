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
  ARM64_CODE = "\x09\x00\x38\xd5\xbf\x40\x00\xd5\x0c\x05\x13\xd5\x20\x50\x02\x0e\x20\xe4\x3d\x0f\x00\x18\xa0\x5f\xa2\x00\xae\x9e\x9f\x37\x03\xd5\xbf\x33\x03\xd5\xdf\x3f\x03\xd5\x21\x7c\x02\x9b\x21\x7c\x00\x53\x00\x40\x21\x4b\xe1\x0b\x40\xb9\x20\x04\x81\xda\x20\x08\x02\x8b\x10\x5b\xe8\x3c"


proc test() =
  var platforms: array[1, platform] = [
    platform(
      arch: CS_ARCH_ARM64, 
      mode: CS_MODE_ARM, 
      code: cast[ptr uint8](ARM64_CODE[0].addr), 
      size: ARM64_CODE.len.csize_t, 
      comment: "ARM-64"),
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