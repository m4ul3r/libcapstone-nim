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
    opt_type:  cs_opt_type
    opt_value: cs_opt_value
  
proc printStringHex(comment: cstring, str: ptr uint8, len: csize_t) =
  var pStr = cast[ptr UncheckedArray[uint8]](str)
  stdout.write &"{comment}"
  for i in 0 ..< len:
    stdout.write &"{(pStr[i] and 0xff):#>02X} "
  stdout.writeLine ""

let
  X86_CODE16 = "\x8d\x4c\x32\x08\x01\xd8\x81\xc6\x34\x12\x00\x00\x05\x23\x01\x00\x00\x36\x8b\x84\x91\x23\x01\x00\x00\x41\x8d\x84\x39\x89\x67\x00\x00\x8d\x87\x89\x67\x00\x00\xb4\xc6\x66\xe9\xb8\x00\x00\x00\x67\xff\xa0\x23\x01\x00\x00\x66\xe8\xcb\x00\x00\x00\x74\xfc"
  X86_CODE32 = "\x8d\x4c\x32\x08\x01\xd8\x81\xc6\x34\x12\x00\x00\x05\x23\x01\x00\x00\x36\x8b\x84\x91\x23\x01\x00\x00\x41\x8d\x84\x39\x89\x67\x00\x00\x8d\x87\x89\x67\x00\x00\xb4\xc6\xe9\xea\xbe\xad\xde\xff\xa0\x23\x01\x00\x00\xe8\xdf\xbe\xad\xde\x74\xff"
  X86_CODE64 = "\x55\x48\x8b\x05\xb8\x13\x00\x00\xe9\xea\xbe\xad\xde\xff\x25\x23\x01\x00\x00\xe8\xdf\xbe\xad\xde\x74\xff"

proc test() =
  var platforms: array[3, platform] = [
    platform(
      arch: CS_ARCH_x86, 
      mode: CS_MODE_16, 
      code: cast[ptr uint8](X86_CODE16[0].addr), 
      size: X86_CODE16.len.csize_t, 
      comment: "X86 16bit (Intel Sytax)"),
    platform(
      arch: CS_ARCH_x86, 
      mode: CS_MODE_32, 
      code: cast[ptr uint8](X86_CODE32[0].addr), 
      size: X86_CODE32.len.csize_t, 
      comment: "X86 32bit (Intel Sytax)"),
    platform(
      arch: CS_ARCH_x86, 
      mode: CS_MODE_64, 
      code: cast[ptr uint8](X86_CODE64[0].addr), 
      size: X86_CODE64.len.csize_t, 
      comment: "X86 64bit (Intel Sytax)")
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
    
    if cast[bool](platforms[i].opt_type):
      discard cs_option(handle, platforms[i].opt_type, platforms[i].opt_value.csize_t)

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
        echo &"0x{pinsn[j].address}:\t{CPTR(pinsn[j].mnemonic)}\t{CPTR(pinsn[j].op_str)}"
      echo &"0x{pinsn[count-1].address + pinsn[count-1].size}"
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