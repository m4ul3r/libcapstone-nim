
{.warning[UnusedImport]: off.}
{.hint[XDeclaredButNotUsed]: off.}
from macros import hint

from os import parentDir

when not declared(enumcsarch):
  type
    enumcsarch* {.size: sizeof(cuint).} = enum
      Csarcharm = 0, Csarcharm64 = 1, Csarchmips = 2, Csarchx86 = 3,
      Csarchppc = 4, Csarchsparc = 5, Csarchsysz = 6, Csarchxcore = 7,
      Csarchm68k = 8, Csarchtms320c64x = 9, Csarchm680x = 10, Csarchevm = 11,
      Csarchmax = 12, Csarchall = 65535
else:
  static :
    hint("Declaration of " & "enumcsarch" & " already exists, not redeclaring")
when not declared(enumcsmode):
  type
    enumcsmode* {.size: sizeof(cint).} = enum
      Csmodebigendian = -2147483648, Csmodelittleendian = 0, Csmode16 = 2,
      Csmode32 = 4, Csmode64 = 8, Csmodethumb = 16, Csmodemclass = 32,
      Csmodev8 = 64, Csmodemips2 = 128, Csmodem680x6811 = 256,
      Csmodem680xcpu12 = 512, Csmodem680xhcs08 = 1024
else:
  static :
    hint("Declaration of " & "enumcsmode" & " already exists, not redeclaring")
when not declared(Csmodearm):
  const
    Csmodearm* = enumcsmode.Csmodelittleendian
else:
  static :
    hint("Declaration of " & "Csmodearm" & " already exists, not redeclaring")
when not declared(Csmodemicro):
  const
    Csmodemicro* = enumcsmode.Csmodethumb
else:
  static :
    hint("Declaration of " & "Csmodemicro" & " already exists, not redeclaring")
when not declared(Csmodemips3):
  const
    Csmodemips3* = enumcsmode.Csmodemclass
else:
  static :
    hint("Declaration of " & "Csmodemips3" & " already exists, not redeclaring")
when not declared(Csmodemips32r6):
  const
    Csmodemips32r6* = enumcsmode.Csmodev8
else:
  static :
    hint("Declaration of " & "Csmodemips32r6" &
        " already exists, not redeclaring")
when not declared(Csmodev9):
  const
    Csmodev9* = enumcsmode.Csmodethumb
else:
  static :
    hint("Declaration of " & "Csmodev9" & " already exists, not redeclaring")
when not declared(Csmodeqpx):
  const
    Csmodeqpx* = enumcsmode.Csmodethumb
else:
  static :
    hint("Declaration of " & "Csmodeqpx" & " already exists, not redeclaring")
when not declared(Csmodem68k000):
  const
    Csmodem68k000* = enumcsmode.Csmode16
else:
  static :
    hint("Declaration of " & "Csmodem68k000" &
        " already exists, not redeclaring")
when not declared(Csmodem68k010):
  const
    Csmodem68k010* = enumcsmode.Csmode32
else:
  static :
    hint("Declaration of " & "Csmodem68k010" &
        " already exists, not redeclaring")
when not declared(Csmodem68k020):
  const
    Csmodem68k020* = enumcsmode.Csmode64
else:
  static :
    hint("Declaration of " & "Csmodem68k020" &
        " already exists, not redeclaring")
when not declared(Csmodem68k030):
  const
    Csmodem68k030* = enumcsmode.Csmodethumb
else:
  static :
    hint("Declaration of " & "Csmodem68k030" &
        " already exists, not redeclaring")
when not declared(Csmodem68k040):
  const
    Csmodem68k040* = enumcsmode.Csmodemclass
else:
  static :
    hint("Declaration of " & "Csmodem68k040" &
        " already exists, not redeclaring")
when not declared(Csmodem68k060):
  const
    Csmodem68k060* = enumcsmode.Csmodev8
else:
  static :
    hint("Declaration of " & "Csmodem68k060" &
        " already exists, not redeclaring")
when not declared(Csmodemips32):
  const
    Csmodemips32* = enumcsmode.Csmode32
else:
  static :
    hint("Declaration of " & "Csmodemips32" & " already exists, not redeclaring")
when not declared(Csmodemips64):
  const
    Csmodemips64* = enumcsmode.Csmode64
else:
  static :
    hint("Declaration of " & "Csmodemips64" & " already exists, not redeclaring")
when not declared(Csmodem680x6301):
  const
    Csmodem680x6301* = enumcsmode.Csmode16
else:
  static :
    hint("Declaration of " & "Csmodem680x6301" &
        " already exists, not redeclaring")
when not declared(Csmodem680x6309):
  const
    Csmodem680x6309* = enumcsmode.Csmode32
else:
  static :
    hint("Declaration of " & "Csmodem680x6309" &
        " already exists, not redeclaring")
when not declared(Csmodem680x6800):
  const
    Csmodem680x6800* = enumcsmode.Csmode64
else:
  static :
    hint("Declaration of " & "Csmodem680x6800" &
        " already exists, not redeclaring")
when not declared(Csmodem680x6801):
  const
    Csmodem680x6801* = enumcsmode.Csmodethumb
else:
  static :
    hint("Declaration of " & "Csmodem680x6801" &
        " already exists, not redeclaring")
when not declared(Csmodem680x6805):
  const
    Csmodem680x6805* = enumcsmode.Csmodemclass
else:
  static :
    hint("Declaration of " & "Csmodem680x6805" &
        " already exists, not redeclaring")
when not declared(Csmodem680x6808):
  const
    Csmodem680x6808* = enumcsmode.Csmodev8
else:
  static :
    hint("Declaration of " & "Csmodem680x6808" &
        " already exists, not redeclaring")
when not declared(Csmodem680x6809):
  const
    Csmodem680x6809* = enumcsmode.Csmodemips2
else:
  static :
    hint("Declaration of " & "Csmodem680x6809" &
        " already exists, not redeclaring")
when not declared(enumcsopttype):
  type
    enumcsopttype* {.size: sizeof(cuint).} = enum
      Csoptinvalid = 0, Csoptsyntax = 1, Csoptdetail = 2, Csoptmode = 3,
      Csoptmem = 4, Csoptskipdata = 5, Csoptskipdatasetup = 6,
      Csoptmnemonic = 7, Csoptunsigned = 8
else:
  static :
    hint("Declaration of " & "enumcsopttype" &
        " already exists, not redeclaring")
when not declared(enumcsoptvalue):
  type
    enumcsoptvalue* {.size: sizeof(cuint).} = enum
      Csoptoff = 0, Csoptsyntaxintel = 1, Csoptsyntaxatt = 2, Csopton = 3,
      Csoptsyntaxmasm = 4
else:
  static :
    hint("Declaration of " & "enumcsoptvalue" &
        " already exists, not redeclaring")
when not declared(Csoptsyntaxdefault):
  const
    Csoptsyntaxdefault* = enumcsoptvalue.Csoptoff
else:
  static :
    hint("Declaration of " & "Csoptsyntaxdefault" &
        " already exists, not redeclaring")
when not declared(Csoptsyntaxnoregname):
  const
    Csoptsyntaxnoregname* = enumcsoptvalue.Csopton
else:
  static :
    hint("Declaration of " & "Csoptsyntaxnoregname" &
        " already exists, not redeclaring")
when not declared(enumcsoptype):
  type
    enumcsoptype* {.size: sizeof(cuint).} = enum
      Csopinvalid = 0, Csopreg = 1, Csopimm = 2, Csopmem = 3, Csopfp = 4
else:
  static :
    hint("Declaration of " & "enumcsoptype" & " already exists, not redeclaring")
when not declared(enumcsactype):
  type
    enumcsactype* {.size: sizeof(cuint).} = enum
      Csacinvalid = 0, Csacread = 1, Csacwrite = 2
else:
  static :
    hint("Declaration of " & "enumcsactype" & " already exists, not redeclaring")
when not declared(enumcsgrouptype):
  type
    enumcsgrouptype* {.size: sizeof(cuint).} = enum
      Csgrpinvalid = 0, Csgrpjump = 1, Csgrpcall = 2, Csgrpret = 3,
      Csgrpint = 4, Csgrpiret = 5, Csgrpprivilege = 6, Csgrpbranchrelative = 7
else:
  static :
    hint("Declaration of " & "enumcsgrouptype" &
        " already exists, not redeclaring")
when not declared(enumarmshifter):
  type
    enumarmshifter* {.size: sizeof(cuint).} = enum
      Armsftinvalid = 0, Armsftasr = 1, Armsftlsl = 2, Armsftlsr = 3,
      Armsftror = 4, Armsftrrx = 5, Armsftasrreg = 6, Armsftlslreg = 7,
      Armsftlsrreg = 8, Armsftrorreg = 9, Armsftrrxreg = 10
else:
  static :
    hint("Declaration of " & "enumarmshifter" &
        " already exists, not redeclaring")
when not declared(enumarmcc):
  type
    enumarmcc* {.size: sizeof(cuint).} = enum
      Armccinvalid = 0, Armcceq = 1, Armccne = 2, Armcchs = 3, Armcclo = 4,
      Armccmi = 5, Armccpl = 6, Armccvs = 7, Armccvc = 8, Armcchi = 9,
      Armccls = 10, Armccge = 11, Armcclt = 12, Armccgt = 13, Armccle = 14,
      Armccal = 15
else:
  static :
    hint("Declaration of " & "enumarmcc" & " already exists, not redeclaring")
when not declared(enumarmsysreg):
  type
    enumarmsysreg* {.size: sizeof(cuint).} = enum
      Armsysreginvalid = 0, Armsysregspsrc = 1, Armsysregspsrx = 2,
      Armsysregspsrs = 4, Armsysregspsrf = 8, Armsysregcpsrc = 16,
      Armsysregcpsrx = 32, Armsysregcpsrs = 64, Armsysregcpsrf = 128,
      Armsysregapsr = 256, Armsysregapsrg = 257, Armsysregapsrnzcvq = 258,
      Armsysregapsrnzcvqg = 259, Armsysregiapsr = 260, Armsysregiapsrg = 261,
      Armsysregiapsrnzcvqg = 262, Armsysregiapsrnzcvq = 263,
      Armsysregeapsr = 264, Armsysregeapsrg = 265, Armsysregeapsrnzcvqg = 266,
      Armsysregeapsrnzcvq = 267, Armsysregxpsr = 268, Armsysregxpsrg = 269,
      Armsysregxpsrnzcvqg = 270, Armsysregxpsrnzcvq = 271, Armsysregipsr = 272,
      Armsysregepsr = 273, Armsysregiepsr = 274, Armsysregmsp = 275,
      Armsysregpsp = 276, Armsysregprimask = 277, Armsysregbasepri = 278,
      Armsysregbaseprimax = 279, Armsysregfaultmask = 280,
      Armsysregcontrol = 281, Armsysregr8usr = 282, Armsysregr9usr = 283,
      Armsysregr10usr = 284, Armsysregr11usr = 285, Armsysregr12usr = 286,
      Armsysregspusr = 287, Armsysreglrusr = 288, Armsysregr8fiq = 289,
      Armsysregr9fiq = 290, Armsysregr10fiq = 291, Armsysregr11fiq = 292,
      Armsysregr12fiq = 293, Armsysregspfiq = 294, Armsysreglrfiq = 295,
      Armsysreglrirq = 296, Armsysregspirq = 297, Armsysreglrsvc = 298,
      Armsysregspsvc = 299, Armsysreglrabt = 300, Armsysregspabt = 301,
      Armsysreglrund = 302, Armsysregspund = 303, Armsysreglrmon = 304,
      Armsysregspmon = 305, Armsysregelrhyp = 306, Armsysregsphyp = 307,
      Armsysregspsrfiq = 308, Armsysregspsrirq = 309, Armsysregspsrsvc = 310,
      Armsysregspsrabt = 311, Armsysregspsrund = 312, Armsysregspsrmon = 313,
      Armsysregspsrhyp = 314
else:
  static :
    hint("Declaration of " & "enumarmsysreg" &
        " already exists, not redeclaring")
when not declared(enumarmmembarrier):
  type
    enumarmmembarrier* {.size: sizeof(cuint).} = enum
      Armmbinvalid = 0, Armmbreserved0 = 1, Armmboshld = 2, Armmboshst = 3,
      Armmbosh = 4, Armmbreserved4 = 5, Armmbnshld = 6, Armmbnshst = 7,
      Armmbnsh = 8, Armmbreserved8 = 9, Armmbishld = 10, Armmbishst = 11,
      Armmbish = 12, Armmbreserved12 = 13, Armmbld = 14, Armmbst = 15,
      Armmbsy = 16
else:
  static :
    hint("Declaration of " & "enumarmmembarrier" &
        " already exists, not redeclaring")
when not declared(enumarmoptype):
  type
    enumarmoptype* {.size: sizeof(cuint).} = enum
      Armopinvalid = 0, Armopreg = 1, Armopimm = 2, Armopmem = 3, Armopfp = 4,
      Armopcimm = 64, Armoppimm = 65, Armopsetend = 66, Armopsysreg = 67
else:
  static :
    hint("Declaration of " & "enumarmoptype" &
        " already exists, not redeclaring")
when not declared(enumarmsetendtype):
  type
    enumarmsetendtype* {.size: sizeof(cuint).} = enum
      Armsetendinvalid = 0, Armsetendbe = 1, Armsetendle = 2
else:
  static :
    hint("Declaration of " & "enumarmsetendtype" &
        " already exists, not redeclaring")
when not declared(enumarmcpsmodetype):
  type
    enumarmcpsmodetype* {.size: sizeof(cuint).} = enum
      Armcpsmodeinvalid = 0, Armcpsmodeie = 2, Armcpsmodeid = 3
else:
  static :
    hint("Declaration of " & "enumarmcpsmodetype" &
        " already exists, not redeclaring")
when not declared(enumarmcpsflagtype):
  type
    enumarmcpsflagtype* {.size: sizeof(cuint).} = enum
      Armcpsflaginvalid = 0, Armcpsflagf = 1, Armcpsflagi = 2, Armcpsflaga = 4,
      Armcpsflagnone = 16
else:
  static :
    hint("Declaration of " & "enumarmcpsflagtype" &
        " already exists, not redeclaring")
when not declared(enumarmvectordatatype):
  type
    enumarmvectordatatype* {.size: sizeof(cuint).} = enum
      Armvectordatainvalid = 0, Armvectordatai8 = 1, Armvectordatai16 = 2,
      Armvectordatai32 = 3, Armvectordatai64 = 4, Armvectordatas8 = 5,
      Armvectordatas16 = 6, Armvectordatas32 = 7, Armvectordatas64 = 8,
      Armvectordatau8 = 9, Armvectordatau16 = 10, Armvectordatau32 = 11,
      Armvectordatau64 = 12, Armvectordatap8 = 13, Armvectordataf32 = 14,
      Armvectordataf64 = 15, Armvectordataf16f64 = 16, Armvectordataf64f16 = 17,
      Armvectordataf32f16 = 18, Armvectordataf16f32 = 19,
      Armvectordataf64f32 = 20, Armvectordataf32f64 = 21,
      Armvectordatas32f32 = 22, Armvectordatau32f32 = 23,
      Armvectordataf32s32 = 24, Armvectordataf32u32 = 25,
      Armvectordataf64s16 = 26, Armvectordataf32s16 = 27,
      Armvectordataf64s32 = 28, Armvectordatas16f64 = 29,
      Armvectordatas16f32 = 30, Armvectordatas32f64 = 31,
      Armvectordatau16f64 = 32, Armvectordatau16f32 = 33,
      Armvectordatau32f64 = 34, Armvectordataf64u16 = 35,
      Armvectordataf32u16 = 36, Armvectordataf64u32 = 37
else:
  static :
    hint("Declaration of " & "enumarmvectordatatype" &
        " already exists, not redeclaring")
when not declared(enumarmreg):
  type
    enumarmreg* {.size: sizeof(cuint).} = enum
      Armreginvalid = 0, Armregapsr = 1, Armregapsrnzcv = 2, Armregcpsr = 3,
      Armregfpexc = 4, Armregfpinst = 5, Armregfpscr = 6, Armregfpscrnzcv = 7,
      Armregfpsid = 8, Armregitstate = 9, Armreglr = 10, Armregpc = 11,
      Armregsp = 12, Armregspsr = 13, Armregd0 = 14, Armregd1 = 15,
      Armregd2 = 16, Armregd3 = 17, Armregd4 = 18, Armregd5 = 19, Armregd6 = 20,
      Armregd7 = 21, Armregd8 = 22, Armregd9 = 23, Armregd10 = 24,
      Armregd11 = 25, Armregd12 = 26, Armregd13 = 27, Armregd14 = 28,
      Armregd15 = 29, Armregd16 = 30, Armregd17 = 31, Armregd18 = 32,
      Armregd19 = 33, Armregd20 = 34, Armregd21 = 35, Armregd22 = 36,
      Armregd23 = 37, Armregd24 = 38, Armregd25 = 39, Armregd26 = 40,
      Armregd27 = 41, Armregd28 = 42, Armregd29 = 43, Armregd30 = 44,
      Armregd31 = 45, Armregfpinst2 = 46, Armregmvfr0 = 47, Armregmvfr1 = 48,
      Armregmvfr2 = 49, Armregq0 = 50, Armregq1 = 51, Armregq2 = 52,
      Armregq3 = 53, Armregq4 = 54, Armregq5 = 55, Armregq6 = 56, Armregq7 = 57,
      Armregq8 = 58, Armregq9 = 59, Armregq10 = 60, Armregq11 = 61,
      Armregq12 = 62, Armregq13 = 63, Armregq14 = 64, Armregq15 = 65,
      Armregr0 = 66, Armregr1 = 67, Armregr2 = 68, Armregr3 = 69, Armregr4 = 70,
      Armregr5 = 71, Armregr6 = 72, Armregr7 = 73, Armregr8 = 74, Armregr9 = 75,
      Armregr10 = 76, Armregr11 = 77, Armregr12 = 78, Armregs0 = 79,
      Armregs1 = 80, Armregs2 = 81, Armregs3 = 82, Armregs4 = 83, Armregs5 = 84,
      Armregs6 = 85, Armregs7 = 86, Armregs8 = 87, Armregs9 = 88,
      Armregs10 = 89, Armregs11 = 90, Armregs12 = 91, Armregs13 = 92,
      Armregs14 = 93, Armregs15 = 94, Armregs16 = 95, Armregs17 = 96,
      Armregs18 = 97, Armregs19 = 98, Armregs20 = 99, Armregs21 = 100,
      Armregs22 = 101, Armregs23 = 102, Armregs24 = 103, Armregs25 = 104,
      Armregs26 = 105, Armregs27 = 106, Armregs28 = 107, Armregs29 = 108,
      Armregs30 = 109, Armregs31 = 110, Armregending = 111
else:
  static :
    hint("Declaration of " & "enumarmreg" & " already exists, not redeclaring")
when not declared(Armregr13):
  const
    Armregr13* = enumarmreg.Armregsp
else:
  static :
    hint("Declaration of " & "Armregr13" & " already exists, not redeclaring")
when not declared(Armregr14):
  const
    Armregr14* = enumarmreg.Armreglr
else:
  static :
    hint("Declaration of " & "Armregr14" & " already exists, not redeclaring")
when not declared(Armregr15):
  const
    Armregr15* = enumarmreg.Armregpc
else:
  static :
    hint("Declaration of " & "Armregr15" & " already exists, not redeclaring")
when not declared(Armregsb):
  const
    Armregsb* = enumarmreg.Armregr9
else:
  static :
    hint("Declaration of " & "Armregsb" & " already exists, not redeclaring")
when not declared(Armregsl):
  const
    Armregsl* = enumarmreg.Armregr10
else:
  static :
    hint("Declaration of " & "Armregsl" & " already exists, not redeclaring")
when not declared(Armregfp):
  const
    Armregfp* = enumarmreg.Armregr11
else:
  static :
    hint("Declaration of " & "Armregfp" & " already exists, not redeclaring")
when not declared(Armregip):
  const
    Armregip* = enumarmreg.Armregr12
else:
  static :
    hint("Declaration of " & "Armregip" & " already exists, not redeclaring")
when not declared(enumarminsn):
  type
    enumarminsn* {.size: sizeof(cuint).} = enum
      Arminsinvalid = 0, Arminsadc = 1, Arminsadd = 2, Arminsadr = 3,
      Arminsaesd = 4, Arminsaese = 5, Arminsaesimc = 6, Arminsaesmc = 7,
      Arminsand = 8, Arminsbfc = 9, Arminsbfi = 10, Arminsbic = 11,
      Arminsbkpt = 12, Arminsbl = 13, Arminsblx = 14, Arminsbx = 15,
      Arminsbxj = 16, Arminsb = 17, Arminscdp = 18, Arminscdp2 = 19,
      Arminsclrex = 20, Arminsclz = 21, Arminscmn = 22, Arminscmp = 23,
      Arminscps = 24, Arminscrc32b = 25, Arminscrc32cb = 26, Arminscrc32ch = 27,
      Arminscrc32cw = 28, Arminscrc32h = 29, Arminscrc32w = 30, Arminsdbg = 31,
      Arminsdmb = 32, Arminsdsb = 33, Arminseor = 34, Arminseret = 35,
      Arminsvmov = 36, Arminsfldmdbx = 37, Arminsfldmiax = 38, Arminsvmrs = 39,
      Arminsfstmdbx = 40, Arminsfstmiax = 41, Arminshint = 42, Arminshlt = 43,
      Arminshvc = 44, Arminsisb = 45, Arminslda = 46, Arminsldab = 47,
      Arminsldaex = 48, Arminsldaexb = 49, Arminsldaexd = 50, Arminsldaexh = 51,
      Arminsldah = 52, Arminsldc2l = 53, Arminsldc2 = 54, Arminsldcl = 55,
      Arminsldc = 56, Arminsldmda = 57, Arminsldmdb = 58, Arminsldm = 59,
      Arminsldmib = 60, Arminsldrbt = 61, Arminsldrb = 62, Arminsldrd = 63,
      Arminsldrex = 64, Arminsldrexb = 65, Arminsldrexd = 66, Arminsldrexh = 67,
      Arminsldrh = 68, Arminsldrht = 69, Arminsldrsb = 70, Arminsldrsbt = 71,
      Arminsldrsh = 72, Arminsldrsht = 73, Arminsldrt = 74, Arminsldr = 75,
      Arminsmcr = 76, Arminsmcr2 = 77, Arminsmcrr = 78, Arminsmcrr2 = 79,
      Arminsmla = 80, Arminsmls = 81, Arminsmov = 82, Arminsmovt = 83,
      Arminsmovw = 84, Arminsmrc = 85, Arminsmrc2 = 86, Arminsmrrc = 87,
      Arminsmrrc2 = 88, Arminsmrs = 89, Arminsmsr = 90, Arminsmul = 91,
      Arminsmvn = 92, Arminsorr = 93, Arminspkhbt = 94, Arminspkhtb = 95,
      Arminspldw = 96, Arminspld = 97, Arminspli = 98, Arminsqadd = 99,
      Arminsqadd16 = 100, Arminsqadd8 = 101, Arminsqasx = 102,
      Arminsqdadd = 103, Arminsqdsub = 104, Arminsqsax = 105, Arminsqsub = 106,
      Arminsqsub16 = 107, Arminsqsub8 = 108, Arminsrbit = 109, Arminsrev = 110,
      Arminsrev16 = 111, Arminsrevsh = 112, Arminsrfeda = 113,
      Arminsrfedb = 114, Arminsrfeia = 115, Arminsrfeib = 116, Arminsrsb = 117,
      Arminsrsc = 118, Arminssadd16 = 119, Arminssadd8 = 120, Arminssasx = 121,
      Arminssbc = 122, Arminssbfx = 123, Arminssdiv = 124, Arminssel = 125,
      Arminssetend = 126, Arminssha1c = 127, Arminssha1h = 128,
      Arminssha1m = 129, Arminssha1p = 130, Arminssha1su0 = 131,
      Arminssha1su1 = 132, Arminssha256h = 133, Arminssha256h2 = 134,
      Arminssha256su0 = 135, Arminssha256su1 = 136, Arminsshadd16 = 137,
      Arminsshadd8 = 138, Arminsshasx = 139, Arminsshsax = 140,
      Arminsshsub16 = 141, Arminsshsub8 = 142, Arminssmc = 143,
      Arminssmlabb = 144, Arminssmlabt = 145, Arminssmlad = 146,
      Arminssmladx = 147, Arminssmlal = 148, Arminssmlalbb = 149,
      Arminssmlalbt = 150, Arminssmlald = 151, Arminssmlaldx = 152,
      Arminssmlaltb = 153, Arminssmlaltt = 154, Arminssmlatb = 155,
      Arminssmlatt = 156, Arminssmlawb = 157, Arminssmlawt = 158,
      Arminssmlsd = 159, Arminssmlsdx = 160, Arminssmlsld = 161,
      Arminssmlsldx = 162, Arminssmmla = 163, Arminssmmlar = 164,
      Arminssmmls = 165, Arminssmmlsr = 166, Arminssmmul = 167,
      Arminssmmulr = 168, Arminssmuad = 169, Arminssmuadx = 170,
      Arminssmulbb = 171, Arminssmulbt = 172, Arminssmull = 173,
      Arminssmultb = 174, Arminssmultt = 175, Arminssmulwb = 176,
      Arminssmulwt = 177, Arminssmusd = 178, Arminssmusdx = 179,
      Arminssrsda = 180, Arminssrsdb = 181, Arminssrsia = 182,
      Arminssrsib = 183, Arminsssat = 184, Arminsssat16 = 185, Arminsssax = 186,
      Arminsssub16 = 187, Arminsssub8 = 188, Arminsstc2l = 189,
      Arminsstc2 = 190, Arminsstcl = 191, Arminsstc = 192, Arminsstl = 193,
      Arminsstlb = 194, Arminsstlex = 195, Arminsstlexb = 196,
      Arminsstlexd = 197, Arminsstlexh = 198, Arminsstlh = 199,
      Arminsstmda = 200, Arminsstmdb = 201, Arminsstm = 202, Arminsstmib = 203,
      Arminsstrbt = 204, Arminsstrb = 205, Arminsstrd = 206, Arminsstrex = 207,
      Arminsstrexb = 208, Arminsstrexd = 209, Arminsstrexh = 210,
      Arminsstrh = 211, Arminsstrht = 212, Arminsstrt = 213, Arminsstr = 214,
      Arminssub = 215, Arminssvc = 216, Arminsswp = 217, Arminsswpb = 218,
      Arminssxtab = 219, Arminssxtab16 = 220, Arminssxtah = 221,
      Arminssxtb = 222, Arminssxtb16 = 223, Arminssxth = 224, Arminsteq = 225,
      Arminstrap = 226, Arminstst = 227, Arminsuadd16 = 228, Arminsuadd8 = 229,
      Arminsuasx = 230, Arminsubfx = 231, Arminsudf = 232, Arminsudiv = 233,
      Arminsuhadd16 = 234, Arminsuhadd8 = 235, Arminsuhasx = 236,
      Arminsuhsax = 237, Arminsuhsub16 = 238, Arminsuhsub8 = 239,
      Arminsumaal = 240, Arminsumlal = 241, Arminsumull = 242,
      Arminsuqadd16 = 243, Arminsuqadd8 = 244, Arminsuqasx = 245,
      Arminsuqsax = 246, Arminsuqsub16 = 247, Arminsuqsub8 = 248,
      Arminsusad8 = 249, Arminsusada8 = 250, Arminsusat = 251,
      Arminsusat16 = 252, Arminsusax = 253, Arminsusub16 = 254,
      Arminsusub8 = 255, Arminsuxtab = 256, Arminsuxtab16 = 257,
      Arminsuxtah = 258, Arminsuxtb = 259, Arminsuxtb16 = 260, Arminsuxth = 261,
      Arminsvabal = 262, Arminsvaba = 263, Arminsvabdl = 264, Arminsvabd = 265,
      Arminsvabs = 266, Arminsvacge = 267, Arminsvacgt = 268, Arminsvadd = 269,
      Arminsvaddhn = 270, Arminsvaddl = 271, Arminsvaddw = 272,
      Arminsvand = 273, Arminsvbic = 274, Arminsvbif = 275, Arminsvbit = 276,
      Arminsvbsl = 277, Arminsvceq = 278, Arminsvcge = 279, Arminsvcgt = 280,
      Arminsvcle = 281, Arminsvcls = 282, Arminsvclt = 283, Arminsvclz = 284,
      Arminsvcmp = 285, Arminsvcmpe = 286, Arminsvcnt = 287, Arminsvcvta = 288,
      Arminsvcvtb = 289, Arminsvcvt = 290, Arminsvcvtm = 291, Arminsvcvtn = 292,
      Arminsvcvtp = 293, Arminsvcvtt = 294, Arminsvdiv = 295, Arminsvdup = 296,
      Arminsveor = 297, Arminsvext = 298, Arminsvfma = 299, Arminsvfms = 300,
      Arminsvfnma = 301, Arminsvfnms = 302, Arminsvhadd = 303,
      Arminsvhsub = 304, Arminsvld1 = 305, Arminsvld2 = 306, Arminsvld3 = 307,
      Arminsvld4 = 308, Arminsvldmdb = 309, Arminsvldmia = 310,
      Arminsvldr = 311, Arminsvmaxnm = 312, Arminsvmax = 313,
      Arminsvminnm = 314, Arminsvmin = 315, Arminsvmla = 316, Arminsvmlal = 317,
      Arminsvmls = 318, Arminsvmlsl = 319, Arminsvmovl = 320, Arminsvmovn = 321,
      Arminsvmsr = 322, Arminsvmul = 323, Arminsvmull = 324, Arminsvmvn = 325,
      Arminsvneg = 326, Arminsvnmla = 327, Arminsvnmls = 328, Arminsvnmul = 329,
      Arminsvorn = 330, Arminsvorr = 331, Arminsvpadal = 332,
      Arminsvpaddl = 333, Arminsvpadd = 334, Arminsvpmax = 335,
      Arminsvpmin = 336, Arminsvqabs = 337, Arminsvqadd = 338,
      Arminsvqdmlal = 339, Arminsvqdmlsl = 340, Arminsvqdmulh = 341,
      Arminsvqdmull = 342, Arminsvqmovun = 343, Arminsvqmovn = 344,
      Arminsvqneg = 345, Arminsvqrdmulh = 346, Arminsvqrshl = 347,
      Arminsvqrshrn = 348, Arminsvqrshrun = 349, Arminsvqshl = 350,
      Arminsvqshlu = 351, Arminsvqshrn = 352, Arminsvqshrun = 353,
      Arminsvqsub = 354, Arminsvraddhn = 355, Arminsvrecpe = 356,
      Arminsvrecps = 357, Arminsvrev16 = 358, Arminsvrev32 = 359,
      Arminsvrev64 = 360, Arminsvrhadd = 361, Arminsvrinta = 362,
      Arminsvrintm = 363, Arminsvrintn = 364, Arminsvrintp = 365,
      Arminsvrintr = 366, Arminsvrintx = 367, Arminsvrintz = 368,
      Arminsvrshl = 369, Arminsvrshrn = 370, Arminsvrshr = 371,
      Arminsvrsqrte = 372, Arminsvrsqrts = 373, Arminsvrsra = 374,
      Arminsvrsubhn = 375, Arminsvseleq = 376, Arminsvselge = 377,
      Arminsvselgt = 378, Arminsvselvs = 379, Arminsvshll = 380,
      Arminsvshl = 381, Arminsvshrn = 382, Arminsvshr = 383, Arminsvsli = 384,
      Arminsvsqrt = 385, Arminsvsra = 386, Arminsvsri = 387, Arminsvst1 = 388,
      Arminsvst2 = 389, Arminsvst3 = 390, Arminsvst4 = 391, Arminsvstmdb = 392,
      Arminsvstmia = 393, Arminsvstr = 394, Arminsvsub = 395,
      Arminsvsubhn = 396, Arminsvsubl = 397, Arminsvsubw = 398,
      Arminsvswp = 399, Arminsvtbl = 400, Arminsvtbx = 401, Arminsvcvtr = 402,
      Arminsvtrn = 403, Arminsvtst = 404, Arminsvuzp = 405, Arminsvzip = 406,
      Arminsaddw = 407, Arminsasr = 408, Arminsdcps1 = 409, Arminsdcps2 = 410,
      Arminsdcps3 = 411, Arminsit = 412, Arminslsl = 413, Arminslsr = 414,
      Arminsorn = 415, Arminsror = 416, Arminsrrx = 417, Arminssubw = 418,
      Arminstbb = 419, Arminstbh = 420, Arminscbnz = 421, Arminscbz = 422,
      Arminspop = 423, Arminspush = 424, Arminsnop = 425, Arminsyield = 426,
      Arminswfe = 427, Arminswfi = 428, Arminssev = 429, Arminssevl = 430,
      Arminsvpush = 431, Arminsvpop = 432, Arminsending = 433
else:
  static :
    hint("Declaration of " & "enumarminsn" & " already exists, not redeclaring")
when not declared(enumarminsngroup):
  type
    enumarminsngroup* {.size: sizeof(cuint).} = enum
      Armgrpinvalid = 0, Armgrpjump = 1, Armgrpcall = 2, Armgrpint = 4,
      Armgrpprivilege = 6, Armgrpbranchrelative = 7, Armgrpcrypto = 128,
      Armgrpdatabarrier = 129, Armgrpdivide = 130, Armgrpfparmv8 = 131,
      Armgrpmultpro = 132, Armgrpneon = 133, Armgrpt2extractpack = 134,
      Armgrpthumb2dsp = 135, Armgrptrustzone = 136, Armgrpv4t = 137,
      Armgrpv5t = 138, Armgrpv5te = 139, Armgrpv6 = 140, Armgrpv6t2 = 141,
      Armgrpv7 = 142, Armgrpv8 = 143, Armgrpvfp2 = 144, Armgrpvfp3 = 145,
      Armgrpvfp4 = 146, Armgrparm = 147, Armgrpmclass = 148,
      Armgrpnotmclass = 149, Armgrpthumb = 150, Armgrpthumb1only = 151,
      Armgrpthumb2 = 152, Armgrpprev8 = 153, Armgrpfpvmlx = 154,
      Armgrpmulops = 155, Armgrpcrc = 156, Armgrpdpvfp = 157, Armgrpv6m = 158,
      Armgrpvirtualization = 159, Armgrpending = 160
else:
  static :
    hint("Declaration of " & "enumarminsngroup" &
        " already exists, not redeclaring")
when not declared(enumarm64shifter):
  type
    enumarm64shifter* {.size: sizeof(cuint).} = enum
      Arm64sftinvalid = 0, Arm64sftlsl = 1, Arm64sftmsl = 2, Arm64sftlsr = 3,
      Arm64sftasr = 4, Arm64sftror = 5
else:
  static :
    hint("Declaration of " & "enumarm64shifter" &
        " already exists, not redeclaring")
when not declared(enumarm64extender):
  type
    enumarm64extender* {.size: sizeof(cuint).} = enum
      Arm64extinvalid = 0, Arm64extuxtb = 1, Arm64extuxth = 2, Arm64extuxtw = 3,
      Arm64extuxtx = 4, Arm64extsxtb = 5, Arm64extsxth = 6, Arm64extsxtw = 7,
      Arm64extsxtx = 8
else:
  static :
    hint("Declaration of " & "enumarm64extender" &
        " already exists, not redeclaring")
when not declared(enumarm64cc):
  type
    enumarm64cc* {.size: sizeof(cuint).} = enum
      Arm64ccinvalid = 0, Arm64cceq = 1, Arm64ccne = 2, Arm64cchs = 3,
      Arm64cclo = 4, Arm64ccmi = 5, Arm64ccpl = 6, Arm64ccvs = 7, Arm64ccvc = 8,
      Arm64cchi = 9, Arm64ccls = 10, Arm64ccge = 11, Arm64cclt = 12,
      Arm64ccgt = 13, Arm64ccle = 14, Arm64ccal = 15, Arm64ccnv = 16
else:
  static :
    hint("Declaration of " & "enumarm64cc" & " already exists, not redeclaring")
when not declared(enumarm64sysreg):
  type
    enumarm64sysreg* {.size: sizeof(cuint).} = enum
      Arm64sysreginvalid = 0, Arm64sysregmdrarel1 = 32896,
      Arm64sysregoslsrel1 = 32908, Arm64sysregdbgauthstatusel1 = 33782,
      Arm64sysregtrcidr8 = 34822, Arm64sysregtrcidr9 = 34830,
      Arm64sysregtrcidr10 = 34838, Arm64sysregtrcstatr = 34840,
      Arm64sysregtrcidr11 = 34846, Arm64sysregtrcidr12 = 34854,
      Arm64sysregtrcidr13 = 34862, Arm64sysregtrcidr0 = 34887,
      Arm64sysregtrcidr1 = 34895, Arm64sysregtrcidr2 = 34903,
      Arm64sysregtrcidr3 = 34911, Arm64sysregtrcidr4 = 34919,
      Arm64sysregtrcidr5 = 34927, Arm64sysregtrcidr6 = 34935,
      Arm64sysregtrcidr7 = 34943, Arm64sysregtrcoslsr = 34956,
      Arm64sysregtrcpdsr = 34988, Arm64sysregtrcdevid = 35735,
      Arm64sysregtrcdevtype = 35743, Arm64sysregtrcpidr4 = 35751,
      Arm64sysregtrcpidr5 = 35759, Arm64sysregtrcpidr6 = 35767,
      Arm64sysregtrcpidr7 = 35775, Arm64sysregtrcpidr0 = 35783,
      Arm64sysregtrcpidr1 = 35791, Arm64sysregtrcdevaff0 = 35798,
      Arm64sysregtrcpidr2 = 35799, Arm64sysregtrcdevaff1 = 35806,
      Arm64sysregtrcpidr3 = 35807, Arm64sysregtrccidr0 = 35815,
      Arm64sysregtrclsr = 35822, Arm64sysregtrccidr1 = 35823,
      Arm64sysregtrcauthstatus = 35830, Arm64sysregtrccidr2 = 35831,
      Arm64sysregtrcdevarch = 35838, Arm64sysregtrccidr3 = 35839,
      Arm64sysregmdccsrel0 = 38920, Arm64sysregdbgdtrrxel0 = 38952,
      Arm64sysregmidrel1 = 49152, Arm64sysregmpidrel1 = 49157,
      Arm64sysregrevidrel1 = 49158, Arm64sysregidpfr0el1 = 49160,
      Arm64sysregidpfr1el1 = 49161, Arm64sysregiddfr0el1 = 49162,
      Arm64sysregidafr0el1 = 49163, Arm64sysregidmmfr0el1 = 49164,
      Arm64sysregidmmfr1el1 = 49165, Arm64sysregidmmfr2el1 = 49166,
      Arm64sysregidmmfr3el1 = 49167, Arm64sysregidisar0el1 = 49168,
      Arm64sysregidisar1el1 = 49169, Arm64sysregidisar2el1 = 49170,
      Arm64sysregidisar3el1 = 49171, Arm64sysregidisar4el1 = 49172,
      Arm64sysregidisar5el1 = 49173, Arm64sysregmvfr0el1 = 49176,
      Arm64sysregmvfr1el1 = 49177, Arm64sysregmvfr2el1 = 49178,
      Arm64sysregida64pfr0el1 = 49184, Arm64sysregida64pfr1el1 = 49185,
      Arm64sysregida64dfr0el1 = 49192, Arm64sysregida64dfr1el1 = 49193,
      Arm64sysregida64afr0el1 = 49196, Arm64sysregida64afr1el1 = 49197,
      Arm64sysregida64isar0el1 = 49200, Arm64sysregida64isar1el1 = 49201,
      Arm64sysregida64mmfr0el1 = 49208, Arm64sysregida64mmfr1el1 = 49209,
      Arm64sysregrvbarel1 = 50689, Arm64sysregisrel1 = 50696,
      Arm64sysregicciar0el1 = 50752, Arm64sysregicchppir0el1 = 50754,
      Arm64sysregiccrprel1 = 50779, Arm64sysregicciar1el1 = 50784,
      Arm64sysregicchppir1el1 = 50786, Arm64sysregccsidrel1 = 51200,
      Arm64sysregclidrel1 = 51201, Arm64sysregaidrel1 = 51207,
      Arm64sysregctrel0 = 55297, Arm64sysregdczidel0 = 55303,
      Arm64sysregpmceid0el0 = 56550, Arm64sysregpmceid1el0 = 56551,
      Arm64sysregcntpctel0 = 57089, Arm64sysregcntvctel0 = 57090,
      Arm64sysregrvbarel2 = 58881, Arm64sysregichvtrel2 = 58969,
      Arm64sysregicheisrel2 = 58971, Arm64sysregichelsrel2 = 58973,
      Arm64sysregrvbarel3 = 62977
else:
  static :
    hint("Declaration of " & "enumarm64sysreg" &
        " already exists, not redeclaring")
when not declared(enumarm64msrreg):
  type
    enumarm64msrreg* {.size: sizeof(cuint).} = enum
      Arm64sysregoslarel1 = 32900, Arm64sysregtrcoslar = 34948,
      Arm64sysregtrclar = 35814, Arm64sysregdbgdtrtxel0 = 38952,
      Arm64sysregicceoir0el1 = 50753, Arm64sysregiccdirel1 = 50777,
      Arm64sysregiccsgi1rel1 = 50781, Arm64sysregiccasgi1rel1 = 50782,
      Arm64sysregiccsgi0rel1 = 50783, Arm64sysregicceoir1el1 = 50785,
      Arm64sysregpmswincel0 = 56548
else:
  static :
    hint("Declaration of " & "enumarm64msrreg" &
        " already exists, not redeclaring")
when not declared(enumarm64pstate):
  type
    enumarm64pstate* {.size: sizeof(cuint).} = enum
      Arm64pstateinvalid = 0, Arm64pstatespsel = 5, Arm64pstatedaifset = 30,
      Arm64pstatedaifclr = 31
else:
  static :
    hint("Declaration of " & "enumarm64pstate" &
        " already exists, not redeclaring")
when not declared(enumarm64vas):
  type
    enumarm64vas* {.size: sizeof(cuint).} = enum
      Arm64vasinvalid = 0, Arm64vas8b = 1, Arm64vas16b = 2, Arm64vas4h = 3,
      Arm64vas8h = 4, Arm64vas2s = 5, Arm64vas4s = 6, Arm64vas1d = 7,
      Arm64vas2d = 8, Arm64vas1q = 9
else:
  static :
    hint("Declaration of " & "enumarm64vas" & " already exists, not redeclaring")
when not declared(enumarm64vess):
  type
    enumarm64vess* {.size: sizeof(cuint).} = enum
      Arm64vessinvalid = 0, Arm64vessb = 1, Arm64vessh = 2, Arm64vesss = 3,
      Arm64vessd = 4
else:
  static :
    hint("Declaration of " & "enumarm64vess" &
        " already exists, not redeclaring")
when not declared(enumarm64barrierop):
  type
    enumarm64barrierop* {.size: sizeof(cuint).} = enum
      Arm64barrierinvalid = 0, Arm64barrieroshld = 1, Arm64barrieroshst = 2,
      Arm64barrierosh = 3, Arm64barriernshld = 5, Arm64barriernshst = 6,
      Arm64barriernsh = 7, Arm64barrierishld = 9, Arm64barrierishst = 10,
      Arm64barrierish = 11, Arm64barrierld = 13, Arm64barrierst = 14,
      Arm64barriersy = 15
else:
  static :
    hint("Declaration of " & "enumarm64barrierop" &
        " already exists, not redeclaring")
when not declared(enumarm64optype):
  type
    enumarm64optype* {.size: sizeof(cuint).} = enum
      Arm64opinvalid = 0, Arm64opreg = 1, Arm64opimm = 2, Arm64opmem = 3,
      Arm64opfp = 4, Arm64opcimm = 64, Arm64opregmrs = 65, Arm64opregmsr = 66,
      Arm64oppstate = 67, Arm64opsys = 68, Arm64opprefetch = 69,
      Arm64opbarrier = 70
else:
  static :
    hint("Declaration of " & "enumarm64optype" &
        " already exists, not redeclaring")
when not declared(enumarm64tlbiop):
  type
    enumarm64tlbiop* {.size: sizeof(cuint).} = enum
      Arm64tlbiinvalid = 0, Arm64tlbivmalle1is = 1, Arm64tlbivae1is = 2,
      Arm64tlbiaside1is = 3, Arm64tlbivaae1is = 4, Arm64tlbivale1is = 5,
      Arm64tlbivaale1is = 6, Arm64tlbialle2is = 7, Arm64tlbivae2is = 8,
      Arm64tlbialle1is = 9, Arm64tlbivale2is = 10, Arm64tlbivmalls12e1is = 11,
      Arm64tlbialle3is = 12, Arm64tlbivae3is = 13, Arm64tlbivale3is = 14,
      Arm64tlbiipas2e1is = 15, Arm64tlbiipas2le1is = 16, Arm64tlbiipas2e1 = 17,
      Arm64tlbiipas2le1 = 18, Arm64tlbivmalle1 = 19, Arm64tlbivae1 = 20,
      Arm64tlbiaside1 = 21, Arm64tlbivaae1 = 22, Arm64tlbivale1 = 23,
      Arm64tlbivaale1 = 24, Arm64tlbialle2 = 25, Arm64tlbivae2 = 26,
      Arm64tlbialle1 = 27, Arm64tlbivale2 = 28, Arm64tlbivmalls12e1 = 29,
      Arm64tlbialle3 = 30, Arm64tlbivae3 = 31, Arm64tlbivale3 = 32
else:
  static :
    hint("Declaration of " & "enumarm64tlbiop" &
        " already exists, not redeclaring")
when not declared(enumarm64atop):
  type
    enumarm64atop* {.size: sizeof(cuint).} = enum
      Arm64ats1e1r = 0, Arm64ats1e1w = 1, Arm64ats1e0r = 2, Arm64ats1e0w = 3,
      Arm64ats1e2r = 4, Arm64ats1e2w = 5, Arm64ats12e1r = 6, Arm64ats12e1w = 7,
      Arm64ats12e0r = 8, Arm64ats12e0w = 9, Arm64ats1e3r = 10, Arm64ats1e3w = 11
else:
  static :
    hint("Declaration of " & "enumarm64atop" &
        " already exists, not redeclaring")
when not declared(enumarm64dcop):
  type
    enumarm64dcop* {.size: sizeof(cuint).} = enum
      Arm64dcinvalid = 0, Arm64dczva = 1, Arm64dcivac = 2, Arm64dcisw = 3,
      Arm64dccvac = 4, Arm64dccsw = 5, Arm64dccvau = 6, Arm64dccivac = 7,
      Arm64dccisw = 8
else:
  static :
    hint("Declaration of " & "enumarm64dcop" &
        " already exists, not redeclaring")
when not declared(enumarm64icop):
  type
    enumarm64icop* {.size: sizeof(cuint).} = enum
      Arm64icinvalid = 0, Arm64icialluis = 1, Arm64iciallu = 2, Arm64icivau = 3
else:
  static :
    hint("Declaration of " & "enumarm64icop" &
        " already exists, not redeclaring")
when not declared(enumarm64prefetchop):
  type
    enumarm64prefetchop* {.size: sizeof(cuint).} = enum
      Arm64prfminvalid = 0, Arm64prfmpldl1keep = 1, Arm64prfmpldl1strm = 2,
      Arm64prfmpldl2keep = 3, Arm64prfmpldl2strm = 4, Arm64prfmpldl3keep = 5,
      Arm64prfmpldl3strm = 6, Arm64prfmplil1keep = 9, Arm64prfmplil1strm = 10,
      Arm64prfmplil2keep = 11, Arm64prfmplil2strm = 12, Arm64prfmplil3keep = 13,
      Arm64prfmplil3strm = 14, Arm64prfmpstl1keep = 17, Arm64prfmpstl1strm = 18,
      Arm64prfmpstl2keep = 19, Arm64prfmpstl2strm = 20, Arm64prfmpstl3keep = 21,
      Arm64prfmpstl3strm = 22
else:
  static :
    hint("Declaration of " & "enumarm64prefetchop" &
        " already exists, not redeclaring")
when not declared(enumarm64reg):
  type
    enumarm64reg* {.size: sizeof(cuint).} = enum
      Arm64reginvalid = 0, Arm64regx29 = 1, Arm64regx30 = 2, Arm64regnzcv = 3,
      Arm64regsp = 4, Arm64regwsp = 5, Arm64regwzr = 6, Arm64regxzr = 7,
      Arm64regb0 = 8, Arm64regb1 = 9, Arm64regb2 = 10, Arm64regb3 = 11,
      Arm64regb4 = 12, Arm64regb5 = 13, Arm64regb6 = 14, Arm64regb7 = 15,
      Arm64regb8 = 16, Arm64regb9 = 17, Arm64regb10 = 18, Arm64regb11 = 19,
      Arm64regb12 = 20, Arm64regb13 = 21, Arm64regb14 = 22, Arm64regb15 = 23,
      Arm64regb16 = 24, Arm64regb17 = 25, Arm64regb18 = 26, Arm64regb19 = 27,
      Arm64regb20 = 28, Arm64regb21 = 29, Arm64regb22 = 30, Arm64regb23 = 31,
      Arm64regb24 = 32, Arm64regb25 = 33, Arm64regb26 = 34, Arm64regb27 = 35,
      Arm64regb28 = 36, Arm64regb29 = 37, Arm64regb30 = 38, Arm64regb31 = 39,
      Arm64regd0 = 40, Arm64regd1 = 41, Arm64regd2 = 42, Arm64regd3 = 43,
      Arm64regd4 = 44, Arm64regd5 = 45, Arm64regd6 = 46, Arm64regd7 = 47,
      Arm64regd8 = 48, Arm64regd9 = 49, Arm64regd10 = 50, Arm64regd11 = 51,
      Arm64regd12 = 52, Arm64regd13 = 53, Arm64regd14 = 54, Arm64regd15 = 55,
      Arm64regd16 = 56, Arm64regd17 = 57, Arm64regd18 = 58, Arm64regd19 = 59,
      Arm64regd20 = 60, Arm64regd21 = 61, Arm64regd22 = 62, Arm64regd23 = 63,
      Arm64regd24 = 64, Arm64regd25 = 65, Arm64regd26 = 66, Arm64regd27 = 67,
      Arm64regd28 = 68, Arm64regd29 = 69, Arm64regd30 = 70, Arm64regd31 = 71,
      Arm64regh0 = 72, Arm64regh1 = 73, Arm64regh2 = 74, Arm64regh3 = 75,
      Arm64regh4 = 76, Arm64regh5 = 77, Arm64regh6 = 78, Arm64regh7 = 79,
      Arm64regh8 = 80, Arm64regh9 = 81, Arm64regh10 = 82, Arm64regh11 = 83,
      Arm64regh12 = 84, Arm64regh13 = 85, Arm64regh14 = 86, Arm64regh15 = 87,
      Arm64regh16 = 88, Arm64regh17 = 89, Arm64regh18 = 90, Arm64regh19 = 91,
      Arm64regh20 = 92, Arm64regh21 = 93, Arm64regh22 = 94, Arm64regh23 = 95,
      Arm64regh24 = 96, Arm64regh25 = 97, Arm64regh26 = 98, Arm64regh27 = 99,
      Arm64regh28 = 100, Arm64regh29 = 101, Arm64regh30 = 102,
      Arm64regh31 = 103, Arm64regq0 = 104, Arm64regq1 = 105, Arm64regq2 = 106,
      Arm64regq3 = 107, Arm64regq4 = 108, Arm64regq5 = 109, Arm64regq6 = 110,
      Arm64regq7 = 111, Arm64regq8 = 112, Arm64regq9 = 113, Arm64regq10 = 114,
      Arm64regq11 = 115, Arm64regq12 = 116, Arm64regq13 = 117,
      Arm64regq14 = 118, Arm64regq15 = 119, Arm64regq16 = 120,
      Arm64regq17 = 121, Arm64regq18 = 122, Arm64regq19 = 123,
      Arm64regq20 = 124, Arm64regq21 = 125, Arm64regq22 = 126,
      Arm64regq23 = 127, Arm64regq24 = 128, Arm64regq25 = 129,
      Arm64regq26 = 130, Arm64regq27 = 131, Arm64regq28 = 132,
      Arm64regq29 = 133, Arm64regq30 = 134, Arm64regq31 = 135, Arm64regs0 = 136,
      Arm64regs1 = 137, Arm64regs2 = 138, Arm64regs3 = 139, Arm64regs4 = 140,
      Arm64regs5 = 141, Arm64regs6 = 142, Arm64regs7 = 143, Arm64regs8 = 144,
      Arm64regs9 = 145, Arm64regs10 = 146, Arm64regs11 = 147, Arm64regs12 = 148,
      Arm64regs13 = 149, Arm64regs14 = 150, Arm64regs15 = 151,
      Arm64regs16 = 152, Arm64regs17 = 153, Arm64regs18 = 154,
      Arm64regs19 = 155, Arm64regs20 = 156, Arm64regs21 = 157,
      Arm64regs22 = 158, Arm64regs23 = 159, Arm64regs24 = 160,
      Arm64regs25 = 161, Arm64regs26 = 162, Arm64regs27 = 163,
      Arm64regs28 = 164, Arm64regs29 = 165, Arm64regs30 = 166,
      Arm64regs31 = 167, Arm64regw0 = 168, Arm64regw1 = 169, Arm64regw2 = 170,
      Arm64regw3 = 171, Arm64regw4 = 172, Arm64regw5 = 173, Arm64regw6 = 174,
      Arm64regw7 = 175, Arm64regw8 = 176, Arm64regw9 = 177, Arm64regw10 = 178,
      Arm64regw11 = 179, Arm64regw12 = 180, Arm64regw13 = 181,
      Arm64regw14 = 182, Arm64regw15 = 183, Arm64regw16 = 184,
      Arm64regw17 = 185, Arm64regw18 = 186, Arm64regw19 = 187,
      Arm64regw20 = 188, Arm64regw21 = 189, Arm64regw22 = 190,
      Arm64regw23 = 191, Arm64regw24 = 192, Arm64regw25 = 193,
      Arm64regw26 = 194, Arm64regw27 = 195, Arm64regw28 = 196,
      Arm64regw29 = 197, Arm64regw30 = 198, Arm64regx0 = 199, Arm64regx1 = 200,
      Arm64regx2 = 201, Arm64regx3 = 202, Arm64regx4 = 203, Arm64regx5 = 204,
      Arm64regx6 = 205, Arm64regx7 = 206, Arm64regx8 = 207, Arm64regx9 = 208,
      Arm64regx10 = 209, Arm64regx11 = 210, Arm64regx12 = 211,
      Arm64regx13 = 212, Arm64regx14 = 213, Arm64regx15 = 214,
      Arm64regx16 = 215, Arm64regx17 = 216, Arm64regx18 = 217,
      Arm64regx19 = 218, Arm64regx20 = 219, Arm64regx21 = 220,
      Arm64regx22 = 221, Arm64regx23 = 222, Arm64regx24 = 223,
      Arm64regx25 = 224, Arm64regx26 = 225, Arm64regx27 = 226,
      Arm64regx28 = 227, Arm64regv0 = 228, Arm64regv1 = 229, Arm64regv2 = 230,
      Arm64regv3 = 231, Arm64regv4 = 232, Arm64regv5 = 233, Arm64regv6 = 234,
      Arm64regv7 = 235, Arm64regv8 = 236, Arm64regv9 = 237, Arm64regv10 = 238,
      Arm64regv11 = 239, Arm64regv12 = 240, Arm64regv13 = 241,
      Arm64regv14 = 242, Arm64regv15 = 243, Arm64regv16 = 244,
      Arm64regv17 = 245, Arm64regv18 = 246, Arm64regv19 = 247,
      Arm64regv20 = 248, Arm64regv21 = 249, Arm64regv22 = 250,
      Arm64regv23 = 251, Arm64regv24 = 252, Arm64regv25 = 253,
      Arm64regv26 = 254, Arm64regv27 = 255, Arm64regv28 = 256,
      Arm64regv29 = 257, Arm64regv30 = 258, Arm64regv31 = 259,
      Arm64regending = 260
else:
  static :
    hint("Declaration of " & "enumarm64reg" & " already exists, not redeclaring")
when not declared(Arm64regip0):
  const
    Arm64regip0* = enumarm64reg.Arm64regx16
else:
  static :
    hint("Declaration of " & "Arm64regip0" & " already exists, not redeclaring")
when not declared(Arm64regip1):
  const
    Arm64regip1* = enumarm64reg.Arm64regx17
else:
  static :
    hint("Declaration of " & "Arm64regip1" & " already exists, not redeclaring")
when not declared(Arm64regfp):
  const
    Arm64regfp* = enumarm64reg.Arm64regx29
else:
  static :
    hint("Declaration of " & "Arm64regfp" & " already exists, not redeclaring")
when not declared(Arm64reglr):
  const
    Arm64reglr* = enumarm64reg.Arm64regx30
else:
  static :
    hint("Declaration of " & "Arm64reglr" & " already exists, not redeclaring")
when not declared(enumarm64insn):
  type
    enumarm64insn* {.size: sizeof(cuint).} = enum
      Arm64insinvalid = 0, Arm64insabs = 1, Arm64insadc = 2, Arm64insaddhn = 3,
      Arm64insaddhn2 = 4, Arm64insaddp = 5, Arm64insadd = 6, Arm64insaddv = 7,
      Arm64insadr = 8, Arm64insadrp = 9, Arm64insaesd = 10, Arm64insaese = 11,
      Arm64insaesimc = 12, Arm64insaesmc = 13, Arm64insand = 14,
      Arm64insasr = 15, Arm64insb = 16, Arm64insbfm = 17, Arm64insbic = 18,
      Arm64insbif = 19, Arm64insbit = 20, Arm64insbl = 21, Arm64insblr = 22,
      Arm64insbr = 23, Arm64insbrk = 24, Arm64insbsl = 25, Arm64inscbnz = 26,
      Arm64inscbz = 27, Arm64insccmn = 28, Arm64insccmp = 29,
      Arm64insclrex = 30, Arm64inscls = 31, Arm64insclz = 32, Arm64inscmeq = 33,
      Arm64inscmge = 34, Arm64inscmgt = 35, Arm64inscmhi = 36,
      Arm64inscmhs = 37, Arm64inscmle = 38, Arm64inscmlt = 39,
      Arm64inscmtst = 40, Arm64inscnt = 41, Arm64insmov = 42,
      Arm64inscrc32b = 43, Arm64inscrc32cb = 44, Arm64inscrc32ch = 45,
      Arm64inscrc32cw = 46, Arm64inscrc32cx = 47, Arm64inscrc32h = 48,
      Arm64inscrc32w = 49, Arm64inscrc32x = 50, Arm64inscsel = 51,
      Arm64inscsinc = 52, Arm64inscsinv = 53, Arm64inscsneg = 54,
      Arm64insdcps1 = 55, Arm64insdcps2 = 56, Arm64insdcps3 = 57,
      Arm64insdmb = 58, Arm64insdrps = 59, Arm64insdsb = 60, Arm64insdup = 61,
      Arm64inseon = 62, Arm64inseor = 63, Arm64inseret = 64, Arm64insextr = 65,
      Arm64insext = 66, Arm64insfabd = 67, Arm64insfabs = 68,
      Arm64insfacge = 69, Arm64insfacgt = 70, Arm64insfadd = 71,
      Arm64insfaddp = 72, Arm64insfccmp = 73, Arm64insfccmpe = 74,
      Arm64insfcmeq = 75, Arm64insfcmge = 76, Arm64insfcmgt = 77,
      Arm64insfcmle = 78, Arm64insfcmlt = 79, Arm64insfcmp = 80,
      Arm64insfcmpe = 81, Arm64insfcsel = 82, Arm64insfcvtas = 83,
      Arm64insfcvtau = 84, Arm64insfcvt = 85, Arm64insfcvtl = 86,
      Arm64insfcvtl2 = 87, Arm64insfcvtms = 88, Arm64insfcvtmu = 89,
      Arm64insfcvtns = 90, Arm64insfcvtnu = 91, Arm64insfcvtn = 92,
      Arm64insfcvtn2 = 93, Arm64insfcvtps = 94, Arm64insfcvtpu = 95,
      Arm64insfcvtxn = 96, Arm64insfcvtxn2 = 97, Arm64insfcvtzs = 98,
      Arm64insfcvtzu = 99, Arm64insfdiv = 100, Arm64insfmadd = 101,
      Arm64insfmax = 102, Arm64insfmaxnm = 103, Arm64insfmaxnmp = 104,
      Arm64insfmaxnmv = 105, Arm64insfmaxp = 106, Arm64insfmaxv = 107,
      Arm64insfmin = 108, Arm64insfminnm = 109, Arm64insfminnmp = 110,
      Arm64insfminnmv = 111, Arm64insfminp = 112, Arm64insfminv = 113,
      Arm64insfmla = 114, Arm64insfmls = 115, Arm64insfmov = 116,
      Arm64insfmsub = 117, Arm64insfmul = 118, Arm64insfmulx = 119,
      Arm64insfneg = 120, Arm64insfnmadd = 121, Arm64insfnmsub = 122,
      Arm64insfnmul = 123, Arm64insfrecpe = 124, Arm64insfrecps = 125,
      Arm64insfrecpx = 126, Arm64insfrinta = 127, Arm64insfrinti = 128,
      Arm64insfrintm = 129, Arm64insfrintn = 130, Arm64insfrintp = 131,
      Arm64insfrintx = 132, Arm64insfrintz = 133, Arm64insfrsqrte = 134,
      Arm64insfrsqrts = 135, Arm64insfsqrt = 136, Arm64insfsub = 137,
      Arm64inshint = 138, Arm64inshlt = 139, Arm64inshvc = 140,
      Arm64insins = 141, Arm64insisb = 142, Arm64insld1 = 143,
      Arm64insld1r = 144, Arm64insld2r = 145, Arm64insld2 = 146,
      Arm64insld3r = 147, Arm64insld3 = 148, Arm64insld4 = 149,
      Arm64insld4r = 150, Arm64insldarb = 151, Arm64insldarh = 152,
      Arm64insldar = 153, Arm64insldaxp = 154, Arm64insldaxrb = 155,
      Arm64insldaxrh = 156, Arm64insldaxr = 157, Arm64insldnp = 158,
      Arm64insldp = 159, Arm64insldpsw = 160, Arm64insldrb = 161,
      Arm64insldr = 162, Arm64insldrh = 163, Arm64insldrsb = 164,
      Arm64insldrsh = 165, Arm64insldrsw = 166, Arm64insldtrb = 167,
      Arm64insldtrh = 168, Arm64insldtrsb = 169, Arm64insldtrsh = 170,
      Arm64insldtrsw = 171, Arm64insldtr = 172, Arm64insldurb = 173,
      Arm64insldur = 174, Arm64insldurh = 175, Arm64insldursb = 176,
      Arm64insldursh = 177, Arm64insldursw = 178, Arm64insldxp = 179,
      Arm64insldxrb = 180, Arm64insldxrh = 181, Arm64insldxr = 182,
      Arm64inslsl = 183, Arm64inslsr = 184, Arm64insmadd = 185,
      Arm64insmla = 186, Arm64insmls = 187, Arm64insmovi = 188,
      Arm64insmovk = 189, Arm64insmovn = 190, Arm64insmovz = 191,
      Arm64insmrs = 192, Arm64insmsr = 193, Arm64insmsub = 194,
      Arm64insmul = 195, Arm64insmvni = 196, Arm64insneg = 197,
      Arm64insnot = 198, Arm64insorn = 199, Arm64insorr = 200,
      Arm64inspmull2 = 201, Arm64inspmull = 202, Arm64inspmul = 203,
      Arm64insprfm = 204, Arm64insprfum = 205, Arm64insraddhn = 206,
      Arm64insraddhn2 = 207, Arm64insrbit = 208, Arm64insret = 209,
      Arm64insrev16 = 210, Arm64insrev32 = 211, Arm64insrev64 = 212,
      Arm64insrev = 213, Arm64insror = 214, Arm64insrshrn2 = 215,
      Arm64insrshrn = 216, Arm64insrsubhn = 217, Arm64insrsubhn2 = 218,
      Arm64inssabal2 = 219, Arm64inssabal = 220, Arm64inssaba = 221,
      Arm64inssabdl2 = 222, Arm64inssabdl = 223, Arm64inssabd = 224,
      Arm64inssadalp = 225, Arm64inssaddlp = 226, Arm64inssaddlv = 227,
      Arm64inssaddl2 = 228, Arm64inssaddl = 229, Arm64inssaddw2 = 230,
      Arm64inssaddw = 231, Arm64inssbc = 232, Arm64inssbfm = 233,
      Arm64insscvtf = 234, Arm64inssdiv = 235, Arm64inssha1c = 236,
      Arm64inssha1h = 237, Arm64inssha1m = 238, Arm64inssha1p = 239,
      Arm64inssha1su0 = 240, Arm64inssha1su1 = 241, Arm64inssha256h2 = 242,
      Arm64inssha256h = 243, Arm64inssha256su0 = 244, Arm64inssha256su1 = 245,
      Arm64insshadd = 246, Arm64insshll2 = 247, Arm64insshll = 248,
      Arm64insshl = 249, Arm64insshrn2 = 250, Arm64insshrn = 251,
      Arm64insshsub = 252, Arm64inssli = 253, Arm64inssmaddl = 254,
      Arm64inssmaxp = 255, Arm64inssmaxv = 256, Arm64inssmax = 257,
      Arm64inssmc = 258, Arm64inssminp = 259, Arm64inssminv = 260,
      Arm64inssmin = 261, Arm64inssmlal2 = 262, Arm64inssmlal = 263,
      Arm64inssmlsl2 = 264, Arm64inssmlsl = 265, Arm64inssmov = 266,
      Arm64inssmsubl = 267, Arm64inssmulh = 268, Arm64inssmull2 = 269,
      Arm64inssmull = 270, Arm64inssqabs = 271, Arm64inssqadd = 272,
      Arm64inssqdmlal = 273, Arm64inssqdmlal2 = 274, Arm64inssqdmlsl = 275,
      Arm64inssqdmlsl2 = 276, Arm64inssqdmulh = 277, Arm64inssqdmull = 278,
      Arm64inssqdmull2 = 279, Arm64inssqneg = 280, Arm64inssqrdmulh = 281,
      Arm64inssqrshl = 282, Arm64inssqrshrn = 283, Arm64inssqrshrn2 = 284,
      Arm64inssqrshrun = 285, Arm64inssqrshrun2 = 286, Arm64inssqshlu = 287,
      Arm64inssqshl = 288, Arm64inssqshrn = 289, Arm64inssqshrn2 = 290,
      Arm64inssqshrun = 291, Arm64inssqshrun2 = 292, Arm64inssqsub = 293,
      Arm64inssqxtn2 = 294, Arm64inssqxtn = 295, Arm64inssqxtun2 = 296,
      Arm64inssqxtun = 297, Arm64inssrhadd = 298, Arm64inssri = 299,
      Arm64inssrshl = 300, Arm64inssrshr = 301, Arm64inssrsra = 302,
      Arm64inssshll2 = 303, Arm64inssshll = 304, Arm64inssshl = 305,
      Arm64inssshr = 306, Arm64insssra = 307, Arm64insssubl2 = 308,
      Arm64insssubl = 309, Arm64insssubw2 = 310, Arm64insssubw = 311,
      Arm64insst1 = 312, Arm64insst2 = 313, Arm64insst3 = 314,
      Arm64insst4 = 315, Arm64insstlrb = 316, Arm64insstlrh = 317,
      Arm64insstlr = 318, Arm64insstlxp = 319, Arm64insstlxrb = 320,
      Arm64insstlxrh = 321, Arm64insstlxr = 322, Arm64insstnp = 323,
      Arm64insstp = 324, Arm64insstrb = 325, Arm64insstr = 326,
      Arm64insstrh = 327, Arm64inssttrb = 328, Arm64inssttrh = 329,
      Arm64inssttr = 330, Arm64inssturb = 331, Arm64insstur = 332,
      Arm64inssturh = 333, Arm64insstxp = 334, Arm64insstxrb = 335,
      Arm64insstxrh = 336, Arm64insstxr = 337, Arm64inssubhn = 338,
      Arm64inssubhn2 = 339, Arm64inssub = 340, Arm64inssuqadd = 341,
      Arm64inssvc = 342, Arm64inssysl = 343, Arm64inssys = 344,
      Arm64instbl = 345, Arm64instbnz = 346, Arm64instbx = 347,
      Arm64instbz = 348, Arm64instrn1 = 349, Arm64instrn2 = 350,
      Arm64insuabal2 = 351, Arm64insuabal = 352, Arm64insuaba = 353,
      Arm64insuabdl2 = 354, Arm64insuabdl = 355, Arm64insuabd = 356,
      Arm64insuadalp = 357, Arm64insuaddlp = 358, Arm64insuaddlv = 359,
      Arm64insuaddl2 = 360, Arm64insuaddl = 361, Arm64insuaddw2 = 362,
      Arm64insuaddw = 363, Arm64insubfm = 364, Arm64insucvtf = 365,
      Arm64insudiv = 366, Arm64insuhadd = 367, Arm64insuhsub = 368,
      Arm64insumaddl = 369, Arm64insumaxp = 370, Arm64insumaxv = 371,
      Arm64insumax = 372, Arm64insuminp = 373, Arm64insuminv = 374,
      Arm64insumin = 375, Arm64insumlal2 = 376, Arm64insumlal = 377,
      Arm64insumlsl2 = 378, Arm64insumlsl = 379, Arm64insumov = 380,
      Arm64insumsubl = 381, Arm64insumulh = 382, Arm64insumull2 = 383,
      Arm64insumull = 384, Arm64insuqadd = 385, Arm64insuqrshl = 386,
      Arm64insuqrshrn = 387, Arm64insuqrshrn2 = 388, Arm64insuqshl = 389,
      Arm64insuqshrn = 390, Arm64insuqshrn2 = 391, Arm64insuqsub = 392,
      Arm64insuqxtn2 = 393, Arm64insuqxtn = 394, Arm64insurecpe = 395,
      Arm64insurhadd = 396, Arm64insurshl = 397, Arm64insurshr = 398,
      Arm64insursqrte = 399, Arm64insursra = 400, Arm64insushll2 = 401,
      Arm64insushll = 402, Arm64insushl = 403, Arm64insushr = 404,
      Arm64insusqadd = 405, Arm64insusra = 406, Arm64insusubl2 = 407,
      Arm64insusubl = 408, Arm64insusubw2 = 409, Arm64insusubw = 410,
      Arm64insuzp1 = 411, Arm64insuzp2 = 412, Arm64insxtn2 = 413,
      Arm64insxtn = 414, Arm64inszip1 = 415, Arm64inszip2 = 416,
      Arm64insmneg = 417, Arm64insumnegl = 418, Arm64inssmnegl = 419,
      Arm64insnop = 420, Arm64insyield = 421, Arm64inswfe = 422,
      Arm64inswfi = 423, Arm64inssev = 424, Arm64inssevl = 425,
      Arm64insngc = 426, Arm64inssbfiz = 427, Arm64insubfiz = 428,
      Arm64inssbfx = 429, Arm64insubfx = 430, Arm64insbfi = 431,
      Arm64insbfxil = 432, Arm64inscmn = 433, Arm64insmvn = 434,
      Arm64instst = 435, Arm64inscset = 436, Arm64inscinc = 437,
      Arm64inscsetm = 438, Arm64inscinv = 439, Arm64inscneg = 440,
      Arm64inssxtb = 441, Arm64inssxth = 442, Arm64inssxtw = 443,
      Arm64inscmp = 444, Arm64insuxtb = 445, Arm64insuxth = 446,
      Arm64insuxtw = 447, Arm64insic = 448, Arm64insdc = 449, Arm64insat = 450,
      Arm64instlbi = 451, Arm64insnegs = 452, Arm64insngcs = 453,
      Arm64insending = 454
else:
  static :
    hint("Declaration of " & "enumarm64insn" &
        " already exists, not redeclaring")
when not declared(enumarm64insngroup):
  type
    enumarm64insngroup* {.size: sizeof(cuint).} = enum
      Arm64grpinvalid = 0, Arm64grpjump = 1, Arm64grpcall = 2, Arm64grpret = 3,
      Arm64grpint = 4, Arm64grpprivilege = 6, Arm64grpbranchrelative = 7,
      Arm64grpcrypto = 128, Arm64grpfparmv8 = 129, Arm64grpneon = 130,
      Arm64grpcrc = 131, Arm64grpending = 132
else:
  static :
    hint("Declaration of " & "enumarm64insngroup" &
        " already exists, not redeclaring")
when not declared(enumm68kreg):
  type
    enumm68kreg* {.size: sizeof(cuint).} = enum
      M68kreginvalid = 0, M68kregd0 = 1, M68kregd1 = 2, M68kregd2 = 3,
      M68kregd3 = 4, M68kregd4 = 5, M68kregd5 = 6, M68kregd6 = 7, M68kregd7 = 8,
      M68krega0 = 9, M68krega1 = 10, M68krega2 = 11, M68krega3 = 12,
      M68krega4 = 13, M68krega5 = 14, M68krega6 = 15, M68krega7 = 16,
      M68kregfp0 = 17, M68kregfp1 = 18, M68kregfp2 = 19, M68kregfp3 = 20,
      M68kregfp4 = 21, M68kregfp5 = 22, M68kregfp6 = 23, M68kregfp7 = 24,
      M68kregpc = 25, M68kregsr = 26, M68kregccr = 27, M68kregsfc = 28,
      M68kregdfc = 29, M68kregusp = 30, M68kregvbr = 31, M68kregcacr = 32,
      M68kregcaar = 33, M68kregmsp = 34, M68kregisp = 35, M68kregtc = 36,
      M68kregitt0 = 37, M68kregitt1 = 38, M68kregdtt0 = 39, M68kregdtt1 = 40,
      M68kregmmusr = 41, M68kregurp = 42, M68kregsrp = 43, M68kregfpcr = 44,
      M68kregfpsr = 45, M68kregfpiar = 46, M68kregending = 47
else:
  static :
    hint("Declaration of " & "enumm68kreg" & " already exists, not redeclaring")
when not declared(enumm68kaddressmode):
  type
    enumm68kaddressmode* {.size: sizeof(cuint).} = enum
      M68kamnone = 0, M68kamregdirectdata = 1, M68kamregdirectaddr = 2,
      M68kamregiaddr = 3, M68kamregiaddrpostinc = 4, M68kamregiaddrpredec = 5,
      M68kamregiaddrdisp = 6, M68kamaregiindex8bitdisp = 7,
      M68kamaregiindexbasedisp = 8, M68kammemipostindex = 9,
      M68kammemipreindex = 10, M68kampcidisp = 11, M68kampciindex8bitdisp = 12,
      M68kampciindexbasedisp = 13, M68kampcmemipostindex = 14,
      M68kampcmemipreindex = 15, M68kamabsolutedatashort = 16,
      M68kamabsolutedatalong = 17, M68kamimmediate = 18,
      M68kambranchdisplacement = 19
else:
  static :
    hint("Declaration of " & "enumm68kaddressmode" &
        " already exists, not redeclaring")
when not declared(enumm68koptype):
  type
    enumm68koptype* {.size: sizeof(cuint).} = enum
      M68kopinvalid = 0, M68kopreg = 1, M68kopimm = 2, M68kopmem = 3,
      M68kopfpsingle = 4, M68kopfpdouble = 5, M68kopregbits = 6,
      M68kopregpair = 7, M68kopbrdisp = 8
else:
  static :
    hint("Declaration of " & "enumm68koptype" &
        " already exists, not redeclaring")
when not declared(enumm68kopbrdispsize):
  type
    enumm68kopbrdispsize* {.size: sizeof(cuint).} = enum
      M68kopbrdispsizeinvalid = 0, M68kopbrdispsizebyte = 1,
      M68kopbrdispsizeword = 2, M68kopbrdispsizelong = 4
else:
  static :
    hint("Declaration of " & "enumm68kopbrdispsize" &
        " already exists, not redeclaring")
when not declared(enumm68kcpusize):
  type
    enumm68kcpusize* {.size: sizeof(cuint).} = enum
      M68kcpusizenone = 0, M68kcpusizebyte = 1, M68kcpusizeword = 2,
      M68kcpusizelong = 4
else:
  static :
    hint("Declaration of " & "enumm68kcpusize" &
        " already exists, not redeclaring")
when not declared(enumm68kfpusize):
  type
    enumm68kfpusize* {.size: sizeof(cuint).} = enum
      M68kfpusizenone = 0, M68kfpusizesingle = 4, M68kfpusizedouble = 8,
      M68kfpusizeextended = 12
else:
  static :
    hint("Declaration of " & "enumm68kfpusize" &
        " already exists, not redeclaring")
when not declared(enumm68ksizetype):
  type
    enumm68ksizetype* {.size: sizeof(cuint).} = enum
      M68ksizetypeinvalid = 0, M68ksizetypecpu = 1, M68ksizetypefpu = 2
else:
  static :
    hint("Declaration of " & "enumm68ksizetype" &
        " already exists, not redeclaring")
when not declared(enumm68kinsn):
  type
    enumm68kinsn* {.size: sizeof(cuint).} = enum
      M68kinsinvalid = 0, M68kinsabcd = 1, M68kinsadd = 2, M68kinsadda = 3,
      M68kinsaddi = 4, M68kinsaddq = 5, M68kinsaddx = 6, M68kinsand = 7,
      M68kinsandi = 8, M68kinsasl = 9, M68kinsasr = 10, M68kinsbhs = 11,
      M68kinsblo = 12, M68kinsbhi = 13, M68kinsbls = 14, M68kinsbcc = 15,
      M68kinsbcs = 16, M68kinsbne = 17, M68kinsbeq = 18, M68kinsbvc = 19,
      M68kinsbvs = 20, M68kinsbpl = 21, M68kinsbmi = 22, M68kinsbge = 23,
      M68kinsblt = 24, M68kinsbgt = 25, M68kinsble = 26, M68kinsbra = 27,
      M68kinsbsr = 28, M68kinsbchg = 29, M68kinsbclr = 30, M68kinsbset = 31,
      M68kinsbtst = 32, M68kinsbfchg = 33, M68kinsbfclr = 34,
      M68kinsbfexts = 35, M68kinsbfextu = 36, M68kinsbfffo = 37,
      M68kinsbfins = 38, M68kinsbfset = 39, M68kinsbftst = 40, M68kinsbkpt = 41,
      M68kinscallm = 42, M68kinscas = 43, M68kinscas2 = 44, M68kinschk = 45,
      M68kinschk2 = 46, M68kinsclr = 47, M68kinscmp = 48, M68kinscmpa = 49,
      M68kinscmpi = 50, M68kinscmpm = 51, M68kinscmp2 = 52, M68kinscinvl = 53,
      M68kinscinvp = 54, M68kinscinva = 55, M68kinscpushl = 56,
      M68kinscpushp = 57, M68kinscpusha = 58, M68kinsdbt = 59, M68kinsdbf = 60,
      M68kinsdbhi = 61, M68kinsdbls = 62, M68kinsdbcc = 63, M68kinsdbcs = 64,
      M68kinsdbne = 65, M68kinsdbeq = 66, M68kinsdbvc = 67, M68kinsdbvs = 68,
      M68kinsdbpl = 69, M68kinsdbmi = 70, M68kinsdbge = 71, M68kinsdblt = 72,
      M68kinsdbgt = 73, M68kinsdble = 74, M68kinsdbra = 75, M68kinsdivs = 76,
      M68kinsdivsl = 77, M68kinsdivu = 78, M68kinsdivul = 79, M68kinseor = 80,
      M68kinseori = 81, M68kinsexg = 82, M68kinsext = 83, M68kinsextb = 84,
      M68kinsfabs = 85, M68kinsfsabs = 86, M68kinsfdabs = 87, M68kinsfacos = 88,
      M68kinsfadd = 89, M68kinsfsadd = 90, M68kinsfdadd = 91, M68kinsfasin = 92,
      M68kinsfatan = 93, M68kinsfatanh = 94, M68kinsfbf = 95, M68kinsfbeq = 96,
      M68kinsfbogt = 97, M68kinsfboge = 98, M68kinsfbolt = 99,
      M68kinsfbole = 100, M68kinsfbogl = 101, M68kinsfbor = 102,
      M68kinsfbun = 103, M68kinsfbueq = 104, M68kinsfbugt = 105,
      M68kinsfbuge = 106, M68kinsfbult = 107, M68kinsfbule = 108,
      M68kinsfbne = 109, M68kinsfbt = 110, M68kinsfbsf = 111,
      M68kinsfbseq = 112, M68kinsfbgt = 113, M68kinsfbge = 114,
      M68kinsfblt = 115, M68kinsfble = 116, M68kinsfbgl = 117,
      M68kinsfbgle = 118, M68kinsfbngle = 119, M68kinsfbngl = 120,
      M68kinsfbnle = 121, M68kinsfbnlt = 122, M68kinsfbnge = 123,
      M68kinsfbngt = 124, M68kinsfbsne = 125, M68kinsfbst = 126,
      M68kinsfcmp = 127, M68kinsfcos = 128, M68kinsfcosh = 129,
      M68kinsfdbf = 130, M68kinsfdbeq = 131, M68kinsfdbogt = 132,
      M68kinsfdboge = 133, M68kinsfdbolt = 134, M68kinsfdbole = 135,
      M68kinsfdbogl = 136, M68kinsfdbor = 137, M68kinsfdbun = 138,
      M68kinsfdbueq = 139, M68kinsfdbugt = 140, M68kinsfdbuge = 141,
      M68kinsfdbult = 142, M68kinsfdbule = 143, M68kinsfdbne = 144,
      M68kinsfdbt = 145, M68kinsfdbsf = 146, M68kinsfdbseq = 147,
      M68kinsfdbgt = 148, M68kinsfdbge = 149, M68kinsfdblt = 150,
      M68kinsfdble = 151, M68kinsfdbgl = 152, M68kinsfdbgle = 153,
      M68kinsfdbngle = 154, M68kinsfdbngl = 155, M68kinsfdbnle = 156,
      M68kinsfdbnlt = 157, M68kinsfdbnge = 158, M68kinsfdbngt = 159,
      M68kinsfdbsne = 160, M68kinsfdbst = 161, M68kinsfdiv = 162,
      M68kinsfsdiv = 163, M68kinsfddiv = 164, M68kinsfetox = 165,
      M68kinsfetoxm1 = 166, M68kinsfgetexp = 167, M68kinsfgetman = 168,
      M68kinsfint = 169, M68kinsfintrz = 170, M68kinsflog10 = 171,
      M68kinsflog2 = 172, M68kinsflogn = 173, M68kinsflognp1 = 174,
      M68kinsfmod = 175, M68kinsfmove = 176, M68kinsfsmove = 177,
      M68kinsfdmove = 178, M68kinsfmovecr = 179, M68kinsfmovem = 180,
      M68kinsfmul = 181, M68kinsfsmul = 182, M68kinsfdmul = 183,
      M68kinsfneg = 184, M68kinsfsneg = 185, M68kinsfdneg = 186,
      M68kinsfnop = 187, M68kinsfrem = 188, M68kinsfrestore = 189,
      M68kinsfsave = 190, M68kinsfscale = 191, M68kinsfsgldiv = 192,
      M68kinsfsglmul = 193, M68kinsfsin = 194, M68kinsfsincos = 195,
      M68kinsfsinh = 196, M68kinsfsqrt = 197, M68kinsfssqrt = 198,
      M68kinsfdsqrt = 199, M68kinsfsf = 200, M68kinsfsbeq = 201,
      M68kinsfsogt = 202, M68kinsfsoge = 203, M68kinsfsolt = 204,
      M68kinsfsole = 205, M68kinsfsogl = 206, M68kinsfsor = 207,
      M68kinsfsun = 208, M68kinsfsueq = 209, M68kinsfsugt = 210,
      M68kinsfsuge = 211, M68kinsfsult = 212, M68kinsfsule = 213,
      M68kinsfsne = 214, M68kinsfst = 215, M68kinsfssf = 216,
      M68kinsfsseq = 217, M68kinsfsgt = 218, M68kinsfsge = 219,
      M68kinsfslt = 220, M68kinsfsle = 221, M68kinsfsgl = 222,
      M68kinsfsgle = 223, M68kinsfsngle = 224, M68kinsfsngl = 225,
      M68kinsfsnle = 226, M68kinsfsnlt = 227, M68kinsfsnge = 228,
      M68kinsfsngt = 229, M68kinsfssne = 230, M68kinsfsst = 231,
      M68kinsfsub = 232, M68kinsfssub = 233, M68kinsfdsub = 234,
      M68kinsftan = 235, M68kinsftanh = 236, M68kinsftentox = 237,
      M68kinsftrapf = 238, M68kinsftrapeq = 239, M68kinsftrapogt = 240,
      M68kinsftrapoge = 241, M68kinsftrapolt = 242, M68kinsftrapole = 243,
      M68kinsftrapogl = 244, M68kinsftrapor = 245, M68kinsftrapun = 246,
      M68kinsftrapueq = 247, M68kinsftrapugt = 248, M68kinsftrapuge = 249,
      M68kinsftrapult = 250, M68kinsftrapule = 251, M68kinsftrapne = 252,
      M68kinsftrapt = 253, M68kinsftrapsf = 254, M68kinsftrapseq = 255,
      M68kinsftrapgt = 256, M68kinsftrapge = 257, M68kinsftraplt = 258,
      M68kinsftraple = 259, M68kinsftrapgl = 260, M68kinsftrapgle = 261,
      M68kinsftrapngle = 262, M68kinsftrapngl = 263, M68kinsftrapnle = 264,
      M68kinsftrapnlt = 265, M68kinsftrapnge = 266, M68kinsftrapngt = 267,
      M68kinsftrapsne = 268, M68kinsftrapst = 269, M68kinsftst = 270,
      M68kinsftwotox = 271, M68kinshalt = 272, M68kinsillegal = 273,
      M68kinsjmp = 274, M68kinsjsr = 275, M68kinslea = 276, M68kinslink = 277,
      M68kinslpstop = 278, M68kinslsl = 279, M68kinslsr = 280,
      M68kinsmove = 281, M68kinsmovea = 282, M68kinsmovec = 283,
      M68kinsmovem = 284, M68kinsmovep = 285, M68kinsmoveq = 286,
      M68kinsmoves = 287, M68kinsmove16 = 288, M68kinsmuls = 289,
      M68kinsmulu = 290, M68kinsnbcd = 291, M68kinsneg = 292, M68kinsnegx = 293,
      M68kinsnop = 294, M68kinsnot = 295, M68kinsor = 296, M68kinsori = 297,
      M68kinspack = 298, M68kinspea = 299, M68kinspflush = 300,
      M68kinspflusha = 301, M68kinspflushan = 302, M68kinspflushn = 303,
      M68kinsploadr = 304, M68kinsploadw = 305, M68kinsplpar = 306,
      M68kinsplpaw = 307, M68kinspmove = 308, M68kinspmovefd = 309,
      M68kinsptestr = 310, M68kinsptestw = 311, M68kinspulse = 312,
      M68kinsrems = 313, M68kinsremu = 314, M68kinsreset = 315,
      M68kinsrol = 316, M68kinsror = 317, M68kinsroxl = 318, M68kinsroxr = 319,
      M68kinsrtd = 320, M68kinsrte = 321, M68kinsrtm = 322, M68kinsrtr = 323,
      M68kinsrts = 324, M68kinssbcd = 325, M68kinsst = 326, M68kinssf = 327,
      M68kinsshi = 328, M68kinssls = 329, M68kinsscc = 330, M68kinsshs = 331,
      M68kinsscs = 332, M68kinsslo = 333, M68kinssne = 334, M68kinsseq = 335,
      M68kinssvc = 336, M68kinssvs = 337, M68kinsspl = 338, M68kinssmi = 339,
      M68kinssge = 340, M68kinsslt = 341, M68kinssgt = 342, M68kinssle = 343,
      M68kinsstop = 344, M68kinssub = 345, M68kinssuba = 346, M68kinssubi = 347,
      M68kinssubq = 348, M68kinssubx = 349, M68kinsswap = 350, M68kinstas = 351,
      M68kinstrap = 352, M68kinstrapv = 353, M68kinstrapt = 354,
      M68kinstrapf = 355, M68kinstraphi = 356, M68kinstrapls = 357,
      M68kinstrapcc = 358, M68kinstraphs = 359, M68kinstrapcs = 360,
      M68kinstraplo = 361, M68kinstrapne = 362, M68kinstrapeq = 363,
      M68kinstrapvc = 364, M68kinstrapvs = 365, M68kinstrappl = 366,
      M68kinstrapmi = 367, M68kinstrapge = 368, M68kinstraplt = 369,
      M68kinstrapgt = 370, M68kinstraple = 371, M68kinstst = 372,
      M68kinsunlk = 373, M68kinsunpk = 374, M68kinsending = 375
else:
  static :
    hint("Declaration of " & "enumm68kinsn" & " already exists, not redeclaring")
when not declared(enumm68kgrouptype):
  type
    enumm68kgrouptype* {.size: sizeof(cuint).} = enum
      M68kgrpinvalid = 0, M68kgrpjump = 1, M68kgrpret = 3, M68kgrpiret = 5,
      M68kgrpbranchrelative = 7, M68kgrpending = 8
else:
  static :
    hint("Declaration of " & "enumm68kgrouptype" &
        " already exists, not redeclaring")
when not declared(enummipsoptype):
  type
    enummipsoptype* {.size: sizeof(cuint).} = enum
      Mipsopinvalid = 0, Mipsopreg = 1, Mipsopimm = 2, Mipsopmem = 3
else:
  static :
    hint("Declaration of " & "enummipsoptype" &
        " already exists, not redeclaring")
when not declared(enummipsreg):
  type
    enummipsreg* {.size: sizeof(cuint).} = enum
      Mipsreginvalid = 0, Mipsregpc = 1, Mipsreg0 = 2, Mipsreg1 = 3,
      Mipsreg2 = 4, Mipsreg3 = 5, Mipsreg4 = 6, Mipsreg5 = 7, Mipsreg6 = 8,
      Mipsreg7 = 9, Mipsreg8 = 10, Mipsreg9 = 11, Mipsreg10 = 12,
      Mipsreg11 = 13, Mipsreg12 = 14, Mipsreg13 = 15, Mipsreg14 = 16,
      Mipsreg15 = 17, Mipsreg16 = 18, Mipsreg17 = 19, Mipsreg18 = 20,
      Mipsreg19 = 21, Mipsreg20 = 22, Mipsreg21 = 23, Mipsreg22 = 24,
      Mipsreg23 = 25, Mipsreg24 = 26, Mipsreg25 = 27, Mipsreg26 = 28,
      Mipsreg27 = 29, Mipsreg28 = 30, Mipsreg29 = 31, Mipsreg30 = 32,
      Mipsreg31 = 33, Mipsregdspccond = 34, Mipsregdspcarry = 35,
      Mipsregdspefi = 36, Mipsregdspoutflag = 37, Mipsregdspoutflag1619 = 38,
      Mipsregdspoutflag20 = 39, Mipsregdspoutflag21 = 40,
      Mipsregdspoutflag22 = 41, Mipsregdspoutflag23 = 42, Mipsregdsppos = 43,
      Mipsregdspscount = 44, Mipsregac0 = 45, Mipsregac1 = 46, Mipsregac2 = 47,
      Mipsregac3 = 48, Mipsregcc0 = 49, Mipsregcc1 = 50, Mipsregcc2 = 51,
      Mipsregcc3 = 52, Mipsregcc4 = 53, Mipsregcc5 = 54, Mipsregcc6 = 55,
      Mipsregcc7 = 56, Mipsregf0 = 57, Mipsregf1 = 58, Mipsregf2 = 59,
      Mipsregf3 = 60, Mipsregf4 = 61, Mipsregf5 = 62, Mipsregf6 = 63,
      Mipsregf7 = 64, Mipsregf8 = 65, Mipsregf9 = 66, Mipsregf10 = 67,
      Mipsregf11 = 68, Mipsregf12 = 69, Mipsregf13 = 70, Mipsregf14 = 71,
      Mipsregf15 = 72, Mipsregf16 = 73, Mipsregf17 = 74, Mipsregf18 = 75,
      Mipsregf19 = 76, Mipsregf20 = 77, Mipsregf21 = 78, Mipsregf22 = 79,
      Mipsregf23 = 80, Mipsregf24 = 81, Mipsregf25 = 82, Mipsregf26 = 83,
      Mipsregf27 = 84, Mipsregf28 = 85, Mipsregf29 = 86, Mipsregf30 = 87,
      Mipsregf31 = 88, Mipsregfcc0 = 89, Mipsregfcc1 = 90, Mipsregfcc2 = 91,
      Mipsregfcc3 = 92, Mipsregfcc4 = 93, Mipsregfcc5 = 94, Mipsregfcc6 = 95,
      Mipsregfcc7 = 96, Mipsregw0 = 97, Mipsregw1 = 98, Mipsregw2 = 99,
      Mipsregw3 = 100, Mipsregw4 = 101, Mipsregw5 = 102, Mipsregw6 = 103,
      Mipsregw7 = 104, Mipsregw8 = 105, Mipsregw9 = 106, Mipsregw10 = 107,
      Mipsregw11 = 108, Mipsregw12 = 109, Mipsregw13 = 110, Mipsregw14 = 111,
      Mipsregw15 = 112, Mipsregw16 = 113, Mipsregw17 = 114, Mipsregw18 = 115,
      Mipsregw19 = 116, Mipsregw20 = 117, Mipsregw21 = 118, Mipsregw22 = 119,
      Mipsregw23 = 120, Mipsregw24 = 121, Mipsregw25 = 122, Mipsregw26 = 123,
      Mipsregw27 = 124, Mipsregw28 = 125, Mipsregw29 = 126, Mipsregw30 = 127,
      Mipsregw31 = 128, Mipsreghi = 129, Mipsreglo = 130, Mipsregp0 = 131,
      Mipsregp1 = 132, Mipsregp2 = 133, Mipsregmpl0 = 134, Mipsregmpl1 = 135,
      Mipsregmpl2 = 136, Mipsregending = 137
else:
  static :
    hint("Declaration of " & "enummipsreg" & " already exists, not redeclaring")
when not declared(Mipsregzero):
  const
    Mipsregzero* = enummipsreg.Mipsreg0
else:
  static :
    hint("Declaration of " & "Mipsregzero" & " already exists, not redeclaring")
when not declared(Mipsregat):
  const
    Mipsregat* = enummipsreg.Mipsreg1
else:
  static :
    hint("Declaration of " & "Mipsregat" & " already exists, not redeclaring")
when not declared(Mipsregv0):
  const
    Mipsregv0* = enummipsreg.Mipsreg2
else:
  static :
    hint("Declaration of " & "Mipsregv0" & " already exists, not redeclaring")
when not declared(Mipsregv1):
  const
    Mipsregv1* = enummipsreg.Mipsreg3
else:
  static :
    hint("Declaration of " & "Mipsregv1" & " already exists, not redeclaring")
when not declared(Mipsrega0):
  const
    Mipsrega0* = enummipsreg.Mipsreg4
else:
  static :
    hint("Declaration of " & "Mipsrega0" & " already exists, not redeclaring")
when not declared(Mipsrega1):
  const
    Mipsrega1* = enummipsreg.Mipsreg5
else:
  static :
    hint("Declaration of " & "Mipsrega1" & " already exists, not redeclaring")
when not declared(Mipsrega2):
  const
    Mipsrega2* = enummipsreg.Mipsreg6
else:
  static :
    hint("Declaration of " & "Mipsrega2" & " already exists, not redeclaring")
when not declared(Mipsrega3):
  const
    Mipsrega3* = enummipsreg.Mipsreg7
else:
  static :
    hint("Declaration of " & "Mipsrega3" & " already exists, not redeclaring")
when not declared(Mipsregt0):
  const
    Mipsregt0* = enummipsreg.Mipsreg8
else:
  static :
    hint("Declaration of " & "Mipsregt0" & " already exists, not redeclaring")
when not declared(Mipsregt1):
  const
    Mipsregt1* = enummipsreg.Mipsreg9
else:
  static :
    hint("Declaration of " & "Mipsregt1" & " already exists, not redeclaring")
when not declared(Mipsregt2):
  const
    Mipsregt2* = enummipsreg.Mipsreg10
else:
  static :
    hint("Declaration of " & "Mipsregt2" & " already exists, not redeclaring")
when not declared(Mipsregt3):
  const
    Mipsregt3* = enummipsreg.Mipsreg11
else:
  static :
    hint("Declaration of " & "Mipsregt3" & " already exists, not redeclaring")
when not declared(Mipsregt4):
  const
    Mipsregt4* = enummipsreg.Mipsreg12
else:
  static :
    hint("Declaration of " & "Mipsregt4" & " already exists, not redeclaring")
when not declared(Mipsregt5):
  const
    Mipsregt5* = enummipsreg.Mipsreg13
else:
  static :
    hint("Declaration of " & "Mipsregt5" & " already exists, not redeclaring")
when not declared(Mipsregt6):
  const
    Mipsregt6* = enummipsreg.Mipsreg14
else:
  static :
    hint("Declaration of " & "Mipsregt6" & " already exists, not redeclaring")
when not declared(Mipsregt7):
  const
    Mipsregt7* = enummipsreg.Mipsreg15
else:
  static :
    hint("Declaration of " & "Mipsregt7" & " already exists, not redeclaring")
when not declared(Mipsregs0):
  const
    Mipsregs0* = enummipsreg.Mipsreg16
else:
  static :
    hint("Declaration of " & "Mipsregs0" & " already exists, not redeclaring")
when not declared(Mipsregs1):
  const
    Mipsregs1* = enummipsreg.Mipsreg17
else:
  static :
    hint("Declaration of " & "Mipsregs1" & " already exists, not redeclaring")
when not declared(Mipsregs2):
  const
    Mipsregs2* = enummipsreg.Mipsreg18
else:
  static :
    hint("Declaration of " & "Mipsregs2" & " already exists, not redeclaring")
when not declared(Mipsregs3):
  const
    Mipsregs3* = enummipsreg.Mipsreg19
else:
  static :
    hint("Declaration of " & "Mipsregs3" & " already exists, not redeclaring")
when not declared(Mipsregs4):
  const
    Mipsregs4* = enummipsreg.Mipsreg20
else:
  static :
    hint("Declaration of " & "Mipsregs4" & " already exists, not redeclaring")
when not declared(Mipsregs5):
  const
    Mipsregs5* = enummipsreg.Mipsreg21
else:
  static :
    hint("Declaration of " & "Mipsregs5" & " already exists, not redeclaring")
when not declared(Mipsregs6):
  const
    Mipsregs6* = enummipsreg.Mipsreg22
else:
  static :
    hint("Declaration of " & "Mipsregs6" & " already exists, not redeclaring")
when not declared(Mipsregs7):
  const
    Mipsregs7* = enummipsreg.Mipsreg23
else:
  static :
    hint("Declaration of " & "Mipsregs7" & " already exists, not redeclaring")
when not declared(Mipsregt8):
  const
    Mipsregt8* = enummipsreg.Mipsreg24
else:
  static :
    hint("Declaration of " & "Mipsregt8" & " already exists, not redeclaring")
when not declared(Mipsregt9):
  const
    Mipsregt9* = enummipsreg.Mipsreg25
else:
  static :
    hint("Declaration of " & "Mipsregt9" & " already exists, not redeclaring")
when not declared(Mipsregk0):
  const
    Mipsregk0* = enummipsreg.Mipsreg26
else:
  static :
    hint("Declaration of " & "Mipsregk0" & " already exists, not redeclaring")
when not declared(Mipsregk1):
  const
    Mipsregk1* = enummipsreg.Mipsreg27
else:
  static :
    hint("Declaration of " & "Mipsregk1" & " already exists, not redeclaring")
when not declared(Mipsreggp):
  const
    Mipsreggp* = enummipsreg.Mipsreg28
else:
  static :
    hint("Declaration of " & "Mipsreggp" & " already exists, not redeclaring")
when not declared(Mipsregsp):
  const
    Mipsregsp* = enummipsreg.Mipsreg29
else:
  static :
    hint("Declaration of " & "Mipsregsp" & " already exists, not redeclaring")
when not declared(Mipsregfp):
  const
    Mipsregfp* = enummipsreg.Mipsreg30
else:
  static :
    hint("Declaration of " & "Mipsregfp" & " already exists, not redeclaring")
when not declared(Mipsregs8):
  const
    Mipsregs8* = enummipsreg.Mipsreg30
else:
  static :
    hint("Declaration of " & "Mipsregs8" & " already exists, not redeclaring")
when not declared(Mipsregra):
  const
    Mipsregra* = enummipsreg.Mipsreg31
else:
  static :
    hint("Declaration of " & "Mipsregra" & " already exists, not redeclaring")
when not declared(Mipsreghi0):
  const
    Mipsreghi0* = enummipsreg.Mipsregac0
else:
  static :
    hint("Declaration of " & "Mipsreghi0" & " already exists, not redeclaring")
when not declared(Mipsreghi1):
  const
    Mipsreghi1* = enummipsreg.Mipsregac1
else:
  static :
    hint("Declaration of " & "Mipsreghi1" & " already exists, not redeclaring")
when not declared(Mipsreghi2):
  const
    Mipsreghi2* = enummipsreg.Mipsregac2
else:
  static :
    hint("Declaration of " & "Mipsreghi2" & " already exists, not redeclaring")
when not declared(Mipsreghi3):
  const
    Mipsreghi3* = enummipsreg.Mipsregac3
else:
  static :
    hint("Declaration of " & "Mipsreghi3" & " already exists, not redeclaring")
when not declared(Mipsreglo0):
  const
    Mipsreglo0* = enummipsreg.Mipsregac0
else:
  static :
    hint("Declaration of " & "Mipsreglo0" & " already exists, not redeclaring")
when not declared(Mipsreglo1):
  const
    Mipsreglo1* = enummipsreg.Mipsregac1
else:
  static :
    hint("Declaration of " & "Mipsreglo1" & " already exists, not redeclaring")
when not declared(Mipsreglo2):
  const
    Mipsreglo2* = enummipsreg.Mipsregac2
else:
  static :
    hint("Declaration of " & "Mipsreglo2" & " already exists, not redeclaring")
when not declared(Mipsreglo3):
  const
    Mipsreglo3* = enummipsreg.Mipsregac3
else:
  static :
    hint("Declaration of " & "Mipsreglo3" & " already exists, not redeclaring")
when not declared(enummipsinsn):
  type
    enummipsinsn* {.size: sizeof(cuint).} = enum
      Mipsinsinvalid = 0, Mipsinsabsqs = 1, Mipsinsadd = 2, Mipsinsaddiupc = 3,
      Mipsinsaddiur1sp = 4, Mipsinsaddiur2 = 5, Mipsinsaddius5 = 6,
      Mipsinsaddiusp = 7, Mipsinsaddqh = 8, Mipsinsaddqhr = 9, Mipsinsaddq = 10,
      Mipsinsaddqs = 11, Mipsinsaddsc = 12, Mipsinsaddsa = 13,
      Mipsinsaddss = 14, Mipsinsaddsu = 15, Mipsinsaddu16 = 16,
      Mipsinsadduh = 17, Mipsinsadduhr = 18, Mipsinsaddu = 19,
      Mipsinsaddus = 20, Mipsinsaddvi = 21, Mipsinsaddv = 22, Mipsinsaddwc = 23,
      Mipsinsadda = 24, Mipsinsaddi = 25, Mipsinsaddiu = 26, Mipsinsalign = 27,
      Mipsinsaluipc = 28, Mipsinsand = 29, Mipsinsand16 = 30,
      Mipsinsandi16 = 31, Mipsinsandi = 32, Mipsinsappend = 33,
      Mipsinsasubs = 34, Mipsinsasubu = 35, Mipsinsaui = 36, Mipsinsauipc = 37,
      Mipsinsavers = 38, Mipsinsaveru = 39, Mipsinsaves = 40, Mipsinsaveu = 41,
      Mipsinsb16 = 42, Mipsinsbaddu = 43, Mipsinsbal = 44, Mipsinsbalc = 45,
      Mipsinsbalign = 46, Mipsinsbbit0 = 47, Mipsinsbbit032 = 48,
      Mipsinsbbit1 = 49, Mipsinsbbit132 = 50, Mipsinsbc = 51, Mipsinsbc0f = 52,
      Mipsinsbc0fl = 53, Mipsinsbc0t = 54, Mipsinsbc0tl = 55,
      Mipsinsbc1eqz = 56, Mipsinsbc1f = 57, Mipsinsbc1fl = 58,
      Mipsinsbc1nez = 59, Mipsinsbc1t = 60, Mipsinsbc1tl = 61,
      Mipsinsbc2eqz = 62, Mipsinsbc2f = 63, Mipsinsbc2fl = 64,
      Mipsinsbc2nez = 65, Mipsinsbc2t = 66, Mipsinsbc2tl = 67, Mipsinsbc3f = 68,
      Mipsinsbc3fl = 69, Mipsinsbc3t = 70, Mipsinsbc3tl = 71, Mipsinsbclri = 72,
      Mipsinsbclr = 73, Mipsinsbeq = 74, Mipsinsbeqc = 75, Mipsinsbeql = 76,
      Mipsinsbeqz16 = 77, Mipsinsbeqzalc = 78, Mipsinsbeqzc = 79,
      Mipsinsbgec = 80, Mipsinsbgeuc = 81, Mipsinsbgez = 82, Mipsinsbgezal = 83,
      Mipsinsbgezalc = 84, Mipsinsbgezall = 85, Mipsinsbgezals = 86,
      Mipsinsbgezc = 87, Mipsinsbgezl = 88, Mipsinsbgtz = 89,
      Mipsinsbgtzalc = 90, Mipsinsbgtzc = 91, Mipsinsbgtzl = 92,
      Mipsinsbinsli = 93, Mipsinsbinsl = 94, Mipsinsbinsri = 95,
      Mipsinsbinsr = 96, Mipsinsbitrev = 97, Mipsinsbitswap = 98,
      Mipsinsblez = 99, Mipsinsblezalc = 100, Mipsinsblezc = 101,
      Mipsinsblezl = 102, Mipsinsbltc = 103, Mipsinsbltuc = 104,
      Mipsinsbltz = 105, Mipsinsbltzal = 106, Mipsinsbltzalc = 107,
      Mipsinsbltzall = 108, Mipsinsbltzals = 109, Mipsinsbltzc = 110,
      Mipsinsbltzl = 111, Mipsinsbmnzi = 112, Mipsinsbmnz = 113,
      Mipsinsbmzi = 114, Mipsinsbmz = 115, Mipsinsbne = 116, Mipsinsbnec = 117,
      Mipsinsbnegi = 118, Mipsinsbneg = 119, Mipsinsbnel = 120,
      Mipsinsbnez16 = 121, Mipsinsbnezalc = 122, Mipsinsbnezc = 123,
      Mipsinsbnvc = 124, Mipsinsbnz = 125, Mipsinsbovc = 126,
      Mipsinsbposge32 = 127, Mipsinsbreak = 128, Mipsinsbreak16 = 129,
      Mipsinsbseli = 130, Mipsinsbsel = 131, Mipsinsbseti = 132,
      Mipsinsbset = 133, Mipsinsbz = 134, Mipsinsbeqz = 135, Mipsinsb = 136,
      Mipsinsbnez = 137, Mipsinsbteqz = 138, Mipsinsbtnez = 139,
      Mipsinscache = 140, Mipsinsceil = 141, Mipsinsceqi = 142,
      Mipsinsceq = 143, Mipsinscfc1 = 144, Mipsinscfcmsa = 145,
      Mipsinscins = 146, Mipsinscins32 = 147, Mipsinsclass = 148,
      Mipsinscleis = 149, Mipsinscleiu = 150, Mipsinscles = 151,
      Mipsinscleu = 152, Mipsinsclo = 153, Mipsinscltis = 154,
      Mipsinscltiu = 155, Mipsinsclts = 156, Mipsinscltu = 157,
      Mipsinsclz = 158, Mipsinscmpgdu = 159, Mipsinscmpgu = 160,
      Mipsinscmpu = 161, Mipsinscmp = 162, Mipsinscopys = 163,
      Mipsinscopyu = 164, Mipsinsctc1 = 165, Mipsinsctcmsa = 166,
      Mipsinscvt = 167, Mipsinsc = 168, Mipsinscmpi = 169, Mipsinsdadd = 170,
      Mipsinsdaddi = 171, Mipsinsdaddiu = 172, Mipsinsdaddu = 173,
      Mipsinsdahi = 174, Mipsinsdalign = 175, Mipsinsdati = 176,
      Mipsinsdaui = 177, Mipsinsdbitswap = 178, Mipsinsdclo = 179,
      Mipsinsdclz = 180, Mipsinsddiv = 181, Mipsinsddivu = 182,
      Mipsinsderet = 183, Mipsinsdext = 184, Mipsinsdextm = 185,
      Mipsinsdextu = 186, Mipsinsdi = 187, Mipsinsdins = 188,
      Mipsinsdinsm = 189, Mipsinsdinsu = 190, Mipsinsdiv = 191,
      Mipsinsdivu = 192, Mipsinsdivs = 193, Mipsinsdivuenumval = 194,
      Mipsinsdlsa = 195, Mipsinsdmfc0 = 196, Mipsinsdmfc1 = 197,
      Mipsinsdmfc2 = 198, Mipsinsdmod = 199, Mipsinsdmodu = 200,
      Mipsinsdmtc0 = 201, Mipsinsdmtc1 = 202, Mipsinsdmtc2 = 203,
      Mipsinsdmuh = 204, Mipsinsdmuhu = 205, Mipsinsdmul = 206,
      Mipsinsdmult = 207, Mipsinsdmultu = 208, Mipsinsdmulu = 209,
      Mipsinsdotps = 210, Mipsinsdotpu = 211, Mipsinsdpadds = 212,
      Mipsinsdpaddu = 213, Mipsinsdpaqxsa = 214, Mipsinsdpaqxs = 215,
      Mipsinsdpaqsa = 216, Mipsinsdpaqs = 217, Mipsinsdpau = 218,
      Mipsinsdpax = 219, Mipsinsdpa = 220, Mipsinsdpop = 221,
      Mipsinsdpsqxsa = 222, Mipsinsdpsqxs = 223, Mipsinsdpsqsa = 224,
      Mipsinsdpsqs = 225, Mipsinsdpsubs = 226, Mipsinsdpsubu = 227,
      Mipsinsdpsu = 228, Mipsinsdpsx = 229, Mipsinsdps = 230,
      Mipsinsdrotr = 231, Mipsinsdrotr32 = 232, Mipsinsdrotrv = 233,
      Mipsinsdsbh = 234, Mipsinsdshd = 235, Mipsinsdsll = 236,
      Mipsinsdsll32 = 237, Mipsinsdsllv = 238, Mipsinsdsra = 239,
      Mipsinsdsra32 = 240, Mipsinsdsrav = 241, Mipsinsdsrl = 242,
      Mipsinsdsrl32 = 243, Mipsinsdsrlv = 244, Mipsinsdsub = 245,
      Mipsinsdsubu = 246, Mipsinsehb = 247, Mipsinsei = 248, Mipsinseret = 249,
      Mipsinsext = 250, Mipsinsextp = 251, Mipsinsextpdp = 252,
      Mipsinsextpdpv = 253, Mipsinsextpv = 254, Mipsinsextrvrs = 255,
      Mipsinsextrvr = 256, Mipsinsextrvs = 257, Mipsinsextrv = 258,
      Mipsinsextrrs = 259, Mipsinsextrr = 260, Mipsinsextrs = 261,
      Mipsinsextr = 262, Mipsinsexts = 263, Mipsinsexts32 = 264,
      Mipsinsabs = 265, Mipsinsfadd = 266, Mipsinsfcaf = 267, Mipsinsfceq = 268,
      Mipsinsfclass = 269, Mipsinsfcle = 270, Mipsinsfclt = 271,
      Mipsinsfcne = 272, Mipsinsfcor = 273, Mipsinsfcueq = 274,
      Mipsinsfcule = 275, Mipsinsfcult = 276, Mipsinsfcune = 277,
      Mipsinsfcun = 278, Mipsinsfdiv = 279, Mipsinsfexdo = 280,
      Mipsinsfexp2 = 281, Mipsinsfexupl = 282, Mipsinsfexupr = 283,
      Mipsinsffints = 284, Mipsinsffintu = 285, Mipsinsffql = 286,
      Mipsinsffqr = 287, Mipsinsfill = 288, Mipsinsflog2 = 289,
      Mipsinsfloor = 290, Mipsinsfmadd = 291, Mipsinsfmaxa = 292,
      Mipsinsfmax = 293, Mipsinsfmina = 294, Mipsinsfmin = 295,
      Mipsinsmov = 296, Mipsinsfmsub = 297, Mipsinsfmul = 298, Mipsinsmul = 299,
      Mipsinsneg = 300, Mipsinsfrcp = 301, Mipsinsfrint = 302,
      Mipsinsfrsqrt = 303, Mipsinsfsaf = 304, Mipsinsfseq = 305,
      Mipsinsfsle = 306, Mipsinsfslt = 307, Mipsinsfsne = 308,
      Mipsinsfsor = 309, Mipsinsfsqrt = 310, Mipsinssqrt = 311,
      Mipsinsfsub = 312, Mipsinssub = 313, Mipsinsfsueq = 314,
      Mipsinsfsule = 315, Mipsinsfsult = 316, Mipsinsfsune = 317,
      Mipsinsfsun = 318, Mipsinsftints = 319, Mipsinsftintu = 320,
      Mipsinsftq = 321, Mipsinsftruncs = 322, Mipsinsftruncu = 323,
      Mipsinshadds = 324, Mipsinshaddu = 325, Mipsinshsubs = 326,
      Mipsinshsubu = 327, Mipsinsilvev = 328, Mipsinsilvl = 329,
      Mipsinsilvod = 330, Mipsinsilvr = 331, Mipsinsins = 332,
      Mipsinsinsert = 333, Mipsinsinsv = 334, Mipsinsinsve = 335,
      Mipsinsj = 336, Mipsinsjal = 337, Mipsinsjalr = 338, Mipsinsjalrs16 = 339,
      Mipsinsjalrs = 340, Mipsinsjals = 341, Mipsinsjalx = 342,
      Mipsinsjialc = 343, Mipsinsjic = 344, Mipsinsjr = 345, Mipsinsjr16 = 346,
      Mipsinsjraddiusp = 347, Mipsinsjrc = 348, Mipsinsjalrc = 349,
      Mipsinslb = 350, Mipsinslbu16 = 351, Mipsinslbux = 352, Mipsinslbu = 353,
      Mipsinsld = 354, Mipsinsldc1 = 355, Mipsinsldc2 = 356, Mipsinsldc3 = 357,
      Mipsinsldi = 358, Mipsinsldl = 359, Mipsinsldpc = 360, Mipsinsldr = 361,
      Mipsinsldxc1 = 362, Mipsinslh = 363, Mipsinslhu16 = 364, Mipsinslhx = 365,
      Mipsinslhu = 366, Mipsinsli16 = 367, Mipsinsll = 368, Mipsinslld = 369,
      Mipsinslsa = 370, Mipsinsluxc1 = 371, Mipsinslui = 372, Mipsinslw = 373,
      Mipsinslw16 = 374, Mipsinslwc1 = 375, Mipsinslwc2 = 376,
      Mipsinslwc3 = 377, Mipsinslwl = 378, Mipsinslwm16 = 379,
      Mipsinslwm32 = 380, Mipsinslwpc = 381, Mipsinslwp = 382, Mipsinslwr = 383,
      Mipsinslwupc = 384, Mipsinslwu = 385, Mipsinslwx = 386,
      Mipsinslwxc1 = 387, Mipsinslwxs = 388, Mipsinsli = 389, Mipsinsmadd = 390,
      Mipsinsmaddf = 391, Mipsinsmaddrq = 392, Mipsinsmaddu = 393,
      Mipsinsmaddv = 394, Mipsinsmaddq = 395, Mipsinsmaqsa = 396,
      Mipsinsmaqs = 397, Mipsinsmaxa = 398, Mipsinsmaxis = 399,
      Mipsinsmaxiu = 400, Mipsinsmaxaenumval = 401, Mipsinsmax = 402,
      Mipsinsmaxs = 403, Mipsinsmaxu = 404, Mipsinsmfc0 = 405,
      Mipsinsmfc1 = 406, Mipsinsmfc2 = 407, Mipsinsmfhc1 = 408,
      Mipsinsmfhi = 409, Mipsinsmflo = 410, Mipsinsmina = 411,
      Mipsinsminis = 412, Mipsinsminiu = 413, Mipsinsminaenumval = 414,
      Mipsinsmin = 415, Mipsinsmins = 416, Mipsinsminu = 417, Mipsinsmod = 418,
      Mipsinsmodsub = 419, Mipsinsmodu = 420, Mipsinsmods = 421,
      Mipsinsmoduenumval = 422, Mipsinsmove = 423, Mipsinsmovep = 424,
      Mipsinsmovf = 425, Mipsinsmovn = 426, Mipsinsmovt = 427,
      Mipsinsmovz = 428, Mipsinsmsub = 429, Mipsinsmsubf = 430,
      Mipsinsmsubrq = 431, Mipsinsmsubu = 432, Mipsinsmsubv = 433,
      Mipsinsmsubq = 434, Mipsinsmtc0 = 435, Mipsinsmtc1 = 436,
      Mipsinsmtc2 = 437, Mipsinsmthc1 = 438, Mipsinsmthi = 439,
      Mipsinsmthlip = 440, Mipsinsmtlo = 441, Mipsinsmtm0 = 442,
      Mipsinsmtm1 = 443, Mipsinsmtm2 = 444, Mipsinsmtp0 = 445,
      Mipsinsmtp1 = 446, Mipsinsmtp2 = 447, Mipsinsmuh = 448, Mipsinsmuhu = 449,
      Mipsinsmuleqs = 450, Mipsinsmuleus = 451, Mipsinsmulqrs = 452,
      Mipsinsmulqs = 453, Mipsinsmulrq = 454, Mipsinsmulsaqs = 455,
      Mipsinsmulsa = 456, Mipsinsmult = 457, Mipsinsmultu = 458,
      Mipsinsmulu = 459, Mipsinsmulv = 460, Mipsinsmulq = 461,
      Mipsinsmuls = 462, Mipsinsnloc = 463, Mipsinsnlzc = 464,
      Mipsinsnmadd = 465, Mipsinsnmsub = 466, Mipsinsnor = 467,
      Mipsinsnori = 468, Mipsinsnot16 = 469, Mipsinsnot = 470, Mipsinsor = 471,
      Mipsinsor16 = 472, Mipsinsori = 473, Mipsinspackrl = 474,
      Mipsinspause = 475, Mipsinspckev = 476, Mipsinspckod = 477,
      Mipsinspcnt = 478, Mipsinspick = 479, Mipsinspop = 480,
      Mipsinsprecequ = 481, Mipsinspreceq = 482, Mipsinspreceu = 483,
      Mipsinsprecrqus = 484, Mipsinsprecrq = 485, Mipsinsprecrqrs = 486,
      Mipsinsprecr = 487, Mipsinsprecrsra = 488, Mipsinsprecrsrar = 489,
      Mipsinspref = 490, Mipsinsprepend = 491, Mipsinsraddu = 492,
      Mipsinsrddsp = 493, Mipsinsrdhwr = 494, Mipsinsreplv = 495,
      Mipsinsrepl = 496, Mipsinsrint = 497, Mipsinsrotr = 498,
      Mipsinsrotrv = 499, Mipsinsround = 500, Mipsinssats = 501,
      Mipsinssatu = 502, Mipsinssb = 503, Mipsinssb16 = 504, Mipsinssc = 505,
      Mipsinsscd = 506, Mipsinssd = 507, Mipsinssdbbp = 508,
      Mipsinssdbbp16 = 509, Mipsinssdc1 = 510, Mipsinssdc2 = 511,
      Mipsinssdc3 = 512, Mipsinssdl = 513, Mipsinssdr = 514, Mipsinssdxc1 = 515,
      Mipsinsseb = 516, Mipsinsseh = 517, Mipsinsseleqz = 518,
      Mipsinsselnez = 519, Mipsinssel = 520, Mipsinsseq = 521,
      Mipsinsseqi = 522, Mipsinssh = 523, Mipsinssh16 = 524, Mipsinsshf = 525,
      Mipsinsshilo = 526, Mipsinsshilov = 527, Mipsinsshllv = 528,
      Mipsinsshllvs = 529, Mipsinsshll = 530, Mipsinsshlls = 531,
      Mipsinsshrav = 532, Mipsinsshravr = 533, Mipsinsshra = 534,
      Mipsinsshrar = 535, Mipsinsshrlv = 536, Mipsinsshrl = 537,
      Mipsinssldi = 538, Mipsinssld = 539, Mipsinssll = 540, Mipsinssll16 = 541,
      Mipsinsslli = 542, Mipsinssllv = 543, Mipsinsslt = 544, Mipsinsslti = 545,
      Mipsinssltiu = 546, Mipsinssltu = 547, Mipsinssne = 548,
      Mipsinssnei = 549, Mipsinssplati = 550, Mipsinssplat = 551,
      Mipsinssra = 552, Mipsinssrai = 553, Mipsinssrari = 554,
      Mipsinssrar = 555, Mipsinssrav = 556, Mipsinssrl = 557,
      Mipsinssrl16 = 558, Mipsinssrli = 559, Mipsinssrlri = 560,
      Mipsinssrlr = 561, Mipsinssrlv = 562, Mipsinsssnop = 563, Mipsinsst = 564,
      Mipsinssubqh = 565, Mipsinssubqhr = 566, Mipsinssubq = 567,
      Mipsinssubqs = 568, Mipsinssubsusu = 569, Mipsinssubsuus = 570,
      Mipsinssubss = 571, Mipsinssubsu = 572, Mipsinssubu16 = 573,
      Mipsinssubuh = 574, Mipsinssubuhr = 575, Mipsinssubu = 576,
      Mipsinssubus = 577, Mipsinssubvi = 578, Mipsinssubv = 579,
      Mipsinssuxc1 = 580, Mipsinssw = 581, Mipsinssw16 = 582, Mipsinsswc1 = 583,
      Mipsinsswc2 = 584, Mipsinsswc3 = 585, Mipsinsswl = 586,
      Mipsinsswm16 = 587, Mipsinsswm32 = 588, Mipsinsswp = 589,
      Mipsinsswr = 590, Mipsinsswxc1 = 591, Mipsinssync = 592,
      Mipsinssynci = 593, Mipsinssyscall = 594, Mipsinsteq = 595,
      Mipsinsteqi = 596, Mipsinstge = 597, Mipsinstgei = 598,
      Mipsinstgeiu = 599, Mipsinstgeu = 600, Mipsinstlbp = 601,
      Mipsinstlbr = 602, Mipsinstlbwi = 603, Mipsinstlbwr = 604,
      Mipsinstlt = 605, Mipsinstlti = 606, Mipsinstltiu = 607,
      Mipsinstltu = 608, Mipsinstne = 609, Mipsinstnei = 610,
      Mipsinstrunc = 611, Mipsinsv3mulu = 612, Mipsinsvmm0 = 613,
      Mipsinsvmulu = 614, Mipsinsvshf = 615, Mipsinswait = 616,
      Mipsinswrdsp = 617, Mipsinswsbh = 618, Mipsinsxor = 619,
      Mipsinsxor16 = 620, Mipsinsxori = 621, Mipsinsnop = 622,
      Mipsinsnegu = 623, Mipsinsjalrhb = 624, Mipsinsjrhb = 625,
      Mipsinsending = 626
else:
  static :
    hint("Declaration of " & "enummipsinsn" & " already exists, not redeclaring")
when not declared(enummipsinsngroup):
  type
    enummipsinsngroup* {.size: sizeof(cuint).} = enum
      Mipsgrpinvalid = 0, Mipsgrpjump = 1, Mipsgrpcall = 2, Mipsgrpret = 3,
      Mipsgrpint = 4, Mipsgrpiret = 5, Mipsgrpprivilege = 6,
      Mipsgrpbranchrelative = 7, Mipsgrpbitcount = 128, Mipsgrpdsp = 129,
      Mipsgrpdspr2 = 130, Mipsgrpfpidx = 131, Mipsgrpmsa = 132,
      Mipsgrpmips32r2 = 133, Mipsgrpmips64 = 134, Mipsgrpmips64r2 = 135,
      Mipsgrpseinreg = 136, Mipsgrpstdenc = 137, Mipsgrpswap = 138,
      Mipsgrpmicromips = 139, Mipsgrpmips16mode = 140, Mipsgrpfp64bit = 141,
      Mipsgrpnonansfpmath = 142, Mipsgrpnotfp64bit = 143,
      Mipsgrpnotinmicromips = 144, Mipsgrpnotnacl = 145,
      Mipsgrpnotmips32r6 = 146, Mipsgrpnotmips64r6 = 147, Mipsgrpcnmips = 148,
      Mipsgrpmips32 = 149, Mipsgrpmips32r6 = 150, Mipsgrpmips64r6 = 151,
      Mipsgrpmips2 = 152, Mipsgrpmips3 = 153, Mipsgrpmips332 = 154,
      Mipsgrpmips332r2 = 155, Mipsgrpmips432 = 156, Mipsgrpmips432r2 = 157,
      Mipsgrpmips532r2 = 158, Mipsgrpgp32bit = 159, Mipsgrpgp64bit = 160,
      Mipsgrpending = 161
else:
  static :
    hint("Declaration of " & "enummipsinsngroup" &
        " already exists, not redeclaring")
when not declared(enumppcbc):
  type
    enumppcbc* {.size: sizeof(cuint).} = enum
      Ppcbcinvalid = 0, Ppcbcge = 4, Ppcbclt = 12, Ppcbcle = 36, Ppcbcgt = 44,
      Ppcbcne = 68, Ppcbceq = 76, Ppcbcnu = 100, Ppcbcun = 108, Ppcbcns = 132,
      Ppcbcso = 140
else:
  static :
    hint("Declaration of " & "enumppcbc" & " already exists, not redeclaring")
when not declared(enumppcbh):
  type
    enumppcbh* {.size: sizeof(cuint).} = enum
      Ppcbhinvalid = 0, Ppcbhplus = 1, Ppcbhminus = 2
else:
  static :
    hint("Declaration of " & "enumppcbh" & " already exists, not redeclaring")
when not declared(enumppcoptype):
  type
    enumppcoptype* {.size: sizeof(cuint).} = enum
      Ppcopinvalid = 0, Ppcopreg = 1, Ppcopimm = 2, Ppcopmem = 3, Ppcopcrx = 64
else:
  static :
    hint("Declaration of " & "enumppcoptype" &
        " already exists, not redeclaring")
when not declared(enumppcreg):
  type
    enumppcreg* {.size: sizeof(cuint).} = enum
      Ppcreginvalid = 0, Ppcregcarry = 1, Ppcregcr0 = 2, Ppcregcr1 = 3,
      Ppcregcr2 = 4, Ppcregcr3 = 5, Ppcregcr4 = 6, Ppcregcr5 = 7, Ppcregcr6 = 8,
      Ppcregcr7 = 9, Ppcregctr = 10, Ppcregf0 = 11, Ppcregf1 = 12,
      Ppcregf2 = 13, Ppcregf3 = 14, Ppcregf4 = 15, Ppcregf5 = 16, Ppcregf6 = 17,
      Ppcregf7 = 18, Ppcregf8 = 19, Ppcregf9 = 20, Ppcregf10 = 21,
      Ppcregf11 = 22, Ppcregf12 = 23, Ppcregf13 = 24, Ppcregf14 = 25,
      Ppcregf15 = 26, Ppcregf16 = 27, Ppcregf17 = 28, Ppcregf18 = 29,
      Ppcregf19 = 30, Ppcregf20 = 31, Ppcregf21 = 32, Ppcregf22 = 33,
      Ppcregf23 = 34, Ppcregf24 = 35, Ppcregf25 = 36, Ppcregf26 = 37,
      Ppcregf27 = 38, Ppcregf28 = 39, Ppcregf29 = 40, Ppcregf30 = 41,
      Ppcregf31 = 42, Ppcreglr = 43, Ppcregr0 = 44, Ppcregr1 = 45,
      Ppcregr2 = 46, Ppcregr3 = 47, Ppcregr4 = 48, Ppcregr5 = 49, Ppcregr6 = 50,
      Ppcregr7 = 51, Ppcregr8 = 52, Ppcregr9 = 53, Ppcregr10 = 54,
      Ppcregr11 = 55, Ppcregr12 = 56, Ppcregr13 = 57, Ppcregr14 = 58,
      Ppcregr15 = 59, Ppcregr16 = 60, Ppcregr17 = 61, Ppcregr18 = 62,
      Ppcregr19 = 63, Ppcregr20 = 64, Ppcregr21 = 65, Ppcregr22 = 66,
      Ppcregr23 = 67, Ppcregr24 = 68, Ppcregr25 = 69, Ppcregr26 = 70,
      Ppcregr27 = 71, Ppcregr28 = 72, Ppcregr29 = 73, Ppcregr30 = 74,
      Ppcregr31 = 75, Ppcregv0 = 76, Ppcregv1 = 77, Ppcregv2 = 78,
      Ppcregv3 = 79, Ppcregv4 = 80, Ppcregv5 = 81, Ppcregv6 = 82, Ppcregv7 = 83,
      Ppcregv8 = 84, Ppcregv9 = 85, Ppcregv10 = 86, Ppcregv11 = 87,
      Ppcregv12 = 88, Ppcregv13 = 89, Ppcregv14 = 90, Ppcregv15 = 91,
      Ppcregv16 = 92, Ppcregv17 = 93, Ppcregv18 = 94, Ppcregv19 = 95,
      Ppcregv20 = 96, Ppcregv21 = 97, Ppcregv22 = 98, Ppcregv23 = 99,
      Ppcregv24 = 100, Ppcregv25 = 101, Ppcregv26 = 102, Ppcregv27 = 103,
      Ppcregv28 = 104, Ppcregv29 = 105, Ppcregv30 = 106, Ppcregv31 = 107,
      Ppcregvrsave = 108, Ppcregvs0 = 109, Ppcregvs1 = 110, Ppcregvs2 = 111,
      Ppcregvs3 = 112, Ppcregvs4 = 113, Ppcregvs5 = 114, Ppcregvs6 = 115,
      Ppcregvs7 = 116, Ppcregvs8 = 117, Ppcregvs9 = 118, Ppcregvs10 = 119,
      Ppcregvs11 = 120, Ppcregvs12 = 121, Ppcregvs13 = 122, Ppcregvs14 = 123,
      Ppcregvs15 = 124, Ppcregvs16 = 125, Ppcregvs17 = 126, Ppcregvs18 = 127,
      Ppcregvs19 = 128, Ppcregvs20 = 129, Ppcregvs21 = 130, Ppcregvs22 = 131,
      Ppcregvs23 = 132, Ppcregvs24 = 133, Ppcregvs25 = 134, Ppcregvs26 = 135,
      Ppcregvs27 = 136, Ppcregvs28 = 137, Ppcregvs29 = 138, Ppcregvs30 = 139,
      Ppcregvs31 = 140, Ppcregvs32 = 141, Ppcregvs33 = 142, Ppcregvs34 = 143,
      Ppcregvs35 = 144, Ppcregvs36 = 145, Ppcregvs37 = 146, Ppcregvs38 = 147,
      Ppcregvs39 = 148, Ppcregvs40 = 149, Ppcregvs41 = 150, Ppcregvs42 = 151,
      Ppcregvs43 = 152, Ppcregvs44 = 153, Ppcregvs45 = 154, Ppcregvs46 = 155,
      Ppcregvs47 = 156, Ppcregvs48 = 157, Ppcregvs49 = 158, Ppcregvs50 = 159,
      Ppcregvs51 = 160, Ppcregvs52 = 161, Ppcregvs53 = 162, Ppcregvs54 = 163,
      Ppcregvs55 = 164, Ppcregvs56 = 165, Ppcregvs57 = 166, Ppcregvs58 = 167,
      Ppcregvs59 = 168, Ppcregvs60 = 169, Ppcregvs61 = 170, Ppcregvs62 = 171,
      Ppcregvs63 = 172, Ppcregq0 = 173, Ppcregq1 = 174, Ppcregq2 = 175,
      Ppcregq3 = 176, Ppcregq4 = 177, Ppcregq5 = 178, Ppcregq6 = 179,
      Ppcregq7 = 180, Ppcregq8 = 181, Ppcregq9 = 182, Ppcregq10 = 183,
      Ppcregq11 = 184, Ppcregq12 = 185, Ppcregq13 = 186, Ppcregq14 = 187,
      Ppcregq15 = 188, Ppcregq16 = 189, Ppcregq17 = 190, Ppcregq18 = 191,
      Ppcregq19 = 192, Ppcregq20 = 193, Ppcregq21 = 194, Ppcregq22 = 195,
      Ppcregq23 = 196, Ppcregq24 = 197, Ppcregq25 = 198, Ppcregq26 = 199,
      Ppcregq27 = 200, Ppcregq28 = 201, Ppcregq29 = 202, Ppcregq30 = 203,
      Ppcregq31 = 204, Ppcregrm = 205, Ppcregctr8 = 206, Ppcreglr8 = 207,
      Ppcregcr1eq = 208, Ppcregx2 = 209, Ppcregending = 210
else:
  static :
    hint("Declaration of " & "enumppcreg" & " already exists, not redeclaring")
when not declared(enumppcinsn):
  type
    enumppcinsn* {.size: sizeof(cuint).} = enum
      Ppcinsinvalid = 0, Ppcinsadd = 1, Ppcinsaddc = 2, Ppcinsadde = 3,
      Ppcinsaddi = 4, Ppcinsaddic = 5, Ppcinsaddis = 6, Ppcinsaddme = 7,
      Ppcinsaddze = 8, Ppcinsand = 9, Ppcinsandc = 10, Ppcinsandis = 11,
      Ppcinsandi = 12, Ppcinsattn = 13, Ppcinsb = 14, Ppcinsba = 15,
      Ppcinsbc = 16, Ppcinsbcctr = 17, Ppcinsbcctrl = 18, Ppcinsbcl = 19,
      Ppcinsbclr = 20, Ppcinsbclrl = 21, Ppcinsbctr = 22, Ppcinsbctrl = 23,
      Ppcinsbct = 24, Ppcinsbdnz = 25, Ppcinsbdnza = 26, Ppcinsbdnzl = 27,
      Ppcinsbdnzla = 28, Ppcinsbdnzlr = 29, Ppcinsbdnzlrl = 30, Ppcinsbdz = 31,
      Ppcinsbdza = 32, Ppcinsbdzl = 33, Ppcinsbdzla = 34, Ppcinsbdzlr = 35,
      Ppcinsbdzlrl = 36, Ppcinsbl = 37, Ppcinsbla = 38, Ppcinsblr = 39,
      Ppcinsblrl = 40, Ppcinsbrinc = 41, Ppcinscmpb = 42, Ppcinscmpd = 43,
      Ppcinscmpdi = 44, Ppcinscmpld = 45, Ppcinscmpldi = 46, Ppcinscmplw = 47,
      Ppcinscmplwi = 48, Ppcinscmpw = 49, Ppcinscmpwi = 50, Ppcinscntlzd = 51,
      Ppcinscntlzw = 52, Ppcinscreqv = 53, Ppcinscrxor = 54, Ppcinscrand = 55,
      Ppcinscrandc = 56, Ppcinscrnand = 57, Ppcinscrnor = 58, Ppcinscror = 59,
      Ppcinscrorc = 60, Ppcinsdcba = 61, Ppcinsdcbf = 62, Ppcinsdcbi = 63,
      Ppcinsdcbst = 64, Ppcinsdcbt = 65, Ppcinsdcbtst = 66, Ppcinsdcbz = 67,
      Ppcinsdcbzl = 68, Ppcinsdccci = 69, Ppcinsdivd = 70, Ppcinsdivdu = 71,
      Ppcinsdivw = 72, Ppcinsdivwu = 73, Ppcinsdss = 74, Ppcinsdssall = 75,
      Ppcinsdst = 76, Ppcinsdstst = 77, Ppcinsdststt = 78, Ppcinsdstt = 79,
      Ppcinseqv = 80, Ppcinsevabs = 81, Ppcinsevaddiw = 82,
      Ppcinsevaddsmiaaw = 83, Ppcinsevaddssiaaw = 84, Ppcinsevaddumiaaw = 85,
      Ppcinsevaddusiaaw = 86, Ppcinsevaddw = 87, Ppcinsevand = 88,
      Ppcinsevandc = 89, Ppcinsevcmpeq = 90, Ppcinsevcmpgts = 91,
      Ppcinsevcmpgtu = 92, Ppcinsevcmplts = 93, Ppcinsevcmpltu = 94,
      Ppcinsevcntlsw = 95, Ppcinsevcntlzw = 96, Ppcinsevdivws = 97,
      Ppcinsevdivwu = 98, Ppcinseveqv = 99, Ppcinsevextsb = 100,
      Ppcinsevextsh = 101, Ppcinsevldd = 102, Ppcinsevlddx = 103,
      Ppcinsevldh = 104, Ppcinsevldhx = 105, Ppcinsevldw = 106,
      Ppcinsevldwx = 107, Ppcinsevlhhesplat = 108, Ppcinsevlhhesplatx = 109,
      Ppcinsevlhhossplat = 110, Ppcinsevlhhossplatx = 111,
      Ppcinsevlhhousplat = 112, Ppcinsevlhhousplatx = 113, Ppcinsevlwhe = 114,
      Ppcinsevlwhex = 115, Ppcinsevlwhos = 116, Ppcinsevlwhosx = 117,
      Ppcinsevlwhou = 118, Ppcinsevlwhoux = 119, Ppcinsevlwhsplat = 120,
      Ppcinsevlwhsplatx = 121, Ppcinsevlwwsplat = 122, Ppcinsevlwwsplatx = 123,
      Ppcinsevmergehi = 124, Ppcinsevmergehilo = 125, Ppcinsevmergelo = 126,
      Ppcinsevmergelohi = 127, Ppcinsevmhegsmfaa = 128, Ppcinsevmhegsmfan = 129,
      Ppcinsevmhegsmiaa = 130, Ppcinsevmhegsmian = 131, Ppcinsevmhegumiaa = 132,
      Ppcinsevmhegumian = 133, Ppcinsevmhesmf = 134, Ppcinsevmhesmfa = 135,
      Ppcinsevmhesmfaaw = 136, Ppcinsevmhesmfanw = 137, Ppcinsevmhesmi = 138,
      Ppcinsevmhesmia = 139, Ppcinsevmhesmiaaw = 140, Ppcinsevmhesmianw = 141,
      Ppcinsevmhessf = 142, Ppcinsevmhessfa = 143, Ppcinsevmhessfaaw = 144,
      Ppcinsevmhessfanw = 145, Ppcinsevmhessiaaw = 146, Ppcinsevmhessianw = 147,
      Ppcinsevmheumi = 148, Ppcinsevmheumia = 149, Ppcinsevmheumiaaw = 150,
      Ppcinsevmheumianw = 151, Ppcinsevmheusiaaw = 152, Ppcinsevmheusianw = 153,
      Ppcinsevmhogsmfaa = 154, Ppcinsevmhogsmfan = 155, Ppcinsevmhogsmiaa = 156,
      Ppcinsevmhogsmian = 157, Ppcinsevmhogumiaa = 158, Ppcinsevmhogumian = 159,
      Ppcinsevmhosmf = 160, Ppcinsevmhosmfa = 161, Ppcinsevmhosmfaaw = 162,
      Ppcinsevmhosmfanw = 163, Ppcinsevmhosmi = 164, Ppcinsevmhosmia = 165,
      Ppcinsevmhosmiaaw = 166, Ppcinsevmhosmianw = 167, Ppcinsevmhossf = 168,
      Ppcinsevmhossfa = 169, Ppcinsevmhossfaaw = 170, Ppcinsevmhossfanw = 171,
      Ppcinsevmhossiaaw = 172, Ppcinsevmhossianw = 173, Ppcinsevmhoumi = 174,
      Ppcinsevmhoumia = 175, Ppcinsevmhoumiaaw = 176, Ppcinsevmhoumianw = 177,
      Ppcinsevmhousiaaw = 178, Ppcinsevmhousianw = 179, Ppcinsevmra = 180,
      Ppcinsevmwhsmf = 181, Ppcinsevmwhsmfa = 182, Ppcinsevmwhsmi = 183,
      Ppcinsevmwhsmia = 184, Ppcinsevmwhssf = 185, Ppcinsevmwhssfa = 186,
      Ppcinsevmwhumi = 187, Ppcinsevmwhumia = 188, Ppcinsevmwlsmiaaw = 189,
      Ppcinsevmwlsmianw = 190, Ppcinsevmwlssiaaw = 191, Ppcinsevmwlssianw = 192,
      Ppcinsevmwlumi = 193, Ppcinsevmwlumia = 194, Ppcinsevmwlumiaaw = 195,
      Ppcinsevmwlumianw = 196, Ppcinsevmwlusiaaw = 197, Ppcinsevmwlusianw = 198,
      Ppcinsevmwsmf = 199, Ppcinsevmwsmfa = 200, Ppcinsevmwsmfaa = 201,
      Ppcinsevmwsmfan = 202, Ppcinsevmwsmi = 203, Ppcinsevmwsmia = 204,
      Ppcinsevmwsmiaa = 205, Ppcinsevmwsmian = 206, Ppcinsevmwssf = 207,
      Ppcinsevmwssfa = 208, Ppcinsevmwssfaa = 209, Ppcinsevmwssfan = 210,
      Ppcinsevmwumi = 211, Ppcinsevmwumia = 212, Ppcinsevmwumiaa = 213,
      Ppcinsevmwumian = 214, Ppcinsevnand = 215, Ppcinsevneg = 216,
      Ppcinsevnor = 217, Ppcinsevor = 218, Ppcinsevorc = 219, Ppcinsevrlw = 220,
      Ppcinsevrlwi = 221, Ppcinsevrndw = 222, Ppcinsevslw = 223,
      Ppcinsevslwi = 224, Ppcinsevsplatfi = 225, Ppcinsevsplati = 226,
      Ppcinsevsrwis = 227, Ppcinsevsrwiu = 228, Ppcinsevsrws = 229,
      Ppcinsevsrwu = 230, Ppcinsevstdd = 231, Ppcinsevstddx = 232,
      Ppcinsevstdh = 233, Ppcinsevstdhx = 234, Ppcinsevstdw = 235,
      Ppcinsevstdwx = 236, Ppcinsevstwhe = 237, Ppcinsevstwhex = 238,
      Ppcinsevstwho = 239, Ppcinsevstwhox = 240, Ppcinsevstwwe = 241,
      Ppcinsevstwwex = 242, Ppcinsevstwwo = 243, Ppcinsevstwwox = 244,
      Ppcinsevsubfsmiaaw = 245, Ppcinsevsubfssiaaw = 246,
      Ppcinsevsubfumiaaw = 247, Ppcinsevsubfusiaaw = 248, Ppcinsevsubfw = 249,
      Ppcinsevsubifw = 250, Ppcinsevxor = 251, Ppcinsextsb = 252,
      Ppcinsextsh = 253, Ppcinsextsw = 254, Ppcinseieio = 255, Ppcinsfabs = 256,
      Ppcinsfadd = 257, Ppcinsfadds = 258, Ppcinsfcfid = 259,
      Ppcinsfcfids = 260, Ppcinsfcfidu = 261, Ppcinsfcfidus = 262,
      Ppcinsfcmpu = 263, Ppcinsfcpsgn = 264, Ppcinsfctid = 265,
      Ppcinsfctiduz = 266, Ppcinsfctidz = 267, Ppcinsfctiw = 268,
      Ppcinsfctiwuz = 269, Ppcinsfctiwz = 270, Ppcinsfdiv = 271,
      Ppcinsfdivs = 272, Ppcinsfmadd = 273, Ppcinsfmadds = 274, Ppcinsfmr = 275,
      Ppcinsfmsub = 276, Ppcinsfmsubs = 277, Ppcinsfmul = 278,
      Ppcinsfmuls = 279, Ppcinsfnabs = 280, Ppcinsfneg = 281,
      Ppcinsfnmadd = 282, Ppcinsfnmadds = 283, Ppcinsfnmsub = 284,
      Ppcinsfnmsubs = 285, Ppcinsfre = 286, Ppcinsfres = 287, Ppcinsfrim = 288,
      Ppcinsfrin = 289, Ppcinsfrip = 290, Ppcinsfriz = 291, Ppcinsfrsp = 292,
      Ppcinsfrsqrte = 293, Ppcinsfrsqrtes = 294, Ppcinsfsel = 295,
      Ppcinsfsqrt = 296, Ppcinsfsqrts = 297, Ppcinsfsub = 298,
      Ppcinsfsubs = 299, Ppcinsicbi = 300, Ppcinsicbt = 301, Ppcinsiccci = 302,
      Ppcinsisel = 303, Ppcinsisync = 304, Ppcinsla = 305, Ppcinslbz = 306,
      Ppcinslbzcix = 307, Ppcinslbzu = 308, Ppcinslbzux = 309, Ppcinslbzx = 310,
      Ppcinsld = 311, Ppcinsldarx = 312, Ppcinsldbrx = 313, Ppcinsldcix = 314,
      Ppcinsldu = 315, Ppcinsldux = 316, Ppcinsldx = 317, Ppcinslfd = 318,
      Ppcinslfdu = 319, Ppcinslfdux = 320, Ppcinslfdx = 321, Ppcinslfiwax = 322,
      Ppcinslfiwzx = 323, Ppcinslfs = 324, Ppcinslfsu = 325, Ppcinslfsux = 326,
      Ppcinslfsx = 327, Ppcinslha = 328, Ppcinslhau = 329, Ppcinslhaux = 330,
      Ppcinslhax = 331, Ppcinslhbrx = 332, Ppcinslhz = 333, Ppcinslhzcix = 334,
      Ppcinslhzu = 335, Ppcinslhzux = 336, Ppcinslhzx = 337, Ppcinsli = 338,
      Ppcinslis = 339, Ppcinslmw = 340, Ppcinslswi = 341, Ppcinslvebx = 342,
      Ppcinslvehx = 343, Ppcinslvewx = 344, Ppcinslvsl = 345, Ppcinslvsr = 346,
      Ppcinslvx = 347, Ppcinslvxl = 348, Ppcinslwa = 349, Ppcinslwarx = 350,
      Ppcinslwaux = 351, Ppcinslwax = 352, Ppcinslwbrx = 353, Ppcinslwz = 354,
      Ppcinslwzcix = 355, Ppcinslwzu = 356, Ppcinslwzux = 357, Ppcinslwzx = 358,
      Ppcinslxsdx = 359, Ppcinslxvd2x = 360, Ppcinslxvdsx = 361,
      Ppcinslxvw4x = 362, Ppcinsmbar = 363, Ppcinsmcrf = 364, Ppcinsmcrfs = 365,
      Ppcinsmfcr = 366, Ppcinsmfctr = 367, Ppcinsmfdcr = 368, Ppcinsmffs = 369,
      Ppcinsmflr = 370, Ppcinsmfmsr = 371, Ppcinsmfocrf = 372,
      Ppcinsmfspr = 373, Ppcinsmfsr = 374, Ppcinsmfsrin = 375, Ppcinsmftb = 376,
      Ppcinsmfvscr = 377, Ppcinsmsync = 378, Ppcinsmtcrf = 379,
      Ppcinsmtctr = 380, Ppcinsmtdcr = 381, Ppcinsmtfsb0 = 382,
      Ppcinsmtfsb1 = 383, Ppcinsmtfsf = 384, Ppcinsmtfsfi = 385,
      Ppcinsmtlr = 386, Ppcinsmtmsr = 387, Ppcinsmtmsrd = 388,
      Ppcinsmtocrf = 389, Ppcinsmtspr = 390, Ppcinsmtsr = 391,
      Ppcinsmtsrin = 392, Ppcinsmtvscr = 393, Ppcinsmulhd = 394,
      Ppcinsmulhdu = 395, Ppcinsmulhw = 396, Ppcinsmulhwu = 397,
      Ppcinsmulld = 398, Ppcinsmulli = 399, Ppcinsmullw = 400, Ppcinsnand = 401,
      Ppcinsneg = 402, Ppcinsnop = 403, Ppcinsori = 404, Ppcinsnor = 405,
      Ppcinsor = 406, Ppcinsorc = 407, Ppcinsoris = 408, Ppcinspopcntd = 409,
      Ppcinspopcntw = 410, Ppcinsqvaligni = 411, Ppcinsqvesplati = 412,
      Ppcinsqvfabs = 413, Ppcinsqvfadd = 414, Ppcinsqvfadds = 415,
      Ppcinsqvfcfid = 416, Ppcinsqvfcfids = 417, Ppcinsqvfcfidu = 418,
      Ppcinsqvfcfidus = 419, Ppcinsqvfcmpeq = 420, Ppcinsqvfcmpgt = 421,
      Ppcinsqvfcmplt = 422, Ppcinsqvfcpsgn = 423, Ppcinsqvfctid = 424,
      Ppcinsqvfctidu = 425, Ppcinsqvfctiduz = 426, Ppcinsqvfctidz = 427,
      Ppcinsqvfctiw = 428, Ppcinsqvfctiwu = 429, Ppcinsqvfctiwuz = 430,
      Ppcinsqvfctiwz = 431, Ppcinsqvflogical = 432, Ppcinsqvfmadd = 433,
      Ppcinsqvfmadds = 434, Ppcinsqvfmr = 435, Ppcinsqvfmsub = 436,
      Ppcinsqvfmsubs = 437, Ppcinsqvfmul = 438, Ppcinsqvfmuls = 439,
      Ppcinsqvfnabs = 440, Ppcinsqvfneg = 441, Ppcinsqvfnmadd = 442,
      Ppcinsqvfnmadds = 443, Ppcinsqvfnmsub = 444, Ppcinsqvfnmsubs = 445,
      Ppcinsqvfperm = 446, Ppcinsqvfre = 447, Ppcinsqvfres = 448,
      Ppcinsqvfrim = 449, Ppcinsqvfrin = 450, Ppcinsqvfrip = 451,
      Ppcinsqvfriz = 452, Ppcinsqvfrsp = 453, Ppcinsqvfrsqrte = 454,
      Ppcinsqvfrsqrtes = 455, Ppcinsqvfsel = 456, Ppcinsqvfsub = 457,
      Ppcinsqvfsubs = 458, Ppcinsqvftstnan = 459, Ppcinsqvfxmadd = 460,
      Ppcinsqvfxmadds = 461, Ppcinsqvfxmul = 462, Ppcinsqvfxmuls = 463,
      Ppcinsqvfxxcpnmadd = 464, Ppcinsqvfxxcpnmadds = 465,
      Ppcinsqvfxxmadd = 466, Ppcinsqvfxxmadds = 467, Ppcinsqvfxxnpmadd = 468,
      Ppcinsqvfxxnpmadds = 469, Ppcinsqvgpci = 470, Ppcinsqvlfcdux = 471,
      Ppcinsqvlfcduxa = 472, Ppcinsqvlfcdx = 473, Ppcinsqvlfcdxa = 474,
      Ppcinsqvlfcsux = 475, Ppcinsqvlfcsuxa = 476, Ppcinsqvlfcsx = 477,
      Ppcinsqvlfcsxa = 478, Ppcinsqvlfdux = 479, Ppcinsqvlfduxa = 480,
      Ppcinsqvlfdx = 481, Ppcinsqvlfdxa = 482, Ppcinsqvlfiwax = 483,
      Ppcinsqvlfiwaxa = 484, Ppcinsqvlfiwzx = 485, Ppcinsqvlfiwzxa = 486,
      Ppcinsqvlfsux = 487, Ppcinsqvlfsuxa = 488, Ppcinsqvlfsx = 489,
      Ppcinsqvlfsxa = 490, Ppcinsqvlpcldx = 491, Ppcinsqvlpclsx = 492,
      Ppcinsqvlpcrdx = 493, Ppcinsqvlpcrsx = 494, Ppcinsqvstfcdux = 495,
      Ppcinsqvstfcduxa = 496, Ppcinsqvstfcduxi = 497, Ppcinsqvstfcduxia = 498,
      Ppcinsqvstfcdx = 499, Ppcinsqvstfcdxa = 500, Ppcinsqvstfcdxi = 501,
      Ppcinsqvstfcdxia = 502, Ppcinsqvstfcsux = 503, Ppcinsqvstfcsuxa = 504,
      Ppcinsqvstfcsuxi = 505, Ppcinsqvstfcsuxia = 506, Ppcinsqvstfcsx = 507,
      Ppcinsqvstfcsxa = 508, Ppcinsqvstfcsxi = 509, Ppcinsqvstfcsxia = 510,
      Ppcinsqvstfdux = 511, Ppcinsqvstfduxa = 512, Ppcinsqvstfduxi = 513,
      Ppcinsqvstfduxia = 514, Ppcinsqvstfdx = 515, Ppcinsqvstfdxa = 516,
      Ppcinsqvstfdxi = 517, Ppcinsqvstfdxia = 518, Ppcinsqvstfiwx = 519,
      Ppcinsqvstfiwxa = 520, Ppcinsqvstfsux = 521, Ppcinsqvstfsuxa = 522,
      Ppcinsqvstfsuxi = 523, Ppcinsqvstfsuxia = 524, Ppcinsqvstfsx = 525,
      Ppcinsqvstfsxa = 526, Ppcinsqvstfsxi = 527, Ppcinsqvstfsxia = 528,
      Ppcinsrfci = 529, Ppcinsrfdi = 530, Ppcinsrfi = 531, Ppcinsrfid = 532,
      Ppcinsrfmci = 533, Ppcinsrldcl = 534, Ppcinsrldcr = 535,
      Ppcinsrldic = 536, Ppcinsrldicl = 537, Ppcinsrldicr = 538,
      Ppcinsrldimi = 539, Ppcinsrlwimi = 540, Ppcinsrlwinm = 541,
      Ppcinsrlwnm = 542, Ppcinssc = 543, Ppcinsslbia = 544, Ppcinsslbie = 545,
      Ppcinsslbmfee = 546, Ppcinsslbmte = 547, Ppcinssld = 548, Ppcinsslw = 549,
      Ppcinssrad = 550, Ppcinssradi = 551, Ppcinssraw = 552, Ppcinssrawi = 553,
      Ppcinssrd = 554, Ppcinssrw = 555, Ppcinsstb = 556, Ppcinsstbcix = 557,
      Ppcinsstbu = 558, Ppcinsstbux = 559, Ppcinsstbx = 560, Ppcinsstd = 561,
      Ppcinsstdbrx = 562, Ppcinsstdcix = 563, Ppcinsstdcx = 564,
      Ppcinsstdu = 565, Ppcinsstdux = 566, Ppcinsstdx = 567, Ppcinsstfd = 568,
      Ppcinsstfdu = 569, Ppcinsstfdux = 570, Ppcinsstfdx = 571,
      Ppcinsstfiwx = 572, Ppcinsstfs = 573, Ppcinsstfsu = 574,
      Ppcinsstfsux = 575, Ppcinsstfsx = 576, Ppcinssth = 577,
      Ppcinssthbrx = 578, Ppcinssthcix = 579, Ppcinssthu = 580,
      Ppcinssthux = 581, Ppcinssthx = 582, Ppcinsstmw = 583, Ppcinsstswi = 584,
      Ppcinsstvebx = 585, Ppcinsstvehx = 586, Ppcinsstvewx = 587,
      Ppcinsstvx = 588, Ppcinsstvxl = 589, Ppcinsstw = 590, Ppcinsstwbrx = 591,
      Ppcinsstwcix = 592, Ppcinsstwcx = 593, Ppcinsstwu = 594,
      Ppcinsstwux = 595, Ppcinsstwx = 596, Ppcinsstxsdx = 597,
      Ppcinsstxvd2x = 598, Ppcinsstxvw4x = 599, Ppcinssubf = 600,
      Ppcinssubfc = 601, Ppcinssubfe = 602, Ppcinssubfic = 603,
      Ppcinssubfme = 604, Ppcinssubfze = 605, Ppcinssync = 606, Ppcinstd = 607,
      Ppcinstdi = 608, Ppcinstlbia = 609, Ppcinstlbie = 610, Ppcinstlbiel = 611,
      Ppcinstlbivax = 612, Ppcinstlbld = 613, Ppcinstlbli = 614,
      Ppcinstlbre = 615, Ppcinstlbsx = 616, Ppcinstlbsync = 617,
      Ppcinstlbwe = 618, Ppcinstrap = 619, Ppcinstw = 620, Ppcinstwi = 621,
      Ppcinsvaddcuw = 622, Ppcinsvaddfp = 623, Ppcinsvaddsbs = 624,
      Ppcinsvaddshs = 625, Ppcinsvaddsws = 626, Ppcinsvaddubm = 627,
      Ppcinsvaddubs = 628, Ppcinsvaddudm = 629, Ppcinsvadduhm = 630,
      Ppcinsvadduhs = 631, Ppcinsvadduwm = 632, Ppcinsvadduws = 633,
      Ppcinsvand = 634, Ppcinsvandc = 635, Ppcinsvavgsb = 636,
      Ppcinsvavgsh = 637, Ppcinsvavgsw = 638, Ppcinsvavgub = 639,
      Ppcinsvavguh = 640, Ppcinsvavguw = 641, Ppcinsvcfsx = 642,
      Ppcinsvcfux = 643, Ppcinsvclzb = 644, Ppcinsvclzd = 645,
      Ppcinsvclzh = 646, Ppcinsvclzw = 647, Ppcinsvcmpbfp = 648,
      Ppcinsvcmpeqfp = 649, Ppcinsvcmpequb = 650, Ppcinsvcmpequd = 651,
      Ppcinsvcmpequh = 652, Ppcinsvcmpequw = 653, Ppcinsvcmpgefp = 654,
      Ppcinsvcmpgtfp = 655, Ppcinsvcmpgtsb = 656, Ppcinsvcmpgtsd = 657,
      Ppcinsvcmpgtsh = 658, Ppcinsvcmpgtsw = 659, Ppcinsvcmpgtub = 660,
      Ppcinsvcmpgtud = 661, Ppcinsvcmpgtuh = 662, Ppcinsvcmpgtuw = 663,
      Ppcinsvctsxs = 664, Ppcinsvctuxs = 665, Ppcinsveqv = 666,
      Ppcinsvexptefp = 667, Ppcinsvlogefp = 668, Ppcinsvmaddfp = 669,
      Ppcinsvmaxfp = 670, Ppcinsvmaxsb = 671, Ppcinsvmaxsd = 672,
      Ppcinsvmaxsh = 673, Ppcinsvmaxsw = 674, Ppcinsvmaxub = 675,
      Ppcinsvmaxud = 676, Ppcinsvmaxuh = 677, Ppcinsvmaxuw = 678,
      Ppcinsvmhaddshs = 679, Ppcinsvmhraddshs = 680, Ppcinsvminud = 681,
      Ppcinsvminfp = 682, Ppcinsvminsb = 683, Ppcinsvminsd = 684,
      Ppcinsvminsh = 685, Ppcinsvminsw = 686, Ppcinsvminub = 687,
      Ppcinsvminuh = 688, Ppcinsvminuw = 689, Ppcinsvmladduhm = 690,
      Ppcinsvmrghb = 691, Ppcinsvmrghh = 692, Ppcinsvmrghw = 693,
      Ppcinsvmrglb = 694, Ppcinsvmrglh = 695, Ppcinsvmrglw = 696,
      Ppcinsvmsummbm = 697, Ppcinsvmsumshm = 698, Ppcinsvmsumshs = 699,
      Ppcinsvmsumubm = 700, Ppcinsvmsumuhm = 701, Ppcinsvmsumuhs = 702,
      Ppcinsvmulesb = 703, Ppcinsvmulesh = 704, Ppcinsvmulesw = 705,
      Ppcinsvmuleub = 706, Ppcinsvmuleuh = 707, Ppcinsvmuleuw = 708,
      Ppcinsvmulosb = 709, Ppcinsvmulosh = 710, Ppcinsvmulosw = 711,
      Ppcinsvmuloub = 712, Ppcinsvmulouh = 713, Ppcinsvmulouw = 714,
      Ppcinsvmuluwm = 715, Ppcinsvnand = 716, Ppcinsvnmsubfp = 717,
      Ppcinsvnor = 718, Ppcinsvor = 719, Ppcinsvorc = 720, Ppcinsvperm = 721,
      Ppcinsvpkpx = 722, Ppcinsvpkshss = 723, Ppcinsvpkshus = 724,
      Ppcinsvpkswss = 725, Ppcinsvpkswus = 726, Ppcinsvpkuhum = 727,
      Ppcinsvpkuhus = 728, Ppcinsvpkuwum = 729, Ppcinsvpkuwus = 730,
      Ppcinsvpopcntb = 731, Ppcinsvpopcntd = 732, Ppcinsvpopcnth = 733,
      Ppcinsvpopcntw = 734, Ppcinsvrefp = 735, Ppcinsvrfim = 736,
      Ppcinsvrfin = 737, Ppcinsvrfip = 738, Ppcinsvrfiz = 739, Ppcinsvrlb = 740,
      Ppcinsvrld = 741, Ppcinsvrlh = 742, Ppcinsvrlw = 743,
      Ppcinsvrsqrtefp = 744, Ppcinsvsel = 745, Ppcinsvsl = 746,
      Ppcinsvslb = 747, Ppcinsvsld = 748, Ppcinsvsldoi = 749, Ppcinsvslh = 750,
      Ppcinsvslo = 751, Ppcinsvslw = 752, Ppcinsvspltb = 753,
      Ppcinsvsplth = 754, Ppcinsvspltisb = 755, Ppcinsvspltish = 756,
      Ppcinsvspltisw = 757, Ppcinsvspltw = 758, Ppcinsvsr = 759,
      Ppcinsvsrab = 760, Ppcinsvsrad = 761, Ppcinsvsrah = 762,
      Ppcinsvsraw = 763, Ppcinsvsrb = 764, Ppcinsvsrd = 765, Ppcinsvsrh = 766,
      Ppcinsvsro = 767, Ppcinsvsrw = 768, Ppcinsvsubcuw = 769,
      Ppcinsvsubfp = 770, Ppcinsvsubsbs = 771, Ppcinsvsubshs = 772,
      Ppcinsvsubsws = 773, Ppcinsvsububm = 774, Ppcinsvsububs = 775,
      Ppcinsvsubudm = 776, Ppcinsvsubuhm = 777, Ppcinsvsubuhs = 778,
      Ppcinsvsubuwm = 779, Ppcinsvsubuws = 780, Ppcinsvsum2sws = 781,
      Ppcinsvsum4sbs = 782, Ppcinsvsum4shs = 783, Ppcinsvsum4ubs = 784,
      Ppcinsvsumsws = 785, Ppcinsvupkhpx = 786, Ppcinsvupkhsb = 787,
      Ppcinsvupkhsh = 788, Ppcinsvupklpx = 789, Ppcinsvupklsb = 790,
      Ppcinsvupklsh = 791, Ppcinsvxor = 792, Ppcinswait = 793,
      Ppcinswrtee = 794, Ppcinswrteei = 795, Ppcinsxor = 796, Ppcinsxori = 797,
      Ppcinsxoris = 798, Ppcinsxsabsdp = 799, Ppcinsxsadddp = 800,
      Ppcinsxscmpodp = 801, Ppcinsxscmpudp = 802, Ppcinsxscpsgndp = 803,
      Ppcinsxscvdpsp = 804, Ppcinsxscvdpsxds = 805, Ppcinsxscvdpsxws = 806,
      Ppcinsxscvdpuxds = 807, Ppcinsxscvdpuxws = 808, Ppcinsxscvspdp = 809,
      Ppcinsxscvsxddp = 810, Ppcinsxscvuxddp = 811, Ppcinsxsdivdp = 812,
      Ppcinsxsmaddadp = 813, Ppcinsxsmaddmdp = 814, Ppcinsxsmaxdp = 815,
      Ppcinsxsmindp = 816, Ppcinsxsmsubadp = 817, Ppcinsxsmsubmdp = 818,
      Ppcinsxsmuldp = 819, Ppcinsxsnabsdp = 820, Ppcinsxsnegdp = 821,
      Ppcinsxsnmaddadp = 822, Ppcinsxsnmaddmdp = 823, Ppcinsxsnmsubadp = 824,
      Ppcinsxsnmsubmdp = 825, Ppcinsxsrdpi = 826, Ppcinsxsrdpic = 827,
      Ppcinsxsrdpim = 828, Ppcinsxsrdpip = 829, Ppcinsxsrdpiz = 830,
      Ppcinsxsredp = 831, Ppcinsxsrsqrtedp = 832, Ppcinsxssqrtdp = 833,
      Ppcinsxssubdp = 834, Ppcinsxstdivdp = 835, Ppcinsxstsqrtdp = 836,
      Ppcinsxvabsdp = 837, Ppcinsxvabssp = 838, Ppcinsxvadddp = 839,
      Ppcinsxvaddsp = 840, Ppcinsxvcmpeqdp = 841, Ppcinsxvcmpeqsp = 842,
      Ppcinsxvcmpgedp = 843, Ppcinsxvcmpgesp = 844, Ppcinsxvcmpgtdp = 845,
      Ppcinsxvcmpgtsp = 846, Ppcinsxvcpsgndp = 847, Ppcinsxvcpsgnsp = 848,
      Ppcinsxvcvdpsp = 849, Ppcinsxvcvdpsxds = 850, Ppcinsxvcvdpsxws = 851,
      Ppcinsxvcvdpuxds = 852, Ppcinsxvcvdpuxws = 853, Ppcinsxvcvspdp = 854,
      Ppcinsxvcvspsxds = 855, Ppcinsxvcvspsxws = 856, Ppcinsxvcvspuxds = 857,
      Ppcinsxvcvspuxws = 858, Ppcinsxvcvsxddp = 859, Ppcinsxvcvsxdsp = 860,
      Ppcinsxvcvsxwdp = 861, Ppcinsxvcvsxwsp = 862, Ppcinsxvcvuxddp = 863,
      Ppcinsxvcvuxdsp = 864, Ppcinsxvcvuxwdp = 865, Ppcinsxvcvuxwsp = 866,
      Ppcinsxvdivdp = 867, Ppcinsxvdivsp = 868, Ppcinsxvmaddadp = 869,
      Ppcinsxvmaddasp = 870, Ppcinsxvmaddmdp = 871, Ppcinsxvmaddmsp = 872,
      Ppcinsxvmaxdp = 873, Ppcinsxvmaxsp = 874, Ppcinsxvmindp = 875,
      Ppcinsxvminsp = 876, Ppcinsxvmsubadp = 877, Ppcinsxvmsubasp = 878,
      Ppcinsxvmsubmdp = 879, Ppcinsxvmsubmsp = 880, Ppcinsxvmuldp = 881,
      Ppcinsxvmulsp = 882, Ppcinsxvnabsdp = 883, Ppcinsxvnabssp = 884,
      Ppcinsxvnegdp = 885, Ppcinsxvnegsp = 886, Ppcinsxvnmaddadp = 887,
      Ppcinsxvnmaddasp = 888, Ppcinsxvnmaddmdp = 889, Ppcinsxvnmaddmsp = 890,
      Ppcinsxvnmsubadp = 891, Ppcinsxvnmsubasp = 892, Ppcinsxvnmsubmdp = 893,
      Ppcinsxvnmsubmsp = 894, Ppcinsxvrdpi = 895, Ppcinsxvrdpic = 896,
      Ppcinsxvrdpim = 897, Ppcinsxvrdpip = 898, Ppcinsxvrdpiz = 899,
      Ppcinsxvredp = 900, Ppcinsxvresp = 901, Ppcinsxvrspi = 902,
      Ppcinsxvrspic = 903, Ppcinsxvrspim = 904, Ppcinsxvrspip = 905,
      Ppcinsxvrspiz = 906, Ppcinsxvrsqrtedp = 907, Ppcinsxvrsqrtesp = 908,
      Ppcinsxvsqrtdp = 909, Ppcinsxvsqrtsp = 910, Ppcinsxvsubdp = 911,
      Ppcinsxvsubsp = 912, Ppcinsxvtdivdp = 913, Ppcinsxvtdivsp = 914,
      Ppcinsxvtsqrtdp = 915, Ppcinsxvtsqrtsp = 916, Ppcinsxxland = 917,
      Ppcinsxxlandc = 918, Ppcinsxxleqv = 919, Ppcinsxxlnand = 920,
      Ppcinsxxlnor = 921, Ppcinsxxlor = 922, Ppcinsxxlorc = 923,
      Ppcinsxxlxor = 924, Ppcinsxxmrghw = 925, Ppcinsxxmrglw = 926,
      Ppcinsxxpermdi = 927, Ppcinsxxsel = 928, Ppcinsxxsldwi = 929,
      Ppcinsxxspltw = 930, Ppcinsbca = 931, Ppcinsbcla = 932, Ppcinsslwi = 933,
      Ppcinssrwi = 934, Ppcinssldi = 935, Ppcinsbta = 936, Ppcinscrset = 937,
      Ppcinscrnot = 938, Ppcinscrmove = 939, Ppcinscrclr = 940,
      Ppcinsmfbr0 = 941, Ppcinsmfbr1 = 942, Ppcinsmfbr2 = 943,
      Ppcinsmfbr3 = 944, Ppcinsmfbr4 = 945, Ppcinsmfbr5 = 946,
      Ppcinsmfbr6 = 947, Ppcinsmfbr7 = 948, Ppcinsmfxer = 949,
      Ppcinsmfrtcu = 950, Ppcinsmfrtcl = 951, Ppcinsmfdscr = 952,
      Ppcinsmfdsisr = 953, Ppcinsmfdar = 954, Ppcinsmfsrr2 = 955,
      Ppcinsmfsrr3 = 956, Ppcinsmfcfar = 957, Ppcinsmfamr = 958,
      Ppcinsmfpid = 959, Ppcinsmftblo = 960, Ppcinsmftbhi = 961,
      Ppcinsmfdbatu = 962, Ppcinsmfdbatl = 963, Ppcinsmfibatu = 964,
      Ppcinsmfibatl = 965, Ppcinsmfdccr = 966, Ppcinsmficcr = 967,
      Ppcinsmfdear = 968, Ppcinsmfesr = 969, Ppcinsmfspefscr = 970,
      Ppcinsmftcr = 971, Ppcinsmfasr = 972, Ppcinsmfpvr = 973,
      Ppcinsmftbu = 974, Ppcinsmtcr = 975, Ppcinsmtbr0 = 976, Ppcinsmtbr1 = 977,
      Ppcinsmtbr2 = 978, Ppcinsmtbr3 = 979, Ppcinsmtbr4 = 980,
      Ppcinsmtbr5 = 981, Ppcinsmtbr6 = 982, Ppcinsmtbr7 = 983,
      Ppcinsmtxer = 984, Ppcinsmtdscr = 985, Ppcinsmtdsisr = 986,
      Ppcinsmtdar = 987, Ppcinsmtsrr2 = 988, Ppcinsmtsrr3 = 989,
      Ppcinsmtcfar = 990, Ppcinsmtamr = 991, Ppcinsmtpid = 992,
      Ppcinsmttbl = 993, Ppcinsmttbu = 994, Ppcinsmttblo = 995,
      Ppcinsmttbhi = 996, Ppcinsmtdbatu = 997, Ppcinsmtdbatl = 998,
      Ppcinsmtibatu = 999, Ppcinsmtibatl = 1000, Ppcinsmtdccr = 1001,
      Ppcinsmticcr = 1002, Ppcinsmtdear = 1003, Ppcinsmtesr = 1004,
      Ppcinsmtspefscr = 1005, Ppcinsmttcr = 1006, Ppcinsnot = 1007,
      Ppcinsmr = 1008, Ppcinsrotld = 1009, Ppcinsrotldi = 1010,
      Ppcinsclrldi = 1011, Ppcinsrotlwi = 1012, Ppcinsclrlwi = 1013,
      Ppcinsrotlw = 1014, Ppcinssub = 1015, Ppcinssubc = 1016,
      Ppcinslwsync = 1017, Ppcinsptesync = 1018, Ppcinstdlt = 1019,
      Ppcinstdeq = 1020, Ppcinstdgt = 1021, Ppcinstdne = 1022,
      Ppcinstdllt = 1023, Ppcinstdlgt = 1024, Ppcinstdu = 1025,
      Ppcinstdlti = 1026, Ppcinstdeqi = 1027, Ppcinstdgti = 1028,
      Ppcinstdnei = 1029, Ppcinstdllti = 1030, Ppcinstdlgti = 1031,
      Ppcinstdui = 1032, Ppcinstlbrehi = 1033, Ppcinstlbrelo = 1034,
      Ppcinstlbwehi = 1035, Ppcinstlbwelo = 1036, Ppcinstwlt = 1037,
      Ppcinstweq = 1038, Ppcinstwgt = 1039, Ppcinstwne = 1040,
      Ppcinstwllt = 1041, Ppcinstwlgt = 1042, Ppcinstwu = 1043,
      Ppcinstwlti = 1044, Ppcinstweqi = 1045, Ppcinstwgti = 1046,
      Ppcinstwnei = 1047, Ppcinstwllti = 1048, Ppcinstwlgti = 1049,
      Ppcinstwui = 1050, Ppcinswaitrsv = 1051, Ppcinswaitimpl = 1052,
      Ppcinsxnop = 1053, Ppcinsxvmovdp = 1054, Ppcinsxvmovsp = 1055,
      Ppcinsxxspltd = 1056, Ppcinsxxmrghd = 1057, Ppcinsxxmrgld = 1058,
      Ppcinsxxswapd = 1059, Ppcinsbt = 1060, Ppcinsbf = 1061,
      Ppcinsbdnzt = 1062, Ppcinsbdnzf = 1063, Ppcinsbdzf = 1064,
      Ppcinsbdzt = 1065, Ppcinsbfa = 1066, Ppcinsbdnzta = 1067,
      Ppcinsbdnzfa = 1068, Ppcinsbdzta = 1069, Ppcinsbdzfa = 1070,
      Ppcinsbtctr = 1071, Ppcinsbfctr = 1072, Ppcinsbtctrl = 1073,
      Ppcinsbfctrl = 1074, Ppcinsbtl = 1075, Ppcinsbfl = 1076,
      Ppcinsbdnztl = 1077, Ppcinsbdnzfl = 1078, Ppcinsbdztl = 1079,
      Ppcinsbdzfl = 1080, Ppcinsbtla = 1081, Ppcinsbfla = 1082,
      Ppcinsbdnztla = 1083, Ppcinsbdnzfla = 1084, Ppcinsbdztla = 1085,
      Ppcinsbdzfla = 1086, Ppcinsbtlr = 1087, Ppcinsbflr = 1088,
      Ppcinsbdnztlr = 1089, Ppcinsbdztlr = 1090, Ppcinsbdzflr = 1091,
      Ppcinsbtlrl = 1092, Ppcinsbflrl = 1093, Ppcinsbdnztlrl = 1094,
      Ppcinsbdnzflrl = 1095, Ppcinsbdztlrl = 1096, Ppcinsbdzflrl = 1097,
      Ppcinsqvfand = 1098, Ppcinsqvfclr = 1099, Ppcinsqvfandc = 1100,
      Ppcinsqvfctfb = 1101, Ppcinsqvfxor = 1102, Ppcinsqvfor = 1103,
      Ppcinsqvfnor = 1104, Ppcinsqvfequ = 1105, Ppcinsqvfnot = 1106,
      Ppcinsqvforc = 1107, Ppcinsqvfnand = 1108, Ppcinsqvfset = 1109,
      Ppcinsending = 1110
else:
  static :
    hint("Declaration of " & "enumppcinsn" & " already exists, not redeclaring")
when not declared(enumppcinsngroup):
  type
    enumppcinsngroup* {.size: sizeof(cuint).} = enum
      Ppcgrpinvalid = 0, Ppcgrpjump = 1, Ppcgrpaltivec = 128,
      Ppcgrpmode32 = 129, Ppcgrpmode64 = 130, Ppcgrpbooke = 131,
      Ppcgrpnotbooke = 132, Ppcgrpspe = 133, Ppcgrpvsx = 134, Ppcgrpe500 = 135,
      Ppcgrpppc4xx = 136, Ppcgrpppc6xx = 137, Ppcgrpicbt = 138,
      Ppcgrpp8altivec = 139, Ppcgrpp8vector = 140, Ppcgrpqpx = 141,
      Ppcgrpending = 142
else:
  static :
    hint("Declaration of " & "enumppcinsngroup" &
        " already exists, not redeclaring")
when not declared(enumsparccc):
  type
    enumsparccc* {.size: sizeof(cuint).} = enum
      Sparcccinvalid = 0, Sparccciccn = 256, Sparcccicce = 257,
      Sparccciccle = 258, Sparccciccl = 259, Sparccciccleu = 260,
      Sparcccicccs = 261, Sparccciccneg = 262, Sparccciccvs = 263,
      Sparcccicca = 264, Sparccciccne = 265, Sparccciccg = 266,
      Sparccciccge = 267, Sparccciccgu = 268, Sparcccicccc = 269,
      Sparccciccpos = 270, Sparccciccvc = 271, Sparcccfccn = 272,
      Sparcccfccne = 273, Sparcccfcclg = 274, Sparcccfccul = 275,
      Sparcccfccl = 276, Sparcccfccug = 277, Sparcccfccg = 278,
      Sparcccfccu = 279, Sparcccfcca = 280, Sparcccfcce = 281,
      Sparcccfccue = 282, Sparcccfccge = 283, Sparcccfccuge = 284,
      Sparcccfccle = 285, Sparcccfccule = 286, Sparcccfcco = 287
else:
  static :
    hint("Declaration of " & "enumsparccc" & " already exists, not redeclaring")
when not declared(enumsparchint):
  type
    enumsparchint* {.size: sizeof(cuint).} = enum
      Sparchintinvalid = 0, Sparchinta = 1, Sparchintpt = 2, Sparchintpn = 4
else:
  static :
    hint("Declaration of " & "enumsparchint" &
        " already exists, not redeclaring")
when not declared(enumsparcoptype):
  type
    enumsparcoptype* {.size: sizeof(cuint).} = enum
      Sparcopinvalid = 0, Sparcopreg = 1, Sparcopimm = 2, Sparcopmem = 3
else:
  static :
    hint("Declaration of " & "enumsparcoptype" &
        " already exists, not redeclaring")
when not declared(enumsparcreg):
  type
    enumsparcreg* {.size: sizeof(cuint).} = enum
      Sparcreginvalid = 0, Sparcregf0 = 1, Sparcregf1 = 2, Sparcregf2 = 3,
      Sparcregf3 = 4, Sparcregf4 = 5, Sparcregf5 = 6, Sparcregf6 = 7,
      Sparcregf7 = 8, Sparcregf8 = 9, Sparcregf9 = 10, Sparcregf10 = 11,
      Sparcregf11 = 12, Sparcregf12 = 13, Sparcregf13 = 14, Sparcregf14 = 15,
      Sparcregf15 = 16, Sparcregf16 = 17, Sparcregf17 = 18, Sparcregf18 = 19,
      Sparcregf19 = 20, Sparcregf20 = 21, Sparcregf21 = 22, Sparcregf22 = 23,
      Sparcregf23 = 24, Sparcregf24 = 25, Sparcregf25 = 26, Sparcregf26 = 27,
      Sparcregf27 = 28, Sparcregf28 = 29, Sparcregf29 = 30, Sparcregf30 = 31,
      Sparcregf31 = 32, Sparcregf32 = 33, Sparcregf34 = 34, Sparcregf36 = 35,
      Sparcregf38 = 36, Sparcregf40 = 37, Sparcregf42 = 38, Sparcregf44 = 39,
      Sparcregf46 = 40, Sparcregf48 = 41, Sparcregf50 = 42, Sparcregf52 = 43,
      Sparcregf54 = 44, Sparcregf56 = 45, Sparcregf58 = 46, Sparcregf60 = 47,
      Sparcregf62 = 48, Sparcregfcc0 = 49, Sparcregfcc1 = 50, Sparcregfcc2 = 51,
      Sparcregfcc3 = 52, Sparcregfp = 53, Sparcregg0 = 54, Sparcregg1 = 55,
      Sparcregg2 = 56, Sparcregg3 = 57, Sparcregg4 = 58, Sparcregg5 = 59,
      Sparcregg6 = 60, Sparcregg7 = 61, Sparcregi0 = 62, Sparcregi1 = 63,
      Sparcregi2 = 64, Sparcregi3 = 65, Sparcregi4 = 66, Sparcregi5 = 67,
      Sparcregi7 = 68, Sparcregicc = 69, Sparcregl0 = 70, Sparcregl1 = 71,
      Sparcregl2 = 72, Sparcregl3 = 73, Sparcregl4 = 74, Sparcregl5 = 75,
      Sparcregl6 = 76, Sparcregl7 = 77, Sparcrego0 = 78, Sparcrego1 = 79,
      Sparcrego2 = 80, Sparcrego3 = 81, Sparcrego4 = 82, Sparcrego5 = 83,
      Sparcrego7 = 84, Sparcregsp = 85, Sparcregy = 86, Sparcregxcc = 87,
      Sparcregending = 88
else:
  static :
    hint("Declaration of " & "enumsparcreg" & " already exists, not redeclaring")
when not declared(Sparcrego6):
  const
    Sparcrego6* = enumsparcreg.Sparcregsp
else:
  static :
    hint("Declaration of " & "Sparcrego6" & " already exists, not redeclaring")
when not declared(Sparcregi6):
  const
    Sparcregi6* = enumsparcreg.Sparcregfp
else:
  static :
    hint("Declaration of " & "Sparcregi6" & " already exists, not redeclaring")
when not declared(enumsparcinsn):
  type
    enumsparcinsn* {.size: sizeof(cuint).} = enum
      Sparcinsinvalid = 0, Sparcinsaddcc = 1, Sparcinsaddx = 2,
      Sparcinsaddxcc = 3, Sparcinsaddxc = 4, Sparcinsaddxccc = 5,
      Sparcinsadd = 6, Sparcinsalignaddr = 7, Sparcinsalignaddrl = 8,
      Sparcinsandcc = 9, Sparcinsandncc = 10, Sparcinsandn = 11,
      Sparcinsand = 12, Sparcinsarray16 = 13, Sparcinsarray32 = 14,
      Sparcinsarray8 = 15, Sparcinsb = 16, Sparcinsjmp = 17, Sparcinsbmask = 18,
      Sparcinsfb = 19, Sparcinsbrgez = 20, Sparcinsbrgz = 21,
      Sparcinsbrlez = 22, Sparcinsbrlz = 23, Sparcinsbrnz = 24,
      Sparcinsbrz = 25, Sparcinsbshuffle = 26, Sparcinscall = 27,
      Sparcinscasx = 28, Sparcinscas = 29, Sparcinscmask16 = 30,
      Sparcinscmask32 = 31, Sparcinscmask8 = 32, Sparcinscmp = 33,
      Sparcinsedge16 = 34, Sparcinsedge16l = 35, Sparcinsedge16ln = 36,
      Sparcinsedge16n = 37, Sparcinsedge32 = 38, Sparcinsedge32l = 39,
      Sparcinsedge32ln = 40, Sparcinsedge32n = 41, Sparcinsedge8 = 42,
      Sparcinsedge8l = 43, Sparcinsedge8ln = 44, Sparcinsedge8n = 45,
      Sparcinsfabsd = 46, Sparcinsfabsq = 47, Sparcinsfabss = 48,
      Sparcinsfaddd = 49, Sparcinsfaddq = 50, Sparcinsfadds = 51,
      Sparcinsfaligndata = 52, Sparcinsfand = 53, Sparcinsfandnot1 = 54,
      Sparcinsfandnot1s = 55, Sparcinsfandnot2 = 56, Sparcinsfandnot2s = 57,
      Sparcinsfands = 58, Sparcinsfchksm16 = 59, Sparcinsfcmpd = 60,
      Sparcinsfcmpeq16 = 61, Sparcinsfcmpeq32 = 62, Sparcinsfcmpgt16 = 63,
      Sparcinsfcmpgt32 = 64, Sparcinsfcmple16 = 65, Sparcinsfcmple32 = 66,
      Sparcinsfcmpne16 = 67, Sparcinsfcmpne32 = 68, Sparcinsfcmpq = 69,
      Sparcinsfcmps = 70, Sparcinsfdivd = 71, Sparcinsfdivq = 72,
      Sparcinsfdivs = 73, Sparcinsfdmulq = 74, Sparcinsfdtoi = 75,
      Sparcinsfdtoq = 76, Sparcinsfdtos = 77, Sparcinsfdtox = 78,
      Sparcinsfexpand = 79, Sparcinsfhaddd = 80, Sparcinsfhadds = 81,
      Sparcinsfhsubd = 82, Sparcinsfhsubs = 83, Sparcinsfitod = 84,
      Sparcinsfitoq = 85, Sparcinsfitos = 86, Sparcinsflcmpd = 87,
      Sparcinsflcmps = 88, Sparcinsflushw = 89, Sparcinsfmean16 = 90,
      Sparcinsfmovd = 91, Sparcinsfmovq = 92, Sparcinsfmovrdgez = 93,
      Sparcinsfmovrqgez = 94, Sparcinsfmovrsgez = 95, Sparcinsfmovrdgz = 96,
      Sparcinsfmovrqgz = 97, Sparcinsfmovrsgz = 98, Sparcinsfmovrdlez = 99,
      Sparcinsfmovrqlez = 100, Sparcinsfmovrslez = 101, Sparcinsfmovrdlz = 102,
      Sparcinsfmovrqlz = 103, Sparcinsfmovrslz = 104, Sparcinsfmovrdnz = 105,
      Sparcinsfmovrqnz = 106, Sparcinsfmovrsnz = 107, Sparcinsfmovrdz = 108,
      Sparcinsfmovrqz = 109, Sparcinsfmovrsz = 110, Sparcinsfmovs = 111,
      Sparcinsfmul8sux16 = 112, Sparcinsfmul8ulx16 = 113,
      Sparcinsfmul8x16 = 114, Sparcinsfmul8x16al = 115,
      Sparcinsfmul8x16au = 116, Sparcinsfmuld = 117, Sparcinsfmuld8sux16 = 118,
      Sparcinsfmuld8ulx16 = 119, Sparcinsfmulq = 120, Sparcinsfmuls = 121,
      Sparcinsfnaddd = 122, Sparcinsfnadds = 123, Sparcinsfnand = 124,
      Sparcinsfnands = 125, Sparcinsfnegd = 126, Sparcinsfnegq = 127,
      Sparcinsfnegs = 128, Sparcinsfnhaddd = 129, Sparcinsfnhadds = 130,
      Sparcinsfnor = 131, Sparcinsfnors = 132, Sparcinsfnot1 = 133,
      Sparcinsfnot1s = 134, Sparcinsfnot2 = 135, Sparcinsfnot2s = 136,
      Sparcinsfone = 137, Sparcinsfones = 138, Sparcinsfor = 139,
      Sparcinsfornot1 = 140, Sparcinsfornot1s = 141, Sparcinsfornot2 = 142,
      Sparcinsfornot2s = 143, Sparcinsfors = 144, Sparcinsfpack16 = 145,
      Sparcinsfpack32 = 146, Sparcinsfpackfix = 147, Sparcinsfpadd16 = 148,
      Sparcinsfpadd16s = 149, Sparcinsfpadd32 = 150, Sparcinsfpadd32s = 151,
      Sparcinsfpadd64 = 152, Sparcinsfpmerge = 153, Sparcinsfpsub16 = 154,
      Sparcinsfpsub16s = 155, Sparcinsfpsub32 = 156, Sparcinsfpsub32s = 157,
      Sparcinsfqtod = 158, Sparcinsfqtoi = 159, Sparcinsfqtos = 160,
      Sparcinsfqtox = 161, Sparcinsfslas16 = 162, Sparcinsfslas32 = 163,
      Sparcinsfsll16 = 164, Sparcinsfsll32 = 165, Sparcinsfsmuld = 166,
      Sparcinsfsqrtd = 167, Sparcinsfsqrtq = 168, Sparcinsfsqrts = 169,
      Sparcinsfsra16 = 170, Sparcinsfsra32 = 171, Sparcinsfsrc1 = 172,
      Sparcinsfsrc1s = 173, Sparcinsfsrc2 = 174, Sparcinsfsrc2s = 175,
      Sparcinsfsrl16 = 176, Sparcinsfsrl32 = 177, Sparcinsfstod = 178,
      Sparcinsfstoi = 179, Sparcinsfstoq = 180, Sparcinsfstox = 181,
      Sparcinsfsubd = 182, Sparcinsfsubq = 183, Sparcinsfsubs = 184,
      Sparcinsfxnor = 185, Sparcinsfxnors = 186, Sparcinsfxor = 187,
      Sparcinsfxors = 188, Sparcinsfxtod = 189, Sparcinsfxtoq = 190,
      Sparcinsfxtos = 191, Sparcinsfzero = 192, Sparcinsfzeros = 193,
      Sparcinsjmpl = 194, Sparcinsldd = 195, Sparcinsld = 196,
      Sparcinsldq = 197, Sparcinsldsb = 198, Sparcinsldsh = 199,
      Sparcinsldsw = 200, Sparcinsldub = 201, Sparcinslduh = 202,
      Sparcinsldx = 203, Sparcinslzcnt = 204, Sparcinsmembar = 205,
      Sparcinsmovdtox = 206, Sparcinsmov = 207, Sparcinsmovrgez = 208,
      Sparcinsmovrgz = 209, Sparcinsmovrlez = 210, Sparcinsmovrlz = 211,
      Sparcinsmovrnz = 212, Sparcinsmovrz = 213, Sparcinsmovstosw = 214,
      Sparcinsmovstouw = 215, Sparcinsmulx = 216, Sparcinsnop = 217,
      Sparcinsorcc = 218, Sparcinsorncc = 219, Sparcinsorn = 220,
      Sparcinsor = 221, Sparcinspdist = 222, Sparcinspdistn = 223,
      Sparcinspopc = 224, Sparcinsrd = 225, Sparcinsrestore = 226,
      Sparcinsrett = 227, Sparcinssave = 228, Sparcinssdivcc = 229,
      Sparcinssdivx = 230, Sparcinssdiv = 231, Sparcinssethi = 232,
      Sparcinsshutdown = 233, Sparcinssiam = 234, Sparcinssllx = 235,
      Sparcinssll = 236, Sparcinssmulcc = 237, Sparcinssmul = 238,
      Sparcinssrax = 239, Sparcinssra = 240, Sparcinssrlx = 241,
      Sparcinssrl = 242, Sparcinsstbar = 243, Sparcinsstb = 244,
      Sparcinsstd = 245, Sparcinsst = 246, Sparcinssth = 247, Sparcinsstq = 248,
      Sparcinsstx = 249, Sparcinssubcc = 250, Sparcinssubx = 251,
      Sparcinssubxcc = 252, Sparcinssub = 253, Sparcinsswap = 254,
      Sparcinstaddcctv = 255, Sparcinstaddcc = 256, Sparcinst = 257,
      Sparcinstsubcctv = 258, Sparcinstsubcc = 259, Sparcinsudivcc = 260,
      Sparcinsudivx = 261, Sparcinsudiv = 262, Sparcinsumulcc = 263,
      Sparcinsumulxhi = 264, Sparcinsumul = 265, Sparcinsunimp = 266,
      Sparcinsfcmped = 267, Sparcinsfcmpeq = 268, Sparcinsfcmpes = 269,
      Sparcinswr = 270, Sparcinsxmulx = 271, Sparcinsxmulxhi = 272,
      Sparcinsxnorcc = 273, Sparcinsxnor = 274, Sparcinsxorcc = 275,
      Sparcinsxor = 276, Sparcinsret = 277, Sparcinsretl = 278,
      Sparcinsending = 279
else:
  static :
    hint("Declaration of " & "enumsparcinsn" &
        " already exists, not redeclaring")
when not declared(enumsparcinsngroup):
  type
    enumsparcinsngroup* {.size: sizeof(cuint).} = enum
      Sparcgrpinvalid = 0, Sparcgrpjump = 1, Sparcgrphardquad = 128,
      Sparcgrpv9 = 129, Sparcgrpvis = 130, Sparcgrpvis2 = 131,
      Sparcgrpvis3 = 132, Sparcgrp32bit = 133, Sparcgrp64bit = 134,
      Sparcgrpending = 135
else:
  static :
    hint("Declaration of " & "enumsparcinsngroup" &
        " already exists, not redeclaring")
when not declared(enumsyszcc):
  type
    enumsyszcc* {.size: sizeof(cuint).} = enum
      Syszccinvalid = 0, Syszcco = 1, Syszcch = 2, Syszccnle = 3, Syszccl = 4,
      Syszccnhe = 5, Syszcclh = 6, Syszccne = 7, Syszcce = 8, Syszccnlh = 9,
      Syszcche = 10, Syszccnl = 11, Syszccle = 12, Syszccnh = 13, Syszccno = 14
else:
  static :
    hint("Declaration of " & "enumsyszcc" & " already exists, not redeclaring")
when not declared(enumsyszoptype):
  type
    enumsyszoptype* {.size: sizeof(cuint).} = enum
      Syszopinvalid = 0, Syszopreg = 1, Syszopimm = 2, Syszopmem = 3,
      Syszopacreg = 64
else:
  static :
    hint("Declaration of " & "enumsyszoptype" &
        " already exists, not redeclaring")
when not declared(enumsyszreg):
  type
    enumsyszreg* {.size: sizeof(cuint).} = enum
      Syszreginvalid = 0, Syszreg0 = 1, Syszreg1 = 2, Syszreg2 = 3,
      Syszreg3 = 4, Syszreg4 = 5, Syszreg5 = 6, Syszreg6 = 7, Syszreg7 = 8,
      Syszreg8 = 9, Syszreg9 = 10, Syszreg10 = 11, Syszreg11 = 12,
      Syszreg12 = 13, Syszreg13 = 14, Syszreg14 = 15, Syszreg15 = 16,
      Syszregcc = 17, Syszregf0 = 18, Syszregf1 = 19, Syszregf2 = 20,
      Syszregf3 = 21, Syszregf4 = 22, Syszregf5 = 23, Syszregf6 = 24,
      Syszregf7 = 25, Syszregf8 = 26, Syszregf9 = 27, Syszregf10 = 28,
      Syszregf11 = 29, Syszregf12 = 30, Syszregf13 = 31, Syszregf14 = 32,
      Syszregf15 = 33, Syszregr0l = 34, Syszregending = 35
else:
  static :
    hint("Declaration of " & "enumsyszreg" & " already exists, not redeclaring")
when not declared(enumsyszinsn):
  type
    enumsyszinsn* {.size: sizeof(cuint).} = enum
      Syszinsinvalid = 0, Syszinsa = 1, Syszinsadb = 2, Syszinsadbr = 3,
      Syszinsaeb = 4, Syszinsaebr = 5, Syszinsafi = 6, Syszinsag = 7,
      Syszinsagf = 8, Syszinsagfi = 9, Syszinsagfr = 10, Syszinsaghi = 11,
      Syszinsaghik = 12, Syszinsagr = 13, Syszinsagrk = 14, Syszinsagsi = 15,
      Syszinsah = 16, Syszinsahi = 17, Syszinsahik = 18, Syszinsahy = 19,
      Syszinsaih = 20, Syszinsal = 21, Syszinsalc = 22, Syszinsalcg = 23,
      Syszinsalcgr = 24, Syszinsalcr = 25, Syszinsalfi = 26, Syszinsalg = 27,
      Syszinsalgf = 28, Syszinsalgfi = 29, Syszinsalgfr = 30,
      Syszinsalghsik = 31, Syszinsalgr = 32, Syszinsalgrk = 33,
      Syszinsalhsik = 34, Syszinsalr = 35, Syszinsalrk = 36, Syszinsaly = 37,
      Syszinsar = 38, Syszinsark = 39, Syszinsasi = 40, Syszinsaxbr = 41,
      Syszinsay = 42, Syszinsbcr = 43, Syszinsbrc = 44, Syszinsbrcl = 45,
      Syszinscgij = 46, Syszinscgrj = 47, Syszinscij = 48, Syszinsclgij = 49,
      Syszinsclgrj = 50, Syszinsclij = 51, Syszinsclrj = 52, Syszinscrj = 53,
      Syszinsber = 54, Syszinsje = 55, Syszinsjge = 56, Syszinsloce = 57,
      Syszinslocge = 58, Syszinslocgre = 59, Syszinslocre = 60,
      Syszinsstoce = 61, Syszinsstocge = 62, Syszinsbhr = 63, Syszinsbher = 64,
      Syszinsjhe = 65, Syszinsjghe = 66, Syszinsloche = 67, Syszinslocghe = 68,
      Syszinslocgrhe = 69, Syszinslocrhe = 70, Syszinsstoche = 71,
      Syszinsstocghe = 72, Syszinsjh = 73, Syszinsjgh = 74, Syszinsloch = 75,
      Syszinslocgh = 76, Syszinslocgrh = 77, Syszinslocrh = 78,
      Syszinsstoch = 79, Syszinsstocgh = 80, Syszinscgijnlh = 81,
      Syszinscgrjnlh = 82, Syszinscijnlh = 83, Syszinsclgijnlh = 84,
      Syszinsclgrjnlh = 85, Syszinsclijnlh = 86, Syszinsclrjnlh = 87,
      Syszinscrjnlh = 88, Syszinscgije = 89, Syszinscgrje = 90,
      Syszinscije = 91, Syszinsclgije = 92, Syszinsclgrje = 93,
      Syszinsclije = 94, Syszinsclrje = 95, Syszinscrje = 96,
      Syszinscgijnle = 97, Syszinscgrjnle = 98, Syszinscijnle = 99,
      Syszinsclgijnle = 100, Syszinsclgrjnle = 101, Syszinsclijnle = 102,
      Syszinsclrjnle = 103, Syszinscrjnle = 104, Syszinscgijh = 105,
      Syszinscgrjh = 106, Syszinscijh = 107, Syszinsclgijh = 108,
      Syszinsclgrjh = 109, Syszinsclijh = 110, Syszinsclrjh = 111,
      Syszinscrjh = 112, Syszinscgijnl = 113, Syszinscgrjnl = 114,
      Syszinscijnl = 115, Syszinsclgijnl = 116, Syszinsclgrjnl = 117,
      Syszinsclijnl = 118, Syszinsclrjnl = 119, Syszinscrjnl = 120,
      Syszinscgijhe = 121, Syszinscgrjhe = 122, Syszinscijhe = 123,
      Syszinsclgijhe = 124, Syszinsclgrjhe = 125, Syszinsclijhe = 126,
      Syszinsclrjhe = 127, Syszinscrjhe = 128, Syszinscgijnhe = 129,
      Syszinscgrjnhe = 130, Syszinscijnhe = 131, Syszinsclgijnhe = 132,
      Syszinsclgrjnhe = 133, Syszinsclijnhe = 134, Syszinsclrjnhe = 135,
      Syszinscrjnhe = 136, Syszinscgijl = 137, Syszinscgrjl = 138,
      Syszinscijl = 139, Syszinsclgijl = 140, Syszinsclgrjl = 141,
      Syszinsclijl = 142, Syszinsclrjl = 143, Syszinscrjl = 144,
      Syszinscgijnh = 145, Syszinscgrjnh = 146, Syszinscijnh = 147,
      Syszinsclgijnh = 148, Syszinsclgrjnh = 149, Syszinsclijnh = 150,
      Syszinsclrjnh = 151, Syszinscrjnh = 152, Syszinscgijle = 153,
      Syszinscgrjle = 154, Syszinscijle = 155, Syszinsclgijle = 156,
      Syszinsclgrjle = 157, Syszinsclijle = 158, Syszinsclrjle = 159,
      Syszinscrjle = 160, Syszinscgijne = 161, Syszinscgrjne = 162,
      Syszinscijne = 163, Syszinsclgijne = 164, Syszinsclgrjne = 165,
      Syszinsclijne = 166, Syszinsclrjne = 167, Syszinscrjne = 168,
      Syszinscgijlh = 169, Syszinscgrjlh = 170, Syszinscijlh = 171,
      Syszinsclgijlh = 172, Syszinsclgrjlh = 173, Syszinsclijlh = 174,
      Syszinsclrjlh = 175, Syszinscrjlh = 176, Syszinsblr = 177,
      Syszinsbler = 178, Syszinsjle = 179, Syszinsjgle = 180,
      Syszinslocle = 181, Syszinslocgle = 182, Syszinslocgrle = 183,
      Syszinslocrle = 184, Syszinsstocle = 185, Syszinsstocgle = 186,
      Syszinsblhr = 187, Syszinsjlh = 188, Syszinsjglh = 189,
      Syszinsloclh = 190, Syszinslocglh = 191, Syszinslocgrlh = 192,
      Syszinslocrlh = 193, Syszinsstoclh = 194, Syszinsstocglh = 195,
      Syszinsjl = 196, Syszinsjgl = 197, Syszinslocl = 198, Syszinslocgl = 199,
      Syszinslocgrl = 200, Syszinslocrl = 201, Syszinsloc = 202,
      Syszinslocg = 203, Syszinslocgr = 204, Syszinslocr = 205,
      Syszinsstocl = 206, Syszinsstocgl = 207, Syszinsbner = 208,
      Syszinsjne = 209, Syszinsjgne = 210, Syszinslocne = 211,
      Syszinslocgne = 212, Syszinslocgrne = 213, Syszinslocrne = 214,
      Syszinsstocne = 215, Syszinsstocgne = 216, Syszinsbnhr = 217,
      Syszinsbnher = 218, Syszinsjnhe = 219, Syszinsjgnhe = 220,
      Syszinslocnhe = 221, Syszinslocgnhe = 222, Syszinslocgrnhe = 223,
      Syszinslocrnhe = 224, Syszinsstocnhe = 225, Syszinsstocgnhe = 226,
      Syszinsjnh = 227, Syszinsjgnh = 228, Syszinslocnh = 229,
      Syszinslocgnh = 230, Syszinslocgrnh = 231, Syszinslocrnh = 232,
      Syszinsstocnh = 233, Syszinsstocgnh = 234, Syszinsbnlr = 235,
      Syszinsbnler = 236, Syszinsjnle = 237, Syszinsjgnle = 238,
      Syszinslocnle = 239, Syszinslocgnle = 240, Syszinslocgrnle = 241,
      Syszinslocrnle = 242, Syszinsstocnle = 243, Syszinsstocgnle = 244,
      Syszinsbnlhr = 245, Syszinsjnlh = 246, Syszinsjgnlh = 247,
      Syszinslocnlh = 248, Syszinslocgnlh = 249, Syszinslocgrnlh = 250,
      Syszinslocrnlh = 251, Syszinsstocnlh = 252, Syszinsstocgnlh = 253,
      Syszinsjnl = 254, Syszinsjgnl = 255, Syszinslocnl = 256,
      Syszinslocgnl = 257, Syszinslocgrnl = 258, Syszinslocrnl = 259,
      Syszinsstocnl = 260, Syszinsstocgnl = 261, Syszinsbnor = 262,
      Syszinsjno = 263, Syszinsjgno = 264, Syszinslocno = 265,
      Syszinslocgno = 266, Syszinslocgrno = 267, Syszinslocrno = 268,
      Syszinsstocno = 269, Syszinsstocgno = 270, Syszinsbor = 271,
      Syszinsjo = 272, Syszinsjgo = 273, Syszinsloco = 274, Syszinslocgo = 275,
      Syszinslocgro = 276, Syszinslocro = 277, Syszinsstoco = 278,
      Syszinsstocgo = 279, Syszinsstoc = 280, Syszinsstocg = 281,
      Syszinsbasr = 282, Syszinsbr = 283, Syszinsbras = 284, Syszinsbrasl = 285,
      Syszinsj = 286, Syszinsjg = 287, Syszinsbrct = 288, Syszinsbrctg = 289,
      Syszinsc = 290, Syszinscdb = 291, Syszinscdbr = 292, Syszinscdfbr = 293,
      Syszinscdgbr = 294, Syszinscdlfbr = 295, Syszinscdlgbr = 296,
      Syszinsceb = 297, Syszinscebr = 298, Syszinscefbr = 299,
      Syszinscegbr = 300, Syszinscelfbr = 301, Syszinscelgbr = 302,
      Syszinscfdbr = 303, Syszinscfebr = 304, Syszinscfi = 305,
      Syszinscfxbr = 306, Syszinscg = 307, Syszinscgdbr = 308,
      Syszinscgebr = 309, Syszinscgf = 310, Syszinscgfi = 311,
      Syszinscgfr = 312, Syszinscgfrl = 313, Syszinscgh = 314,
      Syszinscghi = 315, Syszinscghrl = 316, Syszinscghsi = 317,
      Syszinscgr = 318, Syszinscgrl = 319, Syszinscgxbr = 320, Syszinsch = 321,
      Syszinschf = 322, Syszinschhsi = 323, Syszinschi = 324, Syszinschrl = 325,
      Syszinschsi = 326, Syszinschy = 327, Syszinscih = 328, Syszinscl = 329,
      Syszinsclc = 330, Syszinsclfdbr = 331, Syszinsclfebr = 332,
      Syszinsclfhsi = 333, Syszinsclfi = 334, Syszinsclfxbr = 335,
      Syszinsclg = 336, Syszinsclgdbr = 337, Syszinsclgebr = 338,
      Syszinsclgf = 339, Syszinsclgfi = 340, Syszinsclgfr = 341,
      Syszinsclgfrl = 342, Syszinsclghrl = 343, Syszinsclghsi = 344,
      Syszinsclgr = 345, Syszinsclgrl = 346, Syszinsclgxbr = 347,
      Syszinsclhf = 348, Syszinsclhhsi = 349, Syszinsclhrl = 350,
      Syszinscli = 351, Syszinsclih = 352, Syszinscliy = 353, Syszinsclr = 354,
      Syszinsclrl = 355, Syszinsclst = 356, Syszinscly = 357,
      Syszinscpsdr = 358, Syszinscr = 359, Syszinscrl = 360, Syszinscs = 361,
      Syszinscsg = 362, Syszinscsy = 363, Syszinscxbr = 364, Syszinscxfbr = 365,
      Syszinscxgbr = 366, Syszinscxlfbr = 367, Syszinscxlgbr = 368,
      Syszinscy = 369, Syszinsddb = 370, Syszinsddbr = 371, Syszinsdeb = 372,
      Syszinsdebr = 373, Syszinsdl = 374, Syszinsdlg = 375, Syszinsdlgr = 376,
      Syszinsdlr = 377, Syszinsdsg = 378, Syszinsdsgf = 379, Syszinsdsgfr = 380,
      Syszinsdsgr = 381, Syszinsdxbr = 382, Syszinsear = 383,
      Syszinsfidbr = 384, Syszinsfidbra = 385, Syszinsfiebr = 386,
      Syszinsfiebra = 387, Syszinsfixbr = 388, Syszinsfixbra = 389,
      Syszinsflogr = 390, Syszinsic = 391, Syszinsicy = 392, Syszinsiihf = 393,
      Syszinsiihh = 394, Syszinsiihl = 395, Syszinsiilf = 396,
      Syszinsiilh = 397, Syszinsiill = 398, Syszinsipm = 399, Syszinsl = 400,
      Syszinsla = 401, Syszinslaa = 402, Syszinslaag = 403, Syszinslaal = 404,
      Syszinslaalg = 405, Syszinslan = 406, Syszinslang = 407, Syszinslao = 408,
      Syszinslaog = 409, Syszinslarl = 410, Syszinslax = 411, Syszinslaxg = 412,
      Syszinslay = 413, Syszinslb = 414, Syszinslbh = 415, Syszinslbr = 416,
      Syszinslcdbr = 417, Syszinslcebr = 418, Syszinslcgfr = 419,
      Syszinslcgr = 420, Syszinslcr = 421, Syszinslcxbr = 422, Syszinsld = 423,
      Syszinsldeb = 424, Syszinsldebr = 425, Syszinsldgr = 426,
      Syszinsldr = 427, Syszinsldxbr = 428, Syszinsldxbra = 429,
      Syszinsldy = 430, Syszinsle = 431, Syszinsledbr = 432,
      Syszinsledbra = 433, Syszinsler = 434, Syszinslexbr = 435,
      Syszinslexbra = 436, Syszinsley = 437, Syszinslfh = 438, Syszinslg = 439,
      Syszinslgb = 440, Syszinslgbr = 441, Syszinslgdr = 442, Syszinslgf = 443,
      Syszinslgfi = 444, Syszinslgfr = 445, Syszinslgfrl = 446,
      Syszinslgh = 447, Syszinslghi = 448, Syszinslghr = 449,
      Syszinslghrl = 450, Syszinslgr = 451, Syszinslgrl = 452, Syszinslh = 453,
      Syszinslhh = 454, Syszinslhi = 455, Syszinslhr = 456, Syszinslhrl = 457,
      Syszinslhy = 458, Syszinsllc = 459, Syszinsllch = 460, Syszinsllcr = 461,
      Syszinsllgc = 462, Syszinsllgcr = 463, Syszinsllgf = 464,
      Syszinsllgfr = 465, Syszinsllgfrl = 466, Syszinsllgh = 467,
      Syszinsllghr = 468, Syszinsllghrl = 469, Syszinsllh = 470,
      Syszinsllhh = 471, Syszinsllhr = 472, Syszinsllhrl = 473,
      Syszinsllihf = 474, Syszinsllihh = 475, Syszinsllihl = 476,
      Syszinsllilf = 477, Syszinsllilh = 478, Syszinsllill = 479,
      Syszinslmg = 480, Syszinslndbr = 481, Syszinslnebr = 482,
      Syszinslngfr = 483, Syszinslngr = 484, Syszinslnr = 485,
      Syszinslnxbr = 486, Syszinslpdbr = 487, Syszinslpebr = 488,
      Syszinslpgfr = 489, Syszinslpgr = 490, Syszinslpr = 491,
      Syszinslpxbr = 492, Syszinslr = 493, Syszinslrl = 494, Syszinslrv = 495,
      Syszinslrvg = 496, Syszinslrvgr = 497, Syszinslrvr = 498, Syszinslt = 499,
      Syszinsltdbr = 500, Syszinsltebr = 501, Syszinsltg = 502,
      Syszinsltgf = 503, Syszinsltgfr = 504, Syszinsltgr = 505,
      Syszinsltr = 506, Syszinsltxbr = 507, Syszinslxdb = 508,
      Syszinslxdbr = 509, Syszinslxeb = 510, Syszinslxebr = 511,
      Syszinslxr = 512, Syszinsly = 513, Syszinslzdr = 514, Syszinslzer = 515,
      Syszinslzxr = 516, Syszinsmadb = 517, Syszinsmadbr = 518,
      Syszinsmaeb = 519, Syszinsmaebr = 520, Syszinsmdb = 521,
      Syszinsmdbr = 522, Syszinsmdeb = 523, Syszinsmdebr = 524,
      Syszinsmeeb = 525, Syszinsmeebr = 526, Syszinsmghi = 527, Syszinsmh = 528,
      Syszinsmhi = 529, Syszinsmhy = 530, Syszinsmlg = 531, Syszinsmlgr = 532,
      Syszinsms = 533, Syszinsmsdb = 534, Syszinsmsdbr = 535, Syszinsmseb = 536,
      Syszinsmsebr = 537, Syszinsmsfi = 538, Syszinsmsg = 539,
      Syszinsmsgf = 540, Syszinsmsgfi = 541, Syszinsmsgfr = 542,
      Syszinsmsgr = 543, Syszinsmsr = 544, Syszinsmsy = 545, Syszinsmvc = 546,
      Syszinsmvghi = 547, Syszinsmvhhi = 548, Syszinsmvhi = 549,
      Syszinsmvi = 550, Syszinsmviy = 551, Syszinsmvst = 552, Syszinsmxbr = 553,
      Syszinsmxdb = 554, Syszinsmxdbr = 555, Syszinsn = 556, Syszinsnc = 557,
      Syszinsng = 558, Syszinsngr = 559, Syszinsngrk = 560, Syszinsni = 561,
      Syszinsnihf = 562, Syszinsnihh = 563, Syszinsnihl = 564,
      Syszinsnilf = 565, Syszinsnilh = 566, Syszinsnill = 567, Syszinsniy = 568,
      Syszinsnr = 569, Syszinsnrk = 570, Syszinsny = 571, Syszinso = 572,
      Syszinsoc = 573, Syszinsog = 574, Syszinsogr = 575, Syszinsogrk = 576,
      Syszinsoi = 577, Syszinsoihf = 578, Syszinsoihh = 579, Syszinsoihl = 580,
      Syszinsoilf = 581, Syszinsoilh = 582, Syszinsoill = 583, Syszinsoiy = 584,
      Syszinsor = 585, Syszinsork = 586, Syszinsoy = 587, Syszinspfd = 588,
      Syszinspfdrl = 589, Syszinsrisbg = 590, Syszinsrisbhg = 591,
      Syszinsrisblg = 592, Syszinsrll = 593, Syszinsrllg = 594,
      Syszinsrnsbg = 595, Syszinsrosbg = 596, Syszinsrxsbg = 597,
      Syszinss = 598, Syszinssdb = 599, Syszinssdbr = 600, Syszinsseb = 601,
      Syszinssebr = 602, Syszinssg = 603, Syszinssgf = 604, Syszinssgfr = 605,
      Syszinssgr = 606, Syszinssgrk = 607, Syszinssh = 608, Syszinsshy = 609,
      Syszinssl = 610, Syszinsslb = 611, Syszinsslbg = 612, Syszinsslbr = 613,
      Syszinsslfi = 614, Syszinsslg = 615, Syszinsslbgr = 616,
      Syszinsslgf = 617, Syszinsslgfi = 618, Syszinsslgfr = 619,
      Syszinsslgr = 620, Syszinsslgrk = 621, Syszinssll = 622,
      Syszinssllg = 623, Syszinssllk = 624, Syszinsslr = 625, Syszinsslrk = 626,
      Syszinssly = 627, Syszinssqdb = 628, Syszinssqdbr = 629,
      Syszinssqeb = 630, Syszinssqebr = 631, Syszinssqxbr = 632,
      Syszinssr = 633, Syszinssra = 634, Syszinssrag = 635, Syszinssrak = 636,
      Syszinssrk = 637, Syszinssrl = 638, Syszinssrlg = 639, Syszinssrlk = 640,
      Syszinssrst = 641, Syszinsst = 642, Syszinsstc = 643, Syszinsstch = 644,
      Syszinsstcy = 645, Syszinsstd = 646, Syszinsstdy = 647, Syszinsste = 648,
      Syszinsstey = 649, Syszinsstfh = 650, Syszinsstg = 651,
      Syszinsstgrl = 652, Syszinssth = 653, Syszinssthh = 654,
      Syszinssthrl = 655, Syszinssthy = 656, Syszinsstmg = 657,
      Syszinsstrl = 658, Syszinsstrv = 659, Syszinsstrvg = 660,
      Syszinssty = 661, Syszinssxbr = 662, Syszinssy = 663, Syszinstm = 664,
      Syszinstmhh = 665, Syszinstmhl = 666, Syszinstmlh = 667,
      Syszinstmll = 668, Syszinstmy = 669, Syszinsx = 670, Syszinsxc = 671,
      Syszinsxg = 672, Syszinsxgr = 673, Syszinsxgrk = 674, Syszinsxi = 675,
      Syszinsxihf = 676, Syszinsxilf = 677, Syszinsxiy = 678, Syszinsxr = 679,
      Syszinsxrk = 680, Syszinsxy = 681, Syszinsending = 682
else:
  static :
    hint("Declaration of " & "enumsyszinsn" & " already exists, not redeclaring")
when not declared(enumsyszinsngroup):
  type
    enumsyszinsngroup* {.size: sizeof(cuint).} = enum
      Syszgrpinvalid = 0, Syszgrpjump = 1, Syszgrpdistinctops = 128,
      Syszgrpfpextension = 129, Syszgrphighword = 130,
      Syszgrpinterlockedaccess1 = 131, Syszgrploadstoreoncond = 132,
      Syszgrpending = 133
else:
  static :
    hint("Declaration of " & "enumsyszinsngroup" &
        " already exists, not redeclaring")
when not declared(enumx86reg):
  type
    enumx86reg* {.size: sizeof(cuint).} = enum
      X86reginvalid = 0, X86regah = 1, X86regal = 2, X86regax = 3, X86regbh = 4,
      X86regbl = 5, X86regbp = 6, X86regbpl = 7, X86regbx = 8, X86regch = 9,
      X86regcl = 10, X86regcs = 11, X86regcx = 12, X86regdh = 13, X86regdi = 14,
      X86regdil = 15, X86regdl = 16, X86regds = 17, X86regdx = 18,
      X86regeax = 19, X86regebp = 20, X86regebx = 21, X86regecx = 22,
      X86regedi = 23, X86regedx = 24, X86regeflags = 25, X86regeip = 26,
      X86regeiz = 27, X86reges = 28, X86regesi = 29, X86regesp = 30,
      X86regfpsw = 31, X86regfs = 32, X86reggs = 33, X86regip = 34,
      X86regrax = 35, X86regrbp = 36, X86regrbx = 37, X86regrcx = 38,
      X86regrdi = 39, X86regrdx = 40, X86regrip = 41, X86regriz = 42,
      X86regrsi = 43, X86regrsp = 44, X86regsi = 45, X86regsil = 46,
      X86regsp = 47, X86regspl = 48, X86regss = 49, X86regcr0 = 50,
      X86regcr1 = 51, X86regcr2 = 52, X86regcr3 = 53, X86regcr4 = 54,
      X86regcr5 = 55, X86regcr6 = 56, X86regcr7 = 57, X86regcr8 = 58,
      X86regcr9 = 59, X86regcr10 = 60, X86regcr11 = 61, X86regcr12 = 62,
      X86regcr13 = 63, X86regcr14 = 64, X86regcr15 = 65, X86regdr0 = 66,
      X86regdr1 = 67, X86regdr2 = 68, X86regdr3 = 69, X86regdr4 = 70,
      X86regdr5 = 71, X86regdr6 = 72, X86regdr7 = 73, X86regdr8 = 74,
      X86regdr9 = 75, X86regdr10 = 76, X86regdr11 = 77, X86regdr12 = 78,
      X86regdr13 = 79, X86regdr14 = 80, X86regdr15 = 81, X86regfp0 = 82,
      X86regfp1 = 83, X86regfp2 = 84, X86regfp3 = 85, X86regfp4 = 86,
      X86regfp5 = 87, X86regfp6 = 88, X86regfp7 = 89, X86regk0 = 90,
      X86regk1 = 91, X86regk2 = 92, X86regk3 = 93, X86regk4 = 94, X86regk5 = 95,
      X86regk6 = 96, X86regk7 = 97, X86regmm0 = 98, X86regmm1 = 99,
      X86regmm2 = 100, X86regmm3 = 101, X86regmm4 = 102, X86regmm5 = 103,
      X86regmm6 = 104, X86regmm7 = 105, X86regr8 = 106, X86regr9 = 107,
      X86regr10 = 108, X86regr11 = 109, X86regr12 = 110, X86regr13 = 111,
      X86regr14 = 112, X86regr15 = 113, X86regst0 = 114, X86regst1 = 115,
      X86regst2 = 116, X86regst3 = 117, X86regst4 = 118, X86regst5 = 119,
      X86regst6 = 120, X86regst7 = 121, X86regxmm0 = 122, X86regxmm1 = 123,
      X86regxmm2 = 124, X86regxmm3 = 125, X86regxmm4 = 126, X86regxmm5 = 127,
      X86regxmm6 = 128, X86regxmm7 = 129, X86regxmm8 = 130, X86regxmm9 = 131,
      X86regxmm10 = 132, X86regxmm11 = 133, X86regxmm12 = 134,
      X86regxmm13 = 135, X86regxmm14 = 136, X86regxmm15 = 137,
      X86regxmm16 = 138, X86regxmm17 = 139, X86regxmm18 = 140,
      X86regxmm19 = 141, X86regxmm20 = 142, X86regxmm21 = 143,
      X86regxmm22 = 144, X86regxmm23 = 145, X86regxmm24 = 146,
      X86regxmm25 = 147, X86regxmm26 = 148, X86regxmm27 = 149,
      X86regxmm28 = 150, X86regxmm29 = 151, X86regxmm30 = 152,
      X86regxmm31 = 153, X86regymm0 = 154, X86regymm1 = 155, X86regymm2 = 156,
      X86regymm3 = 157, X86regymm4 = 158, X86regymm5 = 159, X86regymm6 = 160,
      X86regymm7 = 161, X86regymm8 = 162, X86regymm9 = 163, X86regymm10 = 164,
      X86regymm11 = 165, X86regymm12 = 166, X86regymm13 = 167,
      X86regymm14 = 168, X86regymm15 = 169, X86regymm16 = 170,
      X86regymm17 = 171, X86regymm18 = 172, X86regymm19 = 173,
      X86regymm20 = 174, X86regymm21 = 175, X86regymm22 = 176,
      X86regymm23 = 177, X86regymm24 = 178, X86regymm25 = 179,
      X86regymm26 = 180, X86regymm27 = 181, X86regymm28 = 182,
      X86regymm29 = 183, X86regymm30 = 184, X86regymm31 = 185, X86regzmm0 = 186,
      X86regzmm1 = 187, X86regzmm2 = 188, X86regzmm3 = 189, X86regzmm4 = 190,
      X86regzmm5 = 191, X86regzmm6 = 192, X86regzmm7 = 193, X86regzmm8 = 194,
      X86regzmm9 = 195, X86regzmm10 = 196, X86regzmm11 = 197, X86regzmm12 = 198,
      X86regzmm13 = 199, X86regzmm14 = 200, X86regzmm15 = 201,
      X86regzmm16 = 202, X86regzmm17 = 203, X86regzmm18 = 204,
      X86regzmm19 = 205, X86regzmm20 = 206, X86regzmm21 = 207,
      X86regzmm22 = 208, X86regzmm23 = 209, X86regzmm24 = 210,
      X86regzmm25 = 211, X86regzmm26 = 212, X86regzmm27 = 213,
      X86regzmm28 = 214, X86regzmm29 = 215, X86regzmm30 = 216,
      X86regzmm31 = 217, X86regr8b = 218, X86regr9b = 219, X86regr10b = 220,
      X86regr11b = 221, X86regr12b = 222, X86regr13b = 223, X86regr14b = 224,
      X86regr15b = 225, X86regr8d = 226, X86regr9d = 227, X86regr10d = 228,
      X86regr11d = 229, X86regr12d = 230, X86regr13d = 231, X86regr14d = 232,
      X86regr15d = 233, X86regr8w = 234, X86regr9w = 235, X86regr10w = 236,
      X86regr11w = 237, X86regr12w = 238, X86regr13w = 239, X86regr14w = 240,
      X86regr15w = 241, X86regending = 242
else:
  static :
    hint("Declaration of " & "enumx86reg" & " already exists, not redeclaring")
when not declared(enumx86optype):
  type
    enumx86optype* {.size: sizeof(cuint).} = enum
      X86opinvalid = 0, X86opreg = 1, X86opimm = 2, X86opmem = 3
else:
  static :
    hint("Declaration of " & "enumx86optype" &
        " already exists, not redeclaring")
when not declared(enumx86xopcc):
  type
    enumx86xopcc* {.size: sizeof(cuint).} = enum
      X86xopccinvalid = 0, X86xopcclt = 1, X86xopccle = 2, X86xopccgt = 3,
      X86xopccge = 4, X86xopcceq = 5, X86xopccneq = 6, X86xopccfalse = 7,
      X86xopcctrue = 8
else:
  static :
    hint("Declaration of " & "enumx86xopcc" & " already exists, not redeclaring")
when not declared(enumx86avxbcast):
  type
    enumx86avxbcast* {.size: sizeof(cuint).} = enum
      X86avxbcastinvalid = 0, X86avxbcast2 = 1, X86avxbcast4 = 2,
      X86avxbcast8 = 3, X86avxbcast16 = 4
else:
  static :
    hint("Declaration of " & "enumx86avxbcast" &
        " already exists, not redeclaring")
when not declared(enumx86ssecc):
  type
    enumx86ssecc* {.size: sizeof(cuint).} = enum
      X86sseccinvalid = 0, X86ssecceq = 1, X86ssecclt = 2, X86sseccle = 3,
      X86sseccunord = 4, X86sseccneq = 5, X86sseccnlt = 6, X86sseccnle = 7,
      X86sseccord = 8
else:
  static :
    hint("Declaration of " & "enumx86ssecc" & " already exists, not redeclaring")
when not declared(enumx86avxcc):
  type
    enumx86avxcc* {.size: sizeof(cuint).} = enum
      X86avxccinvalid = 0, X86avxcceq = 1, X86avxcclt = 2, X86avxccle = 3,
      X86avxccunord = 4, X86avxccneq = 5, X86avxccnlt = 6, X86avxccnle = 7,
      X86avxccord = 8, X86avxccequq = 9, X86avxccnge = 10, X86avxccngt = 11,
      X86avxccfalse = 12, X86avxccneqoq = 13, X86avxccge = 14, X86avxccgt = 15,
      X86avxcctrue = 16, X86avxcceqos = 17, X86avxccltoq = 18,
      X86avxccleoq = 19, X86avxccunords = 20, X86avxccnequs = 21,
      X86avxccnltuq = 22, X86avxccnleuq = 23, X86avxccords = 24,
      X86avxccequs = 25, X86avxccngeuq = 26, X86avxccngtuq = 27,
      X86avxccfalseos = 28, X86avxccneqos = 29, X86avxccgeoq = 30,
      X86avxccgtoq = 31, X86avxcctrueus = 32
else:
  static :
    hint("Declaration of " & "enumx86avxcc" & " already exists, not redeclaring")
when not declared(enumx86avxrm):
  type
    enumx86avxrm* {.size: sizeof(cuint).} = enum
      X86avxrminvalid = 0, X86avxrmrn = 1, X86avxrmrd = 2, X86avxrmru = 3,
      X86avxrmrz = 4
else:
  static :
    hint("Declaration of " & "enumx86avxrm" & " already exists, not redeclaring")
when not declared(enumx86prefix):
  type
    enumx86prefix* {.size: sizeof(cuint).} = enum
      X86prefixes = 38, X86prefixcs = 46, X86prefixss = 54, X86prefixds = 62,
      X86prefixfs = 100, X86prefixgs = 101, X86prefixopsize = 102,
      X86prefixaddrsize = 103, X86prefixlock = 240, X86prefixrepne = 242,
      X86prefixrep = 243
else:
  static :
    hint("Declaration of " & "enumx86prefix" &
        " already exists, not redeclaring")
when not declared(X86prefixrepe):
  const
    X86prefixrepe* = enumx86prefix.X86prefixrep
else:
  static :
    hint("Declaration of " & "X86prefixrepe" &
        " already exists, not redeclaring")
when not declared(enumx86insn):
  type
    enumx86insn* {.size: sizeof(cuint).} = enum
      X86insinvalid = 0, X86insaaa = 1, X86insaad = 2, X86insaam = 3,
      X86insaas = 4, X86insfabs = 5, X86insadc = 6, X86insadcx = 7,
      X86insadd = 8, X86insaddpd = 9, X86insaddps = 10, X86insaddsd = 11,
      X86insaddss = 12, X86insaddsubpd = 13, X86insaddsubps = 14,
      X86insfadd = 15, X86insfiadd = 16, X86insfaddp = 17, X86insadox = 18,
      X86insaesdeclast = 19, X86insaesdec = 20, X86insaesenclast = 21,
      X86insaesenc = 22, X86insaesimc = 23, X86insaeskeygenassist = 24,
      X86insand = 25, X86insandn = 26, X86insandnpd = 27, X86insandnps = 28,
      X86insandpd = 29, X86insandps = 30, X86insarpl = 31, X86insbextr = 32,
      X86insblcfill = 33, X86insblci = 34, X86insblcic = 35, X86insblcmsk = 36,
      X86insblcs = 37, X86insblendpd = 38, X86insblendps = 39,
      X86insblendvpd = 40, X86insblendvps = 41, X86insblsfill = 42,
      X86insblsi = 43, X86insblsic = 44, X86insblsmsk = 45, X86insblsr = 46,
      X86insbound = 47, X86insbsf = 48, X86insbsr = 49, X86insbswap = 50,
      X86insbt = 51, X86insbtc = 52, X86insbtr = 53, X86insbts = 54,
      X86insbzhi = 55, X86inscall = 56, X86inscbw = 57, X86inscdq = 58,
      X86inscdqe = 59, X86insfchs = 60, X86insclac = 61, X86insclc = 62,
      X86inscld = 63, X86insclflush = 64, X86insclflushopt = 65,
      X86insclgi = 66, X86inscli = 67, X86insclts = 68, X86insclwb = 69,
      X86inscmc = 70, X86inscmova = 71, X86inscmovae = 72, X86inscmovb = 73,
      X86inscmovbe = 74, X86insfcmovbe = 75, X86insfcmovb = 76,
      X86inscmove = 77, X86insfcmove = 78, X86inscmovg = 79, X86inscmovge = 80,
      X86inscmovl = 81, X86inscmovle = 82, X86insfcmovnbe = 83,
      X86insfcmovnb = 84, X86inscmovne = 85, X86insfcmovne = 86,
      X86inscmovno = 87, X86inscmovnp = 88, X86insfcmovnu = 89,
      X86inscmovns = 90, X86inscmovo = 91, X86inscmovp = 92, X86insfcmovu = 93,
      X86inscmovs = 94, X86inscmp = 95, X86inscmpsb = 96, X86inscmpsq = 97,
      X86inscmpsw = 98, X86inscmpxchg16b = 99, X86inscmpxchg = 100,
      X86inscmpxchg8b = 101, X86inscomisd = 102, X86inscomiss = 103,
      X86insfcomp = 104, X86insfcomip = 105, X86insfcomi = 106,
      X86insfcom = 107, X86insfcos = 108, X86inscpuid = 109, X86inscqo = 110,
      X86inscrc32 = 111, X86inscvtdq2pd = 112, X86inscvtdq2ps = 113,
      X86inscvtpd2dq = 114, X86inscvtpd2ps = 115, X86inscvtps2dq = 116,
      X86inscvtps2pd = 117, X86inscvtsd2si = 118, X86inscvtsd2ss = 119,
      X86inscvtsi2sd = 120, X86inscvtsi2ss = 121, X86inscvtss2sd = 122,
      X86inscvtss2si = 123, X86inscvttpd2dq = 124, X86inscvttps2dq = 125,
      X86inscvttsd2si = 126, X86inscvttss2si = 127, X86inscwd = 128,
      X86inscwde = 129, X86insdaa = 130, X86insdas = 131, X86insdata16 = 132,
      X86insdec = 133, X86insdiv = 134, X86insdivpd = 135, X86insdivps = 136,
      X86insfdivr = 137, X86insfidivr = 138, X86insfdivrp = 139,
      X86insdivsd = 140, X86insdivss = 141, X86insfdiv = 142, X86insfidiv = 143,
      X86insfdivp = 144, X86insdppd = 145, X86insdpps = 146, X86insret = 147,
      X86insencls = 148, X86insenclu = 149, X86insenter = 150,
      X86insextractps = 151, X86insextrq = 152, X86insf2xm1 = 153,
      X86inslcall = 154, X86insljmp = 155, X86insfbld = 156, X86insfbstp = 157,
      X86insfcompp = 158, X86insfdecstp = 159, X86insfemms = 160,
      X86insffree = 161, X86insficom = 162, X86insficomp = 163,
      X86insfincstp = 164, X86insfldcw = 165, X86insfldenv = 166,
      X86insfldl2e = 167, X86insfldl2t = 168, X86insfldlg2 = 169,
      X86insfldln2 = 170, X86insfldpi = 171, X86insfnclex = 172,
      X86insfninit = 173, X86insfnop = 174, X86insfnstcw = 175,
      X86insfnstsw = 176, X86insfpatan = 177, X86insfprem = 178,
      X86insfprem1 = 179, X86insfptan = 180, X86insffreep = 181,
      X86insfrndint = 182, X86insfrstor = 183, X86insfnsave = 184,
      X86insfscale = 185, X86insfsetpm = 186, X86insfsincos = 187,
      X86insfnstenv = 188, X86insfxam = 189, X86insfxrstor = 190,
      X86insfxrstor64 = 191, X86insfxsave = 192, X86insfxsave64 = 193,
      X86insfxtract = 194, X86insfyl2x = 195, X86insfyl2xp1 = 196,
      X86insmovapd = 197, X86insmovaps = 198, X86insorpd = 199,
      X86insorps = 200, X86insvmovapd = 201, X86insvmovaps = 202,
      X86insxorpd = 203, X86insxorps = 204, X86insgetsec = 205,
      X86inshaddpd = 206, X86inshaddps = 207, X86inshlt = 208,
      X86inshsubpd = 209, X86inshsubps = 210, X86insidiv = 211,
      X86insfild = 212, X86insimul = 213, X86insin = 214, X86insinc = 215,
      X86insinsb = 216, X86insinsertps = 217, X86insinsertq = 218,
      X86insinsd = 219, X86insinsw = 220, X86insint = 221, X86insint1 = 222,
      X86insint3 = 223, X86insinto = 224, X86insinvd = 225, X86insinvept = 226,
      X86insinvlpg = 227, X86insinvlpga = 228, X86insinvpcid = 229,
      X86insinvvpid = 230, X86insiret = 231, X86insiretd = 232,
      X86insiretq = 233, X86insfisttp = 234, X86insfist = 235,
      X86insfistp = 236, X86insucomisd = 237, X86insucomiss = 238,
      X86insvcomisd = 239, X86insvcomiss = 240, X86insvcvtsd2ss = 241,
      X86insvcvtsi2sd = 242, X86insvcvtsi2ss = 243, X86insvcvtss2sd = 244,
      X86insvcvttsd2si = 245, X86insvcvttsd2usi = 246, X86insvcvttss2si = 247,
      X86insvcvttss2usi = 248, X86insvcvtusi2sd = 249, X86insvcvtusi2ss = 250,
      X86insvucomisd = 251, X86insvucomiss = 252, X86insjae = 253,
      X86insja = 254, X86insjbe = 255, X86insjb = 256, X86insjcxz = 257,
      X86insjecxz = 258, X86insje = 259, X86insjge = 260, X86insjg = 261,
      X86insjle = 262, X86insjl = 263, X86insjmp = 264, X86insjne = 265,
      X86insjno = 266, X86insjnp = 267, X86insjns = 268, X86insjo = 269,
      X86insjp = 270, X86insjrcxz = 271, X86insjs = 272, X86inskandb = 273,
      X86inskandd = 274, X86inskandnb = 275, X86inskandnd = 276,
      X86inskandnq = 277, X86inskandnw = 278, X86inskandq = 279,
      X86inskandw = 280, X86inskmovb = 281, X86inskmovd = 282,
      X86inskmovq = 283, X86inskmovw = 284, X86insknotb = 285,
      X86insknotd = 286, X86insknotq = 287, X86insknotw = 288, X86inskorb = 289,
      X86inskord = 290, X86inskorq = 291, X86inskortestb = 292,
      X86inskortestd = 293, X86inskortestq = 294, X86inskortestw = 295,
      X86inskorw = 296, X86inskshiftlb = 297, X86inskshiftld = 298,
      X86inskshiftlq = 299, X86inskshiftlw = 300, X86inskshiftrb = 301,
      X86inskshiftrd = 302, X86inskshiftrq = 303, X86inskshiftrw = 304,
      X86inskunpckbw = 305, X86inskxnorb = 306, X86inskxnord = 307,
      X86inskxnorq = 308, X86inskxnorw = 309, X86inskxorb = 310,
      X86inskxord = 311, X86inskxorq = 312, X86inskxorw = 313, X86inslahf = 314,
      X86inslar = 315, X86inslddqu = 316, X86insldmxcsr = 317, X86inslds = 318,
      X86insfldz = 319, X86insfld1 = 320, X86insfld = 321, X86inslea = 322,
      X86insleave = 323, X86insles = 324, X86inslfence = 325, X86inslfs = 326,
      X86inslgdt = 327, X86inslgs = 328, X86inslidt = 329, X86inslldt = 330,
      X86inslmsw = 331, X86insor = 332, X86inssub = 333, X86insxor = 334,
      X86inslodsb = 335, X86inslodsd = 336, X86inslodsq = 337,
      X86inslodsw = 338, X86insloop = 339, X86insloope = 340,
      X86insloopne = 341, X86insretf = 342, X86insretfq = 343, X86inslsl = 344,
      X86inslss = 345, X86insltr = 346, X86insxadd = 347, X86inslzcnt = 348,
      X86insmaskmovdqu = 349, X86insmaxpd = 350, X86insmaxps = 351,
      X86insmaxsd = 352, X86insmaxss = 353, X86insmfence = 354,
      X86insminpd = 355, X86insminps = 356, X86insminsd = 357,
      X86insminss = 358, X86inscvtpd2pi = 359, X86inscvtpi2pd = 360,
      X86inscvtpi2ps = 361, X86inscvtps2pi = 362, X86inscvttpd2pi = 363,
      X86inscvttps2pi = 364, X86insemms = 365, X86insmaskmovq = 366,
      X86insmovd = 367, X86insmovdq2q = 368, X86insmovntq = 369,
      X86insmovq2dq = 370, X86insmovq = 371, X86inspabsb = 372,
      X86inspabsd = 373, X86inspabsw = 374, X86inspackssdw = 375,
      X86inspacksswb = 376, X86inspackuswb = 377, X86inspaddb = 378,
      X86inspaddd = 379, X86inspaddq = 380, X86inspaddsb = 381,
      X86inspaddsw = 382, X86inspaddusb = 383, X86inspaddusw = 384,
      X86inspaddw = 385, X86inspalignr = 386, X86inspandn = 387,
      X86inspand = 388, X86inspavgb = 389, X86inspavgw = 390,
      X86inspcmpeqb = 391, X86inspcmpeqd = 392, X86inspcmpeqw = 393,
      X86inspcmpgtb = 394, X86inspcmpgtd = 395, X86inspcmpgtw = 396,
      X86inspextrw = 397, X86insphaddsw = 398, X86insphaddw = 399,
      X86insphaddd = 400, X86insphsubd = 401, X86insphsubsw = 402,
      X86insphsubw = 403, X86inspinsrw = 404, X86inspmaddubsw = 405,
      X86inspmaddwd = 406, X86inspmaxsw = 407, X86inspmaxub = 408,
      X86inspminsw = 409, X86inspminub = 410, X86inspmovmskb = 411,
      X86inspmulhrsw = 412, X86inspmulhuw = 413, X86inspmulhw = 414,
      X86inspmullw = 415, X86inspmuludq = 416, X86inspor = 417,
      X86inspsadbw = 418, X86inspshufb = 419, X86inspshufw = 420,
      X86inspsignb = 421, X86inspsignd = 422, X86inspsignw = 423,
      X86inspslld = 424, X86inspsllq = 425, X86inspsllw = 426,
      X86inspsrad = 427, X86inspsraw = 428, X86inspsrld = 429,
      X86inspsrlq = 430, X86inspsrlw = 431, X86inspsubb = 432,
      X86inspsubd = 433, X86inspsubq = 434, X86inspsubsb = 435,
      X86inspsubsw = 436, X86inspsubusb = 437, X86inspsubusw = 438,
      X86inspsubw = 439, X86inspunpckhbw = 440, X86inspunpckhdq = 441,
      X86inspunpckhwd = 442, X86inspunpcklbw = 443, X86inspunpckldq = 444,
      X86inspunpcklwd = 445, X86inspxor = 446, X86insmonitor = 447,
      X86insmontmul = 448, X86insmov = 449, X86insmovabs = 450,
      X86insmovbe = 451, X86insmovddup = 452, X86insmovdqa = 453,
      X86insmovdqu = 454, X86insmovhlps = 455, X86insmovhpd = 456,
      X86insmovhps = 457, X86insmovlhps = 458, X86insmovlpd = 459,
      X86insmovlps = 460, X86insmovmskpd = 461, X86insmovmskps = 462,
      X86insmovntdqa = 463, X86insmovntdq = 464, X86insmovnti = 465,
      X86insmovntpd = 466, X86insmovntps = 467, X86insmovntsd = 468,
      X86insmovntss = 469, X86insmovsb = 470, X86insmovsd = 471,
      X86insmovshdup = 472, X86insmovsldup = 473, X86insmovsq = 474,
      X86insmovss = 475, X86insmovsw = 476, X86insmovsx = 477,
      X86insmovsxd = 478, X86insmovupd = 479, X86insmovups = 480,
      X86insmovzx = 481, X86insmpsadbw = 482, X86insmul = 483,
      X86insmulpd = 484, X86insmulps = 485, X86insmulsd = 486,
      X86insmulss = 487, X86insmulx = 488, X86insfmul = 489, X86insfimul = 490,
      X86insfmulp = 491, X86insmwait = 492, X86insneg = 493, X86insnop = 494,
      X86insnot = 495, X86insout = 496, X86insoutsb = 497, X86insoutsd = 498,
      X86insoutsw = 499, X86inspackusdw = 500, X86inspause = 501,
      X86inspavgusb = 502, X86inspblendvb = 503, X86inspblendw = 504,
      X86inspclmulqdq = 505, X86inspcmpeqq = 506, X86inspcmpestri = 507,
      X86inspcmpestrm = 508, X86inspcmpgtq = 509, X86inspcmpistri = 510,
      X86inspcmpistrm = 511, X86inspcommit = 512, X86inspdep = 513,
      X86inspext = 514, X86inspextrb = 515, X86inspextrd = 516,
      X86inspextrq = 517, X86inspf2id = 518, X86inspf2iw = 519,
      X86inspfacc = 520, X86inspfadd = 521, X86inspfcmpeq = 522,
      X86inspfcmpge = 523, X86inspfcmpgt = 524, X86inspfmax = 525,
      X86inspfmin = 526, X86inspfmul = 527, X86inspfnacc = 528,
      X86inspfpnacc = 529, X86inspfrcpit1 = 530, X86inspfrcpit2 = 531,
      X86inspfrcp = 532, X86inspfrsqit1 = 533, X86inspfrsqrt = 534,
      X86inspfsubr = 535, X86inspfsub = 536, X86insphminposuw = 537,
      X86inspi2fd = 538, X86inspi2fw = 539, X86inspinsrb = 540,
      X86inspinsrd = 541, X86inspinsrq = 542, X86inspmaxsb = 543,
      X86inspmaxsd = 544, X86inspmaxud = 545, X86inspmaxuw = 546,
      X86inspminsb = 547, X86inspminsd = 548, X86inspminud = 549,
      X86inspminuw = 550, X86inspmovsxbd = 551, X86inspmovsxbq = 552,
      X86inspmovsxbw = 553, X86inspmovsxdq = 554, X86inspmovsxwd = 555,
      X86inspmovsxwq = 556, X86inspmovzxbd = 557, X86inspmovzxbq = 558,
      X86inspmovzxbw = 559, X86inspmovzxdq = 560, X86inspmovzxwd = 561,
      X86inspmovzxwq = 562, X86inspmuldq = 563, X86inspmulhrw = 564,
      X86inspmulld = 565, X86inspop = 566, X86inspopaw = 567, X86inspopal = 568,
      X86inspopcnt = 569, X86inspopf = 570, X86inspopfd = 571,
      X86inspopfq = 572, X86insprefetch = 573, X86insprefetchnta = 574,
      X86insprefetcht0 = 575, X86insprefetcht1 = 576, X86insprefetcht2 = 577,
      X86insprefetchw = 578, X86inspshufd = 579, X86inspshufhw = 580,
      X86inspshuflw = 581, X86inspslldq = 582, X86inspsrldq = 583,
      X86inspswapd = 584, X86insptest = 585, X86inspunpckhqdq = 586,
      X86inspunpcklqdq = 587, X86inspush = 588, X86inspushaw = 589,
      X86inspushal = 590, X86inspushf = 591, X86inspushfd = 592,
      X86inspushfq = 593, X86insrcl = 594, X86insrcpps = 595, X86insrcpss = 596,
      X86insrcr = 597, X86insrdfsbase = 598, X86insrdgsbase = 599,
      X86insrdmsr = 600, X86insrdpmc = 601, X86insrdrand = 602,
      X86insrdseed = 603, X86insrdtsc = 604, X86insrdtscp = 605,
      X86insrol = 606, X86insror = 607, X86insrorx = 608, X86insroundpd = 609,
      X86insroundps = 610, X86insroundsd = 611, X86insroundss = 612,
      X86insrsm = 613, X86insrsqrtps = 614, X86insrsqrtss = 615,
      X86inssahf = 616, X86inssal = 617, X86inssalc = 618, X86inssar = 619,
      X86inssarx = 620, X86inssbb = 621, X86insscasb = 622, X86insscasd = 623,
      X86insscasq = 624, X86insscasw = 625, X86inssetae = 626, X86insseta = 627,
      X86inssetbe = 628, X86inssetb = 629, X86inssete = 630, X86inssetge = 631,
      X86inssetg = 632, X86inssetle = 633, X86inssetl = 634, X86inssetne = 635,
      X86inssetno = 636, X86inssetnp = 637, X86inssetns = 638, X86insseto = 639,
      X86inssetp = 640, X86inssets = 641, X86inssfence = 642, X86inssgdt = 643,
      X86inssha1msg1 = 644, X86inssha1msg2 = 645, X86inssha1nexte = 646,
      X86inssha1rnds4 = 647, X86inssha256msg1 = 648, X86inssha256msg2 = 649,
      X86inssha256rnds2 = 650, X86insshl = 651, X86insshld = 652,
      X86insshlx = 653, X86insshr = 654, X86insshrd = 655, X86insshrx = 656,
      X86insshufpd = 657, X86insshufps = 658, X86inssidt = 659,
      X86insfsin = 660, X86insskinit = 661, X86inssldt = 662, X86inssmsw = 663,
      X86inssqrtpd = 664, X86inssqrtps = 665, X86inssqrtsd = 666,
      X86inssqrtss = 667, X86insfsqrt = 668, X86insstac = 669, X86insstc = 670,
      X86insstd = 671, X86insstgi = 672, X86inssti = 673, X86insstmxcsr = 674,
      X86insstosb = 675, X86insstosd = 676, X86insstosq = 677,
      X86insstosw = 678, X86insstr = 679, X86insfst = 680, X86insfstp = 681,
      X86insfstpnce = 682, X86insfxch = 683, X86inssubpd = 684,
      X86inssubps = 685, X86insfsubr = 686, X86insfisubr = 687,
      X86insfsubrp = 688, X86inssubsd = 689, X86inssubss = 690,
      X86insfsub = 691, X86insfisub = 692, X86insfsubp = 693,
      X86insswapgs = 694, X86inssyscall = 695, X86inssysenter = 696,
      X86inssysexit = 697, X86inssysret = 698, X86inst1mskc = 699,
      X86instest = 700, X86insud2 = 701, X86insftst = 702, X86instzcnt = 703,
      X86instzmsk = 704, X86insfucomip = 705, X86insfucomi = 706,
      X86insfucompp = 707, X86insfucomp = 708, X86insfucom = 709,
      X86insud2b = 710, X86insunpckhpd = 711, X86insunpckhps = 712,
      X86insunpcklpd = 713, X86insunpcklps = 714, X86insvaddpd = 715,
      X86insvaddps = 716, X86insvaddsd = 717, X86insvaddss = 718,
      X86insvaddsubpd = 719, X86insvaddsubps = 720, X86insvaesdeclast = 721,
      X86insvaesdec = 722, X86insvaesenclast = 723, X86insvaesenc = 724,
      X86insvaesimc = 725, X86insvaeskeygenassist = 726, X86insvalignd = 727,
      X86insvalignq = 728, X86insvandnpd = 729, X86insvandnps = 730,
      X86insvandpd = 731, X86insvandps = 732, X86insvblendmpd = 733,
      X86insvblendmps = 734, X86insvblendpd = 735, X86insvblendps = 736,
      X86insvblendvpd = 737, X86insvblendvps = 738, X86insvbroadcastf128 = 739,
      X86insvbroadcasti32x4 = 740, X86insvbroadcasti64x4 = 741,
      X86insvbroadcastsd = 742, X86insvbroadcastss = 743,
      X86insvcompresspd = 744, X86insvcompressps = 745, X86insvcvtdq2pd = 746,
      X86insvcvtdq2ps = 747, X86insvcvtpd2dqx = 748, X86insvcvtpd2dq = 749,
      X86insvcvtpd2psx = 750, X86insvcvtpd2ps = 751, X86insvcvtpd2udq = 752,
      X86insvcvtph2ps = 753, X86insvcvtps2dq = 754, X86insvcvtps2pd = 755,
      X86insvcvtps2ph = 756, X86insvcvtps2udq = 757, X86insvcvtsd2si = 758,
      X86insvcvtsd2usi = 759, X86insvcvtss2si = 760, X86insvcvtss2usi = 761,
      X86insvcvttpd2dqx = 762, X86insvcvttpd2dq = 763, X86insvcvttpd2udq = 764,
      X86insvcvttps2dq = 765, X86insvcvttps2udq = 766, X86insvcvtudq2pd = 767,
      X86insvcvtudq2ps = 768, X86insvdivpd = 769, X86insvdivps = 770,
      X86insvdivsd = 771, X86insvdivss = 772, X86insvdppd = 773,
      X86insvdpps = 774, X86insverr = 775, X86insverw = 776,
      X86insvexp2pd = 777, X86insvexp2ps = 778, X86insvexpandpd = 779,
      X86insvexpandps = 780, X86insvextractf128 = 781,
      X86insvextractf32x4 = 782, X86insvextractf64x4 = 783,
      X86insvextracti128 = 784, X86insvextracti32x4 = 785,
      X86insvextracti64x4 = 786, X86insvextractps = 787,
      X86insvfmadd132pd = 788, X86insvfmadd132ps = 789, X86insvfmaddpd = 790,
      X86insvfmadd213pd = 791, X86insvfmadd231pd = 792, X86insvfmaddps = 793,
      X86insvfmadd213ps = 794, X86insvfmadd231ps = 795, X86insvfmaddsd = 796,
      X86insvfmadd213sd = 797, X86insvfmadd132sd = 798, X86insvfmadd231sd = 799,
      X86insvfmaddss = 800, X86insvfmadd213ss = 801, X86insvfmadd132ss = 802,
      X86insvfmadd231ss = 803, X86insvfmaddsub132pd = 804,
      X86insvfmaddsub132ps = 805, X86insvfmaddsubpd = 806,
      X86insvfmaddsub213pd = 807, X86insvfmaddsub231pd = 808,
      X86insvfmaddsubps = 809, X86insvfmaddsub213ps = 810,
      X86insvfmaddsub231ps = 811, X86insvfmsub132pd = 812,
      X86insvfmsub132ps = 813, X86insvfmsubadd132pd = 814,
      X86insvfmsubadd132ps = 815, X86insvfmsubaddpd = 816,
      X86insvfmsubadd213pd = 817, X86insvfmsubadd231pd = 818,
      X86insvfmsubaddps = 819, X86insvfmsubadd213ps = 820,
      X86insvfmsubadd231ps = 821, X86insvfmsubpd = 822, X86insvfmsub213pd = 823,
      X86insvfmsub231pd = 824, X86insvfmsubps = 825, X86insvfmsub213ps = 826,
      X86insvfmsub231ps = 827, X86insvfmsubsd = 828, X86insvfmsub213sd = 829,
      X86insvfmsub132sd = 830, X86insvfmsub231sd = 831, X86insvfmsubss = 832,
      X86insvfmsub213ss = 833, X86insvfmsub132ss = 834, X86insvfmsub231ss = 835,
      X86insvfnmadd132pd = 836, X86insvfnmadd132ps = 837, X86insvfnmaddpd = 838,
      X86insvfnmadd213pd = 839, X86insvfnmadd231pd = 840, X86insvfnmaddps = 841,
      X86insvfnmadd213ps = 842, X86insvfnmadd231ps = 843, X86insvfnmaddsd = 844,
      X86insvfnmadd213sd = 845, X86insvfnmadd132sd = 846,
      X86insvfnmadd231sd = 847, X86insvfnmaddss = 848, X86insvfnmadd213ss = 849,
      X86insvfnmadd132ss = 850, X86insvfnmadd231ss = 851,
      X86insvfnmsub132pd = 852, X86insvfnmsub132ps = 853, X86insvfnmsubpd = 854,
      X86insvfnmsub213pd = 855, X86insvfnmsub231pd = 856, X86insvfnmsubps = 857,
      X86insvfnmsub213ps = 858, X86insvfnmsub231ps = 859, X86insvfnmsubsd = 860,
      X86insvfnmsub213sd = 861, X86insvfnmsub132sd = 862,
      X86insvfnmsub231sd = 863, X86insvfnmsubss = 864, X86insvfnmsub213ss = 865,
      X86insvfnmsub132ss = 866, X86insvfnmsub231ss = 867, X86insvfrczpd = 868,
      X86insvfrczps = 869, X86insvfrczsd = 870, X86insvfrczss = 871,
      X86insvorpd = 872, X86insvorps = 873, X86insvxorpd = 874,
      X86insvxorps = 875, X86insvgatherdpd = 876, X86insvgatherdps = 877,
      X86insvgatherpf0dpd = 878, X86insvgatherpf0dps = 879,
      X86insvgatherpf0qpd = 880, X86insvgatherpf0qps = 881,
      X86insvgatherpf1dpd = 882, X86insvgatherpf1dps = 883,
      X86insvgatherpf1qpd = 884, X86insvgatherpf1qps = 885,
      X86insvgatherqpd = 886, X86insvgatherqps = 887, X86insvhaddpd = 888,
      X86insvhaddps = 889, X86insvhsubpd = 890, X86insvhsubps = 891,
      X86insvinsertf128 = 892, X86insvinsertf32x4 = 893,
      X86insvinsertf32x8 = 894, X86insvinsertf64x2 = 895,
      X86insvinsertf64x4 = 896, X86insvinserti128 = 897,
      X86insvinserti32x4 = 898, X86insvinserti32x8 = 899,
      X86insvinserti64x2 = 900, X86insvinserti64x4 = 901, X86insvinsertps = 902,
      X86insvlddqu = 903, X86insvldmxcsr = 904, X86insvmaskmovdqu = 905,
      X86insvmaskmovpd = 906, X86insvmaskmovps = 907, X86insvmaxpd = 908,
      X86insvmaxps = 909, X86insvmaxsd = 910, X86insvmaxss = 911,
      X86insvmcall = 912, X86insvmclear = 913, X86insvmfunc = 914,
      X86insvminpd = 915, X86insvminps = 916, X86insvminsd = 917,
      X86insvminss = 918, X86insvmlaunch = 919, X86insvmload = 920,
      X86insvmmcall = 921, X86insvmovq = 922, X86insvmovddup = 923,
      X86insvmovd = 924, X86insvmovdqa32 = 925, X86insvmovdqa64 = 926,
      X86insvmovdqa = 927, X86insvmovdqu16 = 928, X86insvmovdqu32 = 929,
      X86insvmovdqu64 = 930, X86insvmovdqu8 = 931, X86insvmovdqu = 932,
      X86insvmovhlps = 933, X86insvmovhpd = 934, X86insvmovhps = 935,
      X86insvmovlhps = 936, X86insvmovlpd = 937, X86insvmovlps = 938,
      X86insvmovmskpd = 939, X86insvmovmskps = 940, X86insvmovntdqa = 941,
      X86insvmovntdq = 942, X86insvmovntpd = 943, X86insvmovntps = 944,
      X86insvmovsd = 945, X86insvmovshdup = 946, X86insvmovsldup = 947,
      X86insvmovss = 948, X86insvmovupd = 949, X86insvmovups = 950,
      X86insvmpsadbw = 951, X86insvmptrld = 952, X86insvmptrst = 953,
      X86insvmread = 954, X86insvmresume = 955, X86insvmrun = 956,
      X86insvmsave = 957, X86insvmulpd = 958, X86insvmulps = 959,
      X86insvmulsd = 960, X86insvmulss = 961, X86insvmwrite = 962,
      X86insvmxoff = 963, X86insvmxon = 964, X86insvpabsb = 965,
      X86insvpabsd = 966, X86insvpabsq = 967, X86insvpabsw = 968,
      X86insvpackssdw = 969, X86insvpacksswb = 970, X86insvpackusdw = 971,
      X86insvpackuswb = 972, X86insvpaddb = 973, X86insvpaddd = 974,
      X86insvpaddq = 975, X86insvpaddsb = 976, X86insvpaddsw = 977,
      X86insvpaddusb = 978, X86insvpaddusw = 979, X86insvpaddw = 980,
      X86insvpalignr = 981, X86insvpandd = 982, X86insvpandnd = 983,
      X86insvpandnq = 984, X86insvpandn = 985, X86insvpandq = 986,
      X86insvpand = 987, X86insvpavgb = 988, X86insvpavgw = 989,
      X86insvpblendd = 990, X86insvpblendmb = 991, X86insvpblendmd = 992,
      X86insvpblendmq = 993, X86insvpblendmw = 994, X86insvpblendvb = 995,
      X86insvpblendw = 996, X86insvpbroadcastb = 997, X86insvpbroadcastd = 998,
      X86insvpbroadcastmb2q = 999, X86insvpbroadcastmw2d = 1000,
      X86insvpbroadcastq = 1001, X86insvpbroadcastw = 1002,
      X86insvpclmulqdq = 1003, X86insvpcmov = 1004, X86insvpcmpb = 1005,
      X86insvpcmpd = 1006, X86insvpcmpeqb = 1007, X86insvpcmpeqd = 1008,
      X86insvpcmpeqq = 1009, X86insvpcmpeqw = 1010, X86insvpcmpestri = 1011,
      X86insvpcmpestrm = 1012, X86insvpcmpgtb = 1013, X86insvpcmpgtd = 1014,
      X86insvpcmpgtq = 1015, X86insvpcmpgtw = 1016, X86insvpcmpistri = 1017,
      X86insvpcmpistrm = 1018, X86insvpcmpq = 1019, X86insvpcmpub = 1020,
      X86insvpcmpud = 1021, X86insvpcmpuq = 1022, X86insvpcmpuw = 1023,
      X86insvpcmpw = 1024, X86insvpcomb = 1025, X86insvpcomd = 1026,
      X86insvpcompressd = 1027, X86insvpcompressq = 1028, X86insvpcomq = 1029,
      X86insvpcomub = 1030, X86insvpcomud = 1031, X86insvpcomuq = 1032,
      X86insvpcomuw = 1033, X86insvpcomw = 1034, X86insvpconflictd = 1035,
      X86insvpconflictq = 1036, X86insvperm2f128 = 1037,
      X86insvperm2i128 = 1038, X86insvpermd = 1039, X86insvpermi2d = 1040,
      X86insvpermi2pd = 1041, X86insvpermi2ps = 1042, X86insvpermi2q = 1043,
      X86insvpermil2pd = 1044, X86insvpermil2ps = 1045, X86insvpermilpd = 1046,
      X86insvpermilps = 1047, X86insvpermpd = 1048, X86insvpermps = 1049,
      X86insvpermq = 1050, X86insvpermt2d = 1051, X86insvpermt2pd = 1052,
      X86insvpermt2ps = 1053, X86insvpermt2q = 1054, X86insvpexpandd = 1055,
      X86insvpexpandq = 1056, X86insvpextrb = 1057, X86insvpextrd = 1058,
      X86insvpextrq = 1059, X86insvpextrw = 1060, X86insvpgatherdd = 1061,
      X86insvpgatherdq = 1062, X86insvpgatherqd = 1063, X86insvpgatherqq = 1064,
      X86insvphaddbd = 1065, X86insvphaddbq = 1066, X86insvphaddbw = 1067,
      X86insvphadddq = 1068, X86insvphaddd = 1069, X86insvphaddsw = 1070,
      X86insvphaddubd = 1071, X86insvphaddubq = 1072, X86insvphaddubw = 1073,
      X86insvphaddudq = 1074, X86insvphadduwd = 1075, X86insvphadduwq = 1076,
      X86insvphaddwd = 1077, X86insvphaddwq = 1078, X86insvphaddw = 1079,
      X86insvphminposuw = 1080, X86insvphsubbw = 1081, X86insvphsubdq = 1082,
      X86insvphsubd = 1083, X86insvphsubsw = 1084, X86insvphsubwd = 1085,
      X86insvphsubw = 1086, X86insvpinsrb = 1087, X86insvpinsrd = 1088,
      X86insvpinsrq = 1089, X86insvpinsrw = 1090, X86insvplzcntd = 1091,
      X86insvplzcntq = 1092, X86insvpmacsdd = 1093, X86insvpmacsdqh = 1094,
      X86insvpmacsdql = 1095, X86insvpmacssdd = 1096, X86insvpmacssdqh = 1097,
      X86insvpmacssdql = 1098, X86insvpmacsswd = 1099, X86insvpmacssww = 1100,
      X86insvpmacswd = 1101, X86insvpmacsww = 1102, X86insvpmadcsswd = 1103,
      X86insvpmadcswd = 1104, X86insvpmaddubsw = 1105, X86insvpmaddwd = 1106,
      X86insvpmaskmovd = 1107, X86insvpmaskmovq = 1108, X86insvpmaxsb = 1109,
      X86insvpmaxsd = 1110, X86insvpmaxsq = 1111, X86insvpmaxsw = 1112,
      X86insvpmaxub = 1113, X86insvpmaxud = 1114, X86insvpmaxuq = 1115,
      X86insvpmaxuw = 1116, X86insvpminsb = 1117, X86insvpminsd = 1118,
      X86insvpminsq = 1119, X86insvpminsw = 1120, X86insvpminub = 1121,
      X86insvpminud = 1122, X86insvpminuq = 1123, X86insvpminuw = 1124,
      X86insvpmovdb = 1125, X86insvpmovdw = 1126, X86insvpmovm2b = 1127,
      X86insvpmovm2d = 1128, X86insvpmovm2q = 1129, X86insvpmovm2w = 1130,
      X86insvpmovmskb = 1131, X86insvpmovqb = 1132, X86insvpmovqd = 1133,
      X86insvpmovqw = 1134, X86insvpmovsdb = 1135, X86insvpmovsdw = 1136,
      X86insvpmovsqb = 1137, X86insvpmovsqd = 1138, X86insvpmovsqw = 1139,
      X86insvpmovsxbd = 1140, X86insvpmovsxbq = 1141, X86insvpmovsxbw = 1142,
      X86insvpmovsxdq = 1143, X86insvpmovsxwd = 1144, X86insvpmovsxwq = 1145,
      X86insvpmovusdb = 1146, X86insvpmovusdw = 1147, X86insvpmovusqb = 1148,
      X86insvpmovusqd = 1149, X86insvpmovusqw = 1150, X86insvpmovzxbd = 1151,
      X86insvpmovzxbq = 1152, X86insvpmovzxbw = 1153, X86insvpmovzxdq = 1154,
      X86insvpmovzxwd = 1155, X86insvpmovzxwq = 1156, X86insvpmuldq = 1157,
      X86insvpmulhrsw = 1158, X86insvpmulhuw = 1159, X86insvpmulhw = 1160,
      X86insvpmulld = 1161, X86insvpmullq = 1162, X86insvpmullw = 1163,
      X86insvpmuludq = 1164, X86insvpord = 1165, X86insvporq = 1166,
      X86insvpor = 1167, X86insvpperm = 1168, X86insvprotb = 1169,
      X86insvprotd = 1170, X86insvprotq = 1171, X86insvprotw = 1172,
      X86insvpsadbw = 1173, X86insvpscatterdd = 1174, X86insvpscatterdq = 1175,
      X86insvpscatterqd = 1176, X86insvpscatterqq = 1177, X86insvpshab = 1178,
      X86insvpshad = 1179, X86insvpshaq = 1180, X86insvpshaw = 1181,
      X86insvpshlb = 1182, X86insvpshld = 1183, X86insvpshlq = 1184,
      X86insvpshlw = 1185, X86insvpshufb = 1186, X86insvpshufd = 1187,
      X86insvpshufhw = 1188, X86insvpshuflw = 1189, X86insvpsignb = 1190,
      X86insvpsignd = 1191, X86insvpsignw = 1192, X86insvpslldq = 1193,
      X86insvpslld = 1194, X86insvpsllq = 1195, X86insvpsllvd = 1196,
      X86insvpsllvq = 1197, X86insvpsllw = 1198, X86insvpsrad = 1199,
      X86insvpsraq = 1200, X86insvpsravd = 1201, X86insvpsravq = 1202,
      X86insvpsraw = 1203, X86insvpsrldq = 1204, X86insvpsrld = 1205,
      X86insvpsrlq = 1206, X86insvpsrlvd = 1207, X86insvpsrlvq = 1208,
      X86insvpsrlw = 1209, X86insvpsubb = 1210, X86insvpsubd = 1211,
      X86insvpsubq = 1212, X86insvpsubsb = 1213, X86insvpsubsw = 1214,
      X86insvpsubusb = 1215, X86insvpsubusw = 1216, X86insvpsubw = 1217,
      X86insvptestmd = 1218, X86insvptestmq = 1219, X86insvptestnmd = 1220,
      X86insvptestnmq = 1221, X86insvptest = 1222, X86insvpunpckhbw = 1223,
      X86insvpunpckhdq = 1224, X86insvpunpckhqdq = 1225,
      X86insvpunpckhwd = 1226, X86insvpunpcklbw = 1227, X86insvpunpckldq = 1228,
      X86insvpunpcklqdq = 1229, X86insvpunpcklwd = 1230, X86insvpxord = 1231,
      X86insvpxorq = 1232, X86insvpxor = 1233, X86insvrcp14pd = 1234,
      X86insvrcp14ps = 1235, X86insvrcp14sd = 1236, X86insvrcp14ss = 1237,
      X86insvrcp28pd = 1238, X86insvrcp28ps = 1239, X86insvrcp28sd = 1240,
      X86insvrcp28ss = 1241, X86insvrcpps = 1242, X86insvrcpss = 1243,
      X86insvrndscalepd = 1244, X86insvrndscaleps = 1245,
      X86insvrndscalesd = 1246, X86insvrndscaless = 1247, X86insvroundpd = 1248,
      X86insvroundps = 1249, X86insvroundsd = 1250, X86insvroundss = 1251,
      X86insvrsqrt14pd = 1252, X86insvrsqrt14ps = 1253, X86insvrsqrt14sd = 1254,
      X86insvrsqrt14ss = 1255, X86insvrsqrt28pd = 1256, X86insvrsqrt28ps = 1257,
      X86insvrsqrt28sd = 1258, X86insvrsqrt28ss = 1259, X86insvrsqrtps = 1260,
      X86insvrsqrtss = 1261, X86insvscatterdpd = 1262, X86insvscatterdps = 1263,
      X86insvscatterpf0dpd = 1264, X86insvscatterpf0dps = 1265,
      X86insvscatterpf0qpd = 1266, X86insvscatterpf0qps = 1267,
      X86insvscatterpf1dpd = 1268, X86insvscatterpf1dps = 1269,
      X86insvscatterpf1qpd = 1270, X86insvscatterpf1qps = 1271,
      X86insvscatterqpd = 1272, X86insvscatterqps = 1273, X86insvshufpd = 1274,
      X86insvshufps = 1275, X86insvsqrtpd = 1276, X86insvsqrtps = 1277,
      X86insvsqrtsd = 1278, X86insvsqrtss = 1279, X86insvstmxcsr = 1280,
      X86insvsubpd = 1281, X86insvsubps = 1282, X86insvsubsd = 1283,
      X86insvsubss = 1284, X86insvtestpd = 1285, X86insvtestps = 1286,
      X86insvunpckhpd = 1287, X86insvunpckhps = 1288, X86insvunpcklpd = 1289,
      X86insvunpcklps = 1290, X86insvzeroall = 1291, X86insvzeroupper = 1292,
      X86inswait = 1293, X86inswbinvd = 1294, X86inswrfsbase = 1295,
      X86inswrgsbase = 1296, X86inswrmsr = 1297, X86insxabort = 1298,
      X86insxacquire = 1299, X86insxbegin = 1300, X86insxchg = 1301,
      X86insxcryptcbc = 1302, X86insxcryptcfb = 1303, X86insxcryptctr = 1304,
      X86insxcryptecb = 1305, X86insxcryptofb = 1306, X86insxend = 1307,
      X86insxgetbv = 1308, X86insxlatb = 1309, X86insxrelease = 1310,
      X86insxrstor = 1311, X86insxrstor64 = 1312, X86insxrstors = 1313,
      X86insxrstors64 = 1314, X86insxsave = 1315, X86insxsave64 = 1316,
      X86insxsavec = 1317, X86insxsavec64 = 1318, X86insxsaveopt = 1319,
      X86insxsaveopt64 = 1320, X86insxsaves = 1321, X86insxsaves64 = 1322,
      X86insxsetbv = 1323, X86insxsha1 = 1324, X86insxsha256 = 1325,
      X86insxstore = 1326, X86insxtest = 1327, X86insfdisi8087nop = 1328,
      X86insfeni8087nop = 1329, X86inscmpss = 1330, X86inscmpeqss = 1331,
      X86inscmpltss = 1332, X86inscmpless = 1333, X86inscmpunordss = 1334,
      X86inscmpneqss = 1335, X86inscmpnltss = 1336, X86inscmpnless = 1337,
      X86inscmpordss = 1338, X86inscmpsd = 1339, X86inscmpeqsd = 1340,
      X86inscmpltsd = 1341, X86inscmplesd = 1342, X86inscmpunordsd = 1343,
      X86inscmpneqsd = 1344, X86inscmpnltsd = 1345, X86inscmpnlesd = 1346,
      X86inscmpordsd = 1347, X86inscmpps = 1348, X86inscmpeqps = 1349,
      X86inscmpltps = 1350, X86inscmpleps = 1351, X86inscmpunordps = 1352,
      X86inscmpneqps = 1353, X86inscmpnltps = 1354, X86inscmpnleps = 1355,
      X86inscmpordps = 1356, X86inscmppd = 1357, X86inscmpeqpd = 1358,
      X86inscmpltpd = 1359, X86inscmplepd = 1360, X86inscmpunordpd = 1361,
      X86inscmpneqpd = 1362, X86inscmpnltpd = 1363, X86inscmpnlepd = 1364,
      X86inscmpordpd = 1365, X86insvcmpss = 1366, X86insvcmpeqss = 1367,
      X86insvcmpltss = 1368, X86insvcmpless = 1369, X86insvcmpunordss = 1370,
      X86insvcmpneqss = 1371, X86insvcmpnltss = 1372, X86insvcmpnless = 1373,
      X86insvcmpordss = 1374, X86insvcmpequqss = 1375, X86insvcmpngess = 1376,
      X86insvcmpngtss = 1377, X86insvcmpfalsess = 1378,
      X86insvcmpneqoqss = 1379, X86insvcmpgess = 1380, X86insvcmpgtss = 1381,
      X86insvcmptruess = 1382, X86insvcmpeqosss = 1383, X86insvcmpltoqss = 1384,
      X86insvcmpleoqss = 1385, X86insvcmpunordsss = 1386,
      X86insvcmpnequsss = 1387, X86insvcmpnltuqss = 1388,
      X86insvcmpnleuqss = 1389, X86insvcmpordsss = 1390,
      X86insvcmpequsss = 1391, X86insvcmpngeuqss = 1392,
      X86insvcmpngtuqss = 1393, X86insvcmpfalseosss = 1394,
      X86insvcmpneqosss = 1395, X86insvcmpgeoqss = 1396,
      X86insvcmpgtoqss = 1397, X86insvcmptrueusss = 1398, X86insvcmpsd = 1399,
      X86insvcmpeqsd = 1400, X86insvcmpltsd = 1401, X86insvcmplesd = 1402,
      X86insvcmpunordsd = 1403, X86insvcmpneqsd = 1404, X86insvcmpnltsd = 1405,
      X86insvcmpnlesd = 1406, X86insvcmpordsd = 1407, X86insvcmpequqsd = 1408,
      X86insvcmpngesd = 1409, X86insvcmpngtsd = 1410, X86insvcmpfalsesd = 1411,
      X86insvcmpneqoqsd = 1412, X86insvcmpgesd = 1413, X86insvcmpgtsd = 1414,
      X86insvcmptruesd = 1415, X86insvcmpeqossd = 1416, X86insvcmpltoqsd = 1417,
      X86insvcmpleoqsd = 1418, X86insvcmpunordssd = 1419,
      X86insvcmpnequssd = 1420, X86insvcmpnltuqsd = 1421,
      X86insvcmpnleuqsd = 1422, X86insvcmpordssd = 1423,
      X86insvcmpequssd = 1424, X86insvcmpngeuqsd = 1425,
      X86insvcmpngtuqsd = 1426, X86insvcmpfalseossd = 1427,
      X86insvcmpneqossd = 1428, X86insvcmpgeoqsd = 1429,
      X86insvcmpgtoqsd = 1430, X86insvcmptrueussd = 1431, X86insvcmpps = 1432,
      X86insvcmpeqps = 1433, X86insvcmpltps = 1434, X86insvcmpleps = 1435,
      X86insvcmpunordps = 1436, X86insvcmpneqps = 1437, X86insvcmpnltps = 1438,
      X86insvcmpnleps = 1439, X86insvcmpordps = 1440, X86insvcmpequqps = 1441,
      X86insvcmpngeps = 1442, X86insvcmpngtps = 1443, X86insvcmpfalseps = 1444,
      X86insvcmpneqoqps = 1445, X86insvcmpgeps = 1446, X86insvcmpgtps = 1447,
      X86insvcmptrueps = 1448, X86insvcmpeqosps = 1449, X86insvcmpltoqps = 1450,
      X86insvcmpleoqps = 1451, X86insvcmpunordsps = 1452,
      X86insvcmpnequsps = 1453, X86insvcmpnltuqps = 1454,
      X86insvcmpnleuqps = 1455, X86insvcmpordsps = 1456,
      X86insvcmpequsps = 1457, X86insvcmpngeuqps = 1458,
      X86insvcmpngtuqps = 1459, X86insvcmpfalseosps = 1460,
      X86insvcmpneqosps = 1461, X86insvcmpgeoqps = 1462,
      X86insvcmpgtoqps = 1463, X86insvcmptrueusps = 1464, X86insvcmppd = 1465,
      X86insvcmpeqpd = 1466, X86insvcmpltpd = 1467, X86insvcmplepd = 1468,
      X86insvcmpunordpd = 1469, X86insvcmpneqpd = 1470, X86insvcmpnltpd = 1471,
      X86insvcmpnlepd = 1472, X86insvcmpordpd = 1473, X86insvcmpequqpd = 1474,
      X86insvcmpngepd = 1475, X86insvcmpngtpd = 1476, X86insvcmpfalsepd = 1477,
      X86insvcmpneqoqpd = 1478, X86insvcmpgepd = 1479, X86insvcmpgtpd = 1480,
      X86insvcmptruepd = 1481, X86insvcmpeqospd = 1482, X86insvcmpltoqpd = 1483,
      X86insvcmpleoqpd = 1484, X86insvcmpunordspd = 1485,
      X86insvcmpnequspd = 1486, X86insvcmpnltuqpd = 1487,
      X86insvcmpnleuqpd = 1488, X86insvcmpordspd = 1489,
      X86insvcmpequspd = 1490, X86insvcmpngeuqpd = 1491,
      X86insvcmpngtuqpd = 1492, X86insvcmpfalseospd = 1493,
      X86insvcmpneqospd = 1494, X86insvcmpgeoqpd = 1495,
      X86insvcmpgtoqpd = 1496, X86insvcmptrueuspd = 1497, X86insud0 = 1498,
      X86insendbr32 = 1499, X86insendbr64 = 1500, X86insending = 1501
else:
  static :
    hint("Declaration of " & "enumx86insn" & " already exists, not redeclaring")
when not declared(enumx86insngroup):
  type
    enumx86insngroup* {.size: sizeof(cuint).} = enum
      X86grpinvalid = 0, X86grpjump = 1, X86grpcall = 2, X86grpret = 3,
      X86grpint = 4, X86grpiret = 5, X86grpprivilege = 6,
      X86grpbranchrelative = 7, X86grpvm = 128, X86grp3dnow = 129,
      X86grpaes = 130, X86grpadx = 131, X86grpavx = 132, X86grpavx2 = 133,
      X86grpavx512 = 134, X86grpbmi = 135, X86grpbmi2 = 136, X86grpcmov = 137,
      X86grpf16c = 138, X86grpfma = 139, X86grpfma4 = 140, X86grpfsgsbase = 141,
      X86grphle = 142, X86grpmmx = 143, X86grpmode32 = 144, X86grpmode64 = 145,
      X86grprtm = 146, X86grpsha = 147, X86grpsse1 = 148, X86grpsse2 = 149,
      X86grpsse3 = 150, X86grpsse41 = 151, X86grpsse42 = 152, X86grpsse4a = 153,
      X86grpssse3 = 154, X86grppclmul = 155, X86grpxop = 156, X86grpcdi = 157,
      X86grperi = 158, X86grptbm = 159, X86grp16bitmode = 160,
      X86grpnot64bitmode = 161, X86grpsgx = 162, X86grpdqi = 163,
      X86grpbwi = 164, X86grppfi = 165, X86grpvlx = 166, X86grpsmap = 167,
      X86grpnovlx = 168, X86grpfpu = 169, X86grpending = 170
else:
  static :
    hint("Declaration of " & "enumx86insngroup" &
        " already exists, not redeclaring")
when not declared(enumxcoreoptype):
  type
    enumxcoreoptype* {.size: sizeof(cuint).} = enum
      Xcoreopinvalid = 0, Xcoreopreg = 1, Xcoreopimm = 2, Xcoreopmem = 3
else:
  static :
    hint("Declaration of " & "enumxcoreoptype" &
        " already exists, not redeclaring")
when not declared(enumxcorereg):
  type
    enumxcorereg* {.size: sizeof(cuint).} = enum
      Xcorereginvalid = 0, Xcoreregcp = 1, Xcoreregdp = 2, Xcorereglr = 3,
      Xcoreregsp = 4, Xcoreregr0 = 5, Xcoreregr1 = 6, Xcoreregr2 = 7,
      Xcoreregr3 = 8, Xcoreregr4 = 9, Xcoreregr5 = 10, Xcoreregr6 = 11,
      Xcoreregr7 = 12, Xcoreregr8 = 13, Xcoreregr9 = 14, Xcoreregr10 = 15,
      Xcoreregr11 = 16, Xcoreregpc = 17, Xcoreregscp = 18, Xcoreregssr = 19,
      Xcorereget = 20, Xcorereged = 21, Xcoreregsed = 22, Xcoreregkep = 23,
      Xcoreregksp = 24, Xcoreregid = 25, Xcoreregending = 26
else:
  static :
    hint("Declaration of " & "enumxcorereg" & " already exists, not redeclaring")
when not declared(enumxcoreinsn):
  type
    enumxcoreinsn* {.size: sizeof(cuint).} = enum
      Xcoreinsinvalid = 0, Xcoreinsadd = 1, Xcoreinsandnot = 2, Xcoreinsand = 3,
      Xcoreinsashr = 4, Xcoreinsbau = 5, Xcoreinsbitrev = 6, Xcoreinsbla = 7,
      Xcoreinsblat = 8, Xcoreinsbl = 9, Xcoreinsbf = 10, Xcoreinsbt = 11,
      Xcoreinsbu = 12, Xcoreinsbru = 13, Xcoreinsbyterev = 14,
      Xcoreinschkct = 15, Xcoreinsclre = 16, Xcoreinsclrpt = 17,
      Xcoreinsclrsr = 18, Xcoreinsclz = 19, Xcoreinscrc8 = 20,
      Xcoreinscrc32 = 21, Xcoreinsdcall = 22, Xcoreinsdentsp = 23,
      Xcoreinsdgetreg = 24, Xcoreinsdivs = 25, Xcoreinsdivu = 26,
      Xcoreinsdrestsp = 27, Xcoreinsdret = 28, Xcoreinsecallf = 29,
      Xcoreinsecallt = 30, Xcoreinsedu = 31, Xcoreinseef = 32, Xcoreinseet = 33,
      Xcoreinseeu = 34, Xcoreinsendin = 35, Xcoreinsentsp = 36, Xcoreinseq = 37,
      Xcoreinsextdp = 38, Xcoreinsextsp = 39, Xcoreinsfreer = 40,
      Xcoreinsfreet = 41, Xcoreinsgetd = 42, Xcoreinsget = 43,
      Xcoreinsgetn = 44, Xcoreinsgetr = 45, Xcoreinsgetsr = 46,
      Xcoreinsgetst = 47, Xcoreinsgetts = 48, Xcoreinsinct = 49,
      Xcoreinsinit = 50, Xcoreinsinpw = 51, Xcoreinsinshr = 52,
      Xcoreinsint = 53, Xcoreinsin = 54, Xcoreinskcall = 55,
      Xcoreinskentsp = 56, Xcoreinskrestsp = 57, Xcoreinskret = 58,
      Xcoreinsladd = 59, Xcoreinsld16s = 60, Xcoreinsld8u = 61,
      Xcoreinslda16 = 62, Xcoreinsldap = 63, Xcoreinsldaw = 64,
      Xcoreinsldc = 65, Xcoreinsldw = 66, Xcoreinsldivu = 67, Xcoreinslmul = 68,
      Xcoreinslss = 69, Xcoreinslsub = 70, Xcoreinslsu = 71, Xcoreinsmaccs = 72,
      Xcoreinsmaccu = 73, Xcoreinsmjoin = 74, Xcoreinsmkmsk = 75,
      Xcoreinsmsync = 76, Xcoreinsmul = 77, Xcoreinsneg = 78, Xcoreinsnot = 79,
      Xcoreinsor = 80, Xcoreinsoutct = 81, Xcoreinsoutpw = 82,
      Xcoreinsoutshr = 83, Xcoreinsoutt = 84, Xcoreinsout = 85,
      Xcoreinspeek = 86, Xcoreinsrems = 87, Xcoreinsremu = 88,
      Xcoreinsretsp = 89, Xcoreinssetclk = 90, Xcoreinsset = 91,
      Xcoreinssetc = 92, Xcoreinssetd = 93, Xcoreinssetev = 94,
      Xcoreinssetn = 95, Xcoreinssetpsc = 96, Xcoreinssetpt = 97,
      Xcoreinssetrdy = 98, Xcoreinssetsr = 99, Xcoreinssettw = 100,
      Xcoreinssetv = 101, Xcoreinssext = 102, Xcoreinsshl = 103,
      Xcoreinsshr = 104, Xcoreinsssync = 105, Xcoreinsst16 = 106,
      Xcoreinsst8 = 107, Xcoreinsstw = 108, Xcoreinssub = 109,
      Xcoreinssyncr = 110, Xcoreinstestct = 111, Xcoreinstestlcl = 112,
      Xcoreinstestwct = 113, Xcoreinstsetmr = 114, Xcoreinsstart = 115,
      Xcoreinswaitef = 116, Xcoreinswaitet = 117, Xcoreinswaiteu = 118,
      Xcoreinsxor = 119, Xcoreinszext = 120, Xcoreinsending = 121
else:
  static :
    hint("Declaration of " & "enumxcoreinsn" &
        " already exists, not redeclaring")
when not declared(enumxcoreinsngroup):
  type
    enumxcoreinsngroup* {.size: sizeof(cuint).} = enum
      Xcoregrpinvalid = 0, Xcoregrpjump = 1, Xcoregrpending = 2
else:
  static :
    hint("Declaration of " & "enumxcoreinsngroup" &
        " already exists, not redeclaring")
when not declared(enumtms320c64xoptype):
  type
    enumtms320c64xoptype* {.size: sizeof(cuint).} = enum
      Tms320c64xopinvalid = 0, Tms320c64xopreg = 1, Tms320c64xopimm = 2,
      Tms320c64xopmem = 3, Tms320c64xopregpair = 64
else:
  static :
    hint("Declaration of " & "enumtms320c64xoptype" &
        " already exists, not redeclaring")
when not declared(enumtms320c64xmemdisp):
  type
    enumtms320c64xmemdisp* {.size: sizeof(cuint).} = enum
      Tms320c64xmemdispinvalid = 0, Tms320c64xmemdispconstant = 1,
      Tms320c64xmemdispregister = 2
else:
  static :
    hint("Declaration of " & "enumtms320c64xmemdisp" &
        " already exists, not redeclaring")
when not declared(enumtms320c64xmemdir):
  type
    enumtms320c64xmemdir* {.size: sizeof(cuint).} = enum
      Tms320c64xmemdirinvalid = 0, Tms320c64xmemdirfw = 1,
      Tms320c64xmemdirbw = 2
else:
  static :
    hint("Declaration of " & "enumtms320c64xmemdir" &
        " already exists, not redeclaring")
when not declared(enumtms320c64xmemmod):
  type
    enumtms320c64xmemmod* {.size: sizeof(cuint).} = enum
      Tms320c64xmemmodinvalid = 0, Tms320c64xmemmodno = 1,
      Tms320c64xmemmodpre = 2, Tms320c64xmemmodpost = 3
else:
  static :
    hint("Declaration of " & "enumtms320c64xmemmod" &
        " already exists, not redeclaring")
when not declared(enumtms320c64xreg):
  type
    enumtms320c64xreg* {.size: sizeof(cuint).} = enum
      Tms320c64xreginvalid = 0, Tms320c64xregamr = 1, Tms320c64xregcsr = 2,
      Tms320c64xregdier = 3, Tms320c64xregdnum = 4, Tms320c64xregecr = 5,
      Tms320c64xreggfpgfr = 6, Tms320c64xreggplya = 7, Tms320c64xreggplyb = 8,
      Tms320c64xregicr = 9, Tms320c64xregier = 10, Tms320c64xregierr = 11,
      Tms320c64xregilc = 12, Tms320c64xregirp = 13, Tms320c64xregisr = 14,
      Tms320c64xregistp = 15, Tms320c64xregitsr = 16, Tms320c64xregnrp = 17,
      Tms320c64xregntsr = 18, Tms320c64xregrep = 19, Tms320c64xregrilc = 20,
      Tms320c64xregssr = 21, Tms320c64xregtsch = 22, Tms320c64xregtscl = 23,
      Tms320c64xregtsr = 24, Tms320c64xrega0 = 25, Tms320c64xrega1 = 26,
      Tms320c64xrega2 = 27, Tms320c64xrega3 = 28, Tms320c64xrega4 = 29,
      Tms320c64xrega5 = 30, Tms320c64xrega6 = 31, Tms320c64xrega7 = 32,
      Tms320c64xrega8 = 33, Tms320c64xrega9 = 34, Tms320c64xrega10 = 35,
      Tms320c64xrega11 = 36, Tms320c64xrega12 = 37, Tms320c64xrega13 = 38,
      Tms320c64xrega14 = 39, Tms320c64xrega15 = 40, Tms320c64xrega16 = 41,
      Tms320c64xrega17 = 42, Tms320c64xrega18 = 43, Tms320c64xrega19 = 44,
      Tms320c64xrega20 = 45, Tms320c64xrega21 = 46, Tms320c64xrega22 = 47,
      Tms320c64xrega23 = 48, Tms320c64xrega24 = 49, Tms320c64xrega25 = 50,
      Tms320c64xrega26 = 51, Tms320c64xrega27 = 52, Tms320c64xrega28 = 53,
      Tms320c64xrega29 = 54, Tms320c64xrega30 = 55, Tms320c64xrega31 = 56,
      Tms320c64xregb0 = 57, Tms320c64xregb1 = 58, Tms320c64xregb2 = 59,
      Tms320c64xregb3 = 60, Tms320c64xregb4 = 61, Tms320c64xregb5 = 62,
      Tms320c64xregb6 = 63, Tms320c64xregb7 = 64, Tms320c64xregb8 = 65,
      Tms320c64xregb9 = 66, Tms320c64xregb10 = 67, Tms320c64xregb11 = 68,
      Tms320c64xregb12 = 69, Tms320c64xregb13 = 70, Tms320c64xregb14 = 71,
      Tms320c64xregb15 = 72, Tms320c64xregb16 = 73, Tms320c64xregb17 = 74,
      Tms320c64xregb18 = 75, Tms320c64xregb19 = 76, Tms320c64xregb20 = 77,
      Tms320c64xregb21 = 78, Tms320c64xregb22 = 79, Tms320c64xregb23 = 80,
      Tms320c64xregb24 = 81, Tms320c64xregb25 = 82, Tms320c64xregb26 = 83,
      Tms320c64xregb27 = 84, Tms320c64xregb28 = 85, Tms320c64xregb29 = 86,
      Tms320c64xregb30 = 87, Tms320c64xregb31 = 88, Tms320c64xregpce1 = 89,
      Tms320c64xregending = 90
else:
  static :
    hint("Declaration of " & "enumtms320c64xreg" &
        " already exists, not redeclaring")
when not declared(Tms320c64xregefr):
  const
    Tms320c64xregefr* = enumtms320c64xreg.Tms320c64xregecr
else:
  static :
    hint("Declaration of " & "Tms320c64xregefr" &
        " already exists, not redeclaring")
when not declared(Tms320c64xregifr):
  const
    Tms320c64xregifr* = enumtms320c64xreg.Tms320c64xregisr
else:
  static :
    hint("Declaration of " & "Tms320c64xregifr" &
        " already exists, not redeclaring")
when not declared(enumtms320c64xinsn):
  type
    enumtms320c64xinsn* {.size: sizeof(cuint).} = enum
      Tms320c64xinsinvalid = 0, Tms320c64xinsabs = 1, Tms320c64xinsabs2 = 2,
      Tms320c64xinsadd = 3, Tms320c64xinsadd2 = 4, Tms320c64xinsadd4 = 5,
      Tms320c64xinsaddab = 6, Tms320c64xinsaddad = 7, Tms320c64xinsaddah = 8,
      Tms320c64xinsaddaw = 9, Tms320c64xinsaddk = 10, Tms320c64xinsaddkpc = 11,
      Tms320c64xinsaddu = 12, Tms320c64xinsand = 13, Tms320c64xinsandn = 14,
      Tms320c64xinsavg2 = 15, Tms320c64xinsavgu4 = 16, Tms320c64xinsb = 17,
      Tms320c64xinsbdec = 18, Tms320c64xinsbitc4 = 19, Tms320c64xinsbnop = 20,
      Tms320c64xinsbpos = 21, Tms320c64xinsclr = 22, Tms320c64xinscmpeq = 23,
      Tms320c64xinscmpeq2 = 24, Tms320c64xinscmpeq4 = 25,
      Tms320c64xinscmpgt = 26, Tms320c64xinscmpgt2 = 27,
      Tms320c64xinscmpgtu4 = 28, Tms320c64xinscmplt = 29,
      Tms320c64xinscmpltu = 30, Tms320c64xinsdeal = 31, Tms320c64xinsdotp2 = 32,
      Tms320c64xinsdotpn2 = 33, Tms320c64xinsdotpnrsu2 = 34,
      Tms320c64xinsdotprsu2 = 35, Tms320c64xinsdotpsu4 = 36,
      Tms320c64xinsdotpu4 = 37, Tms320c64xinsext = 38, Tms320c64xinsextu = 39,
      Tms320c64xinsgmpgtu = 40, Tms320c64xinsgmpy4 = 41, Tms320c64xinsldb = 42,
      Tms320c64xinsldbu = 43, Tms320c64xinslddw = 44, Tms320c64xinsldh = 45,
      Tms320c64xinsldhu = 46, Tms320c64xinsldndw = 47, Tms320c64xinsldnw = 48,
      Tms320c64xinsldw = 49, Tms320c64xinslmbd = 50, Tms320c64xinsmax2 = 51,
      Tms320c64xinsmaxu4 = 52, Tms320c64xinsmin2 = 53, Tms320c64xinsminu4 = 54,
      Tms320c64xinsmpy = 55, Tms320c64xinsmpy2 = 56, Tms320c64xinsmpyh = 57,
      Tms320c64xinsmpyhi = 58, Tms320c64xinsmpyhir = 59,
      Tms320c64xinsmpyhl = 60, Tms320c64xinsmpyhlu = 61,
      Tms320c64xinsmpyhslu = 62, Tms320c64xinsmpyhsu = 63,
      Tms320c64xinsmpyhu = 64, Tms320c64xinsmpyhuls = 65,
      Tms320c64xinsmpyhus = 66, Tms320c64xinsmpylh = 67,
      Tms320c64xinsmpylhu = 68, Tms320c64xinsmpyli = 69,
      Tms320c64xinsmpylir = 70, Tms320c64xinsmpylshu = 71,
      Tms320c64xinsmpyluhs = 72, Tms320c64xinsmpysu = 73,
      Tms320c64xinsmpysu4 = 74, Tms320c64xinsmpyu = 75, Tms320c64xinsmpyu4 = 76,
      Tms320c64xinsmpyus = 77, Tms320c64xinsmvc = 78, Tms320c64xinsmvd = 79,
      Tms320c64xinsmvk = 80, Tms320c64xinsmvkl = 81, Tms320c64xinsmvklh = 82,
      Tms320c64xinsnop = 83, Tms320c64xinsnorm = 84, Tms320c64xinsor = 85,
      Tms320c64xinspack2 = 86, Tms320c64xinspackh2 = 87,
      Tms320c64xinspackh4 = 88, Tms320c64xinspackhl2 = 89,
      Tms320c64xinspackl4 = 90, Tms320c64xinspacklh2 = 91,
      Tms320c64xinsrotl = 92, Tms320c64xinssadd = 93, Tms320c64xinssadd2 = 94,
      Tms320c64xinssaddu4 = 95, Tms320c64xinssaddus2 = 96,
      Tms320c64xinssat = 97, Tms320c64xinsset = 98, Tms320c64xinsshfl = 99,
      Tms320c64xinsshl = 100, Tms320c64xinsshlmb = 101, Tms320c64xinsshr = 102,
      Tms320c64xinsshr2 = 103, Tms320c64xinsshrmb = 104,
      Tms320c64xinsshru = 105, Tms320c64xinsshru2 = 106,
      Tms320c64xinssmpy = 107, Tms320c64xinssmpy2 = 108,
      Tms320c64xinssmpyh = 109, Tms320c64xinssmpyhl = 110,
      Tms320c64xinssmpylh = 111, Tms320c64xinsspack2 = 112,
      Tms320c64xinsspacku4 = 113, Tms320c64xinssshl = 114,
      Tms320c64xinssshvl = 115, Tms320c64xinssshvr = 116,
      Tms320c64xinsssub = 117, Tms320c64xinsstb = 118, Tms320c64xinsstdw = 119,
      Tms320c64xinssth = 120, Tms320c64xinsstndw = 121, Tms320c64xinsstnw = 122,
      Tms320c64xinsstw = 123, Tms320c64xinssub = 124, Tms320c64xinssub2 = 125,
      Tms320c64xinssub4 = 126, Tms320c64xinssubab = 127,
      Tms320c64xinssubabs4 = 128, Tms320c64xinssubah = 129,
      Tms320c64xinssubaw = 130, Tms320c64xinssubc = 131,
      Tms320c64xinssubu = 132, Tms320c64xinsswap4 = 133,
      Tms320c64xinsunpkhu4 = 134, Tms320c64xinsunpklu4 = 135,
      Tms320c64xinsxor = 136, Tms320c64xinsxpnd2 = 137,
      Tms320c64xinsxpnd4 = 138, Tms320c64xinsidle = 139, Tms320c64xinsmv = 140,
      Tms320c64xinsneg = 141, Tms320c64xinsnot = 142, Tms320c64xinsswap2 = 143,
      Tms320c64xinszero = 144, Tms320c64xinsending = 145
else:
  static :
    hint("Declaration of " & "enumtms320c64xinsn" &
        " already exists, not redeclaring")
when not declared(enumtms320c64xinsngroup):
  type
    enumtms320c64xinsngroup* {.size: sizeof(cuint).} = enum
      Tms320c64xgrpinvalid = 0, Tms320c64xgrpjump = 1,
      Tms320c64xgrpfunitd = 128, Tms320c64xgrpfunitl = 129,
      Tms320c64xgrpfunitm = 130, Tms320c64xgrpfunits = 131,
      Tms320c64xgrpfunitno = 132, Tms320c64xgrpending = 133
else:
  static :
    hint("Declaration of " & "enumtms320c64xinsngroup" &
        " already exists, not redeclaring")
when not declared(enumtms320c64xfunit):
  type
    enumtms320c64xfunit* {.size: sizeof(cuint).} = enum
      Tms320c64xfunitinvalid = 0, Tms320c64xfunitd = 1, Tms320c64xfunitl = 2,
      Tms320c64xfunitm = 3, Tms320c64xfunits = 4, Tms320c64xfunitno = 5
else:
  static :
    hint("Declaration of " & "enumtms320c64xfunit" &
        " already exists, not redeclaring")
when not declared(enumm680xreg):
  type
    enumm680xreg* {.size: sizeof(cuint).} = enum
      M680xreginvalid = 0, M680xrega = 1, M680xregb = 2, M680xrege = 3,
      M680xregf = 4, M680xreg0 = 5, M680xregd = 6, M680xregw = 7,
      M680xregcc = 8, M680xregdp = 9, M680xregmd = 10, M680xreghx = 11,
      M680xregh = 12, M680xregx = 13, M680xregy = 14, M680xregs = 15,
      M680xregu = 16, M680xregv = 17, M680xregq = 18, M680xregpc = 19,
      M680xregtmp2 = 20, M680xregtmp3 = 21, M680xregending = 22
else:
  static :
    hint("Declaration of " & "enumm680xreg" & " already exists, not redeclaring")
when not declared(enumm680xoptype):
  type
    enumm680xoptype* {.size: sizeof(cuint).} = enum
      M680xopinvalid = 0, M680xopregister = 1, M680xopimmediate = 2,
      M680xopindexed = 3, M680xopextended = 4, M680xopdirect = 5,
      M680xoprelative = 6, M680xopconstant = 7
else:
  static :
    hint("Declaration of " & "enumm680xoptype" &
        " already exists, not redeclaring")
when not declared(enumm680xgrouptype):
  type
    enumm680xgrouptype* {.size: sizeof(cuint).} = enum
      M680xgrpinvalid = 0, M680xgrpjump = 1, M680xgrpcall = 2, M680xgrpret = 3,
      M680xgrpint = 4, M680xgrpiret = 5, M680xgrppriv = 6, M680xgrpbrarel = 7,
      M680xgrpending = 8
else:
  static :
    hint("Declaration of " & "enumm680xgrouptype" &
        " already exists, not redeclaring")
when not declared(enumm680xinsn):
  type
    enumm680xinsn* {.size: sizeof(cuint).} = enum
      M680xinsinvld = 0, M680xinsaba = 1, M680xinsabx = 2, M680xinsaby = 3,
      M680xinsadc = 4, M680xinsadca = 5, M680xinsadcb = 6, M680xinsadcd = 7,
      M680xinsadcr = 8, M680xinsadd = 9, M680xinsadda = 10, M680xinsaddb = 11,
      M680xinsaddd = 12, M680xinsadde = 13, M680xinsaddf = 14,
      M680xinsaddr = 15, M680xinsaddw = 16, M680xinsaim = 17, M680xinsais = 18,
      M680xinsaix = 19, M680xinsand = 20, M680xinsanda = 21, M680xinsandb = 22,
      M680xinsandcc = 23, M680xinsandd = 24, M680xinsandr = 25,
      M680xinsasl = 26, M680xinsasla = 27, M680xinsaslb = 28, M680xinsasld = 29,
      M680xinsasr = 30, M680xinsasra = 31, M680xinsasrb = 32, M680xinsasrd = 33,
      M680xinsasrx = 34, M680xinsband = 35, M680xinsbcc = 36, M680xinsbclr = 37,
      M680xinsbcs = 38, M680xinsbeor = 39, M680xinsbeq = 40, M680xinsbge = 41,
      M680xinsbgnd = 42, M680xinsbgt = 43, M680xinsbhcc = 44, M680xinsbhcs = 45,
      M680xinsbhi = 46, M680xinsbiand = 47, M680xinsbieor = 48,
      M680xinsbih = 49, M680xinsbil = 50, M680xinsbior = 51, M680xinsbit = 52,
      M680xinsbita = 53, M680xinsbitb = 54, M680xinsbitd = 55,
      M680xinsbitmd = 56, M680xinsble = 57, M680xinsbls = 58, M680xinsblt = 59,
      M680xinsbmc = 60, M680xinsbmi = 61, M680xinsbms = 62, M680xinsbne = 63,
      M680xinsbor = 64, M680xinsbpl = 65, M680xinsbrclr = 66,
      M680xinsbrset = 67, M680xinsbra = 68, M680xinsbrn = 69, M680xinsbset = 70,
      M680xinsbsr = 71, M680xinsbvc = 72, M680xinsbvs = 73, M680xinscall = 74,
      M680xinscba = 75, M680xinscbeq = 76, M680xinscbeqa = 77,
      M680xinscbeqx = 78, M680xinsclc = 79, M680xinscli = 80, M680xinsclr = 81,
      M680xinsclra = 82, M680xinsclrb = 83, M680xinsclrd = 84,
      M680xinsclre = 85, M680xinsclrf = 86, M680xinsclrh = 87,
      M680xinsclrw = 88, M680xinsclrx = 89, M680xinsclv = 90, M680xinscmp = 91,
      M680xinscmpa = 92, M680xinscmpb = 93, M680xinscmpd = 94,
      M680xinscmpe = 95, M680xinscmpf = 96, M680xinscmpr = 97,
      M680xinscmps = 98, M680xinscmpu = 99, M680xinscmpw = 100,
      M680xinscmpx = 101, M680xinscmpy = 102, M680xinscom = 103,
      M680xinscoma = 104, M680xinscomb = 105, M680xinscomd = 106,
      M680xinscome = 107, M680xinscomf = 108, M680xinscomw = 109,
      M680xinscomx = 110, M680xinscpd = 111, M680xinscphx = 112,
      M680xinscps = 113, M680xinscpx = 114, M680xinscpy = 115,
      M680xinscwai = 116, M680xinsdaa = 117, M680xinsdbeq = 118,
      M680xinsdbne = 119, M680xinsdbnz = 120, M680xinsdbnza = 121,
      M680xinsdbnzx = 122, M680xinsdec = 123, M680xinsdeca = 124,
      M680xinsdecb = 125, M680xinsdecd = 126, M680xinsdece = 127,
      M680xinsdecf = 128, M680xinsdecw = 129, M680xinsdecx = 130,
      M680xinsdes = 131, M680xinsdex = 132, M680xinsdey = 133,
      M680xinsdiv = 134, M680xinsdivd = 135, M680xinsdivq = 136,
      M680xinsediv = 137, M680xinsedivs = 138, M680xinseim = 139,
      M680xinsemacs = 140, M680xinsemaxd = 141, M680xinsemaxm = 142,
      M680xinsemind = 143, M680xinseminm = 144, M680xinsemul = 145,
      M680xinsemuls = 146, M680xinseor = 147, M680xinseora = 148,
      M680xinseorb = 149, M680xinseord = 150, M680xinseorr = 151,
      M680xinsetbl = 152, M680xinsexg = 153, M680xinsfdiv = 154,
      M680xinsibeq = 155, M680xinsibne = 156, M680xinsidiv = 157,
      M680xinsidivs = 158, M680xinsillgl = 159, M680xinsinc = 160,
      M680xinsinca = 161, M680xinsincb = 162, M680xinsincd = 163,
      M680xinsince = 164, M680xinsincf = 165, M680xinsincw = 166,
      M680xinsincx = 167, M680xinsins = 168, M680xinsinx = 169,
      M680xinsiny = 170, M680xinsjmp = 171, M680xinsjsr = 172,
      M680xinslbcc = 173, M680xinslbcs = 174, M680xinslbeq = 175,
      M680xinslbge = 176, M680xinslbgt = 177, M680xinslbhi = 178,
      M680xinslble = 179, M680xinslbls = 180, M680xinslblt = 181,
      M680xinslbmi = 182, M680xinslbne = 183, M680xinslbpl = 184,
      M680xinslbra = 185, M680xinslbrn = 186, M680xinslbsr = 187,
      M680xinslbvc = 188, M680xinslbvs = 189, M680xinslda = 190,
      M680xinsldaa = 191, M680xinsldab = 192, M680xinsldb = 193,
      M680xinsldbt = 194, M680xinsldd = 195, M680xinslde = 196,
      M680xinsldf = 197, M680xinsldhx = 198, M680xinsldmd = 199,
      M680xinsldq = 200, M680xinslds = 201, M680xinsldu = 202,
      M680xinsldw = 203, M680xinsldx = 204, M680xinsldy = 205,
      M680xinsleas = 206, M680xinsleau = 207, M680xinsleax = 208,
      M680xinsleay = 209, M680xinslsl = 210, M680xinslsla = 211,
      M680xinslslb = 212, M680xinslsld = 213, M680xinslslx = 214,
      M680xinslsr = 215, M680xinslsra = 216, M680xinslsrb = 217,
      M680xinslsrd = 218, M680xinslsrw = 219, M680xinslsrx = 220,
      M680xinsmaxa = 221, M680xinsmaxm = 222, M680xinsmem = 223,
      M680xinsmina = 224, M680xinsminm = 225, M680xinsmov = 226,
      M680xinsmovb = 227, M680xinsmovw = 228, M680xinsmul = 229,
      M680xinsmuld = 230, M680xinsneg = 231, M680xinsnega = 232,
      M680xinsnegb = 233, M680xinsnegd = 234, M680xinsnegx = 235,
      M680xinsnop = 236, M680xinsnsa = 237, M680xinsoim = 238,
      M680xinsora = 239, M680xinsoraa = 240, M680xinsorab = 241,
      M680xinsorb = 242, M680xinsorcc = 243, M680xinsord = 244,
      M680xinsorr = 245, M680xinspsha = 246, M680xinspshb = 247,
      M680xinspshc = 248, M680xinspshd = 249, M680xinspshh = 250,
      M680xinspshs = 251, M680xinspshsw = 252, M680xinspshu = 253,
      M680xinspshuw = 254, M680xinspshx = 255, M680xinspshy = 256,
      M680xinspula = 257, M680xinspulb = 258, M680xinspulc = 259,
      M680xinspuld = 260, M680xinspulh = 261, M680xinspuls = 262,
      M680xinspulsw = 263, M680xinspulu = 264, M680xinspuluw = 265,
      M680xinspulx = 266, M680xinspuly = 267, M680xinsrev = 268,
      M680xinsrevw = 269, M680xinsrol = 270, M680xinsrola = 271,
      M680xinsrolb = 272, M680xinsrold = 273, M680xinsrolw = 274,
      M680xinsrolx = 275, M680xinsror = 276, M680xinsrora = 277,
      M680xinsrorb = 278, M680xinsrord = 279, M680xinsrorw = 280,
      M680xinsrorx = 281, M680xinsrsp = 282, M680xinsrtc = 283,
      M680xinsrti = 284, M680xinsrts = 285, M680xinssba = 286,
      M680xinssbc = 287, M680xinssbca = 288, M680xinssbcb = 289,
      M680xinssbcd = 290, M680xinssbcr = 291, M680xinssec = 292,
      M680xinssei = 293, M680xinssev = 294, M680xinssex = 295,
      M680xinssexw = 296, M680xinsslp = 297, M680xinssta = 298,
      M680xinsstaa = 299, M680xinsstab = 300, M680xinsstb = 301,
      M680xinsstbt = 302, M680xinsstd = 303, M680xinsste = 304,
      M680xinsstf = 305, M680xinsstop = 306, M680xinssthx = 307,
      M680xinsstq = 308, M680xinssts = 309, M680xinsstu = 310,
      M680xinsstw = 311, M680xinsstx = 312, M680xinssty = 313,
      M680xinssub = 314, M680xinssuba = 315, M680xinssubb = 316,
      M680xinssubd = 317, M680xinssube = 318, M680xinssubf = 319,
      M680xinssubr = 320, M680xinssubw = 321, M680xinsswi = 322,
      M680xinsswi2 = 323, M680xinsswi3 = 324, M680xinssync = 325,
      M680xinstab = 326, M680xinstap = 327, M680xinstax = 328,
      M680xinstba = 329, M680xinstbeq = 330, M680xinstbl = 331,
      M680xinstbne = 332, M680xinstest = 333, M680xinstfm = 334,
      M680xinstfr = 335, M680xinstim = 336, M680xinstpa = 337,
      M680xinstst = 338, M680xinststa = 339, M680xinststb = 340,
      M680xinststd = 341, M680xinstste = 342, M680xinststf = 343,
      M680xinststw = 344, M680xinststx = 345, M680xinstsx = 346,
      M680xinstsy = 347, M680xinstxa = 348, M680xinstxs = 349,
      M680xinstys = 350, M680xinswai = 351, M680xinswait = 352,
      M680xinswav = 353, M680xinswavr = 354, M680xinsxgdx = 355,
      M680xinsxgdy = 356, M680xinsending = 357
else:
  static :
    hint("Declaration of " & "enumm680xinsn" &
        " already exists, not redeclaring")
when not declared(enumevminsn):
  type
    enumevminsn* {.size: sizeof(cuint).} = enum
      Evminsstop = 0, Evminsadd = 1, Evminsmul = 2, Evminssub = 3,
      Evminsdiv = 4, Evminssdiv = 5, Evminsmod = 6, Evminssmod = 7,
      Evminsaddmod = 8, Evminsmulmod = 9, Evminsexp = 10, Evminssignextend = 11,
      Evminslt = 16, Evminsgt = 17, Evminsslt = 18, Evminssgt = 19,
      Evminseq = 20, Evminsiszero = 21, Evminsand = 22, Evminsor = 23,
      Evminsxor = 24, Evminsnot = 25, Evminsbyte = 26, Evminssha3 = 32,
      Evminsaddress = 48, Evminsbalance = 49, Evminsorigin = 50,
      Evminscaller = 51, Evminscallvalue = 52, Evminscalldataload = 53,
      Evminscalldatasize = 54, Evminscalldatacopy = 55, Evminscodesize = 56,
      Evminscodecopy = 57, Evminsgasprice = 58, Evminsextcodesize = 59,
      Evminsextcodecopy = 60, Evminsreturndatasize = 61,
      Evminsreturndatacopy = 62, Evminsblockhash = 64, Evminscoinbase = 65,
      Evminstimestamp = 66, Evminsnumber = 67, Evminsdifficulty = 68,
      Evminsgaslimit = 69, Evminspop = 80, Evminsmload = 81, Evminsmstore = 82,
      Evminsmstore8 = 83, Evminssload = 84, Evminssstore = 85, Evminsjump = 86,
      Evminsjumpi = 87, Evminspc = 88, Evminsmsize = 89, Evminsgas = 90,
      Evminsjumpdest = 91, Evminspush1 = 96, Evminspush2 = 97, Evminspush3 = 98,
      Evminspush4 = 99, Evminspush5 = 100, Evminspush6 = 101, Evminspush7 = 102,
      Evminspush8 = 103, Evminspush9 = 104, Evminspush10 = 105,
      Evminspush11 = 106, Evminspush12 = 107, Evminspush13 = 108,
      Evminspush14 = 109, Evminspush15 = 110, Evminspush16 = 111,
      Evminspush17 = 112, Evminspush18 = 113, Evminspush19 = 114,
      Evminspush20 = 115, Evminspush21 = 116, Evminspush22 = 117,
      Evminspush23 = 118, Evminspush24 = 119, Evminspush25 = 120,
      Evminspush26 = 121, Evminspush27 = 122, Evminspush28 = 123,
      Evminspush29 = 124, Evminspush30 = 125, Evminspush31 = 126,
      Evminspush32 = 127, Evminsdup1 = 128, Evminsdup2 = 129, Evminsdup3 = 130,
      Evminsdup4 = 131, Evminsdup5 = 132, Evminsdup6 = 133, Evminsdup7 = 134,
      Evminsdup8 = 135, Evminsdup9 = 136, Evminsdup10 = 137, Evminsdup11 = 138,
      Evminsdup12 = 139, Evminsdup13 = 140, Evminsdup14 = 141,
      Evminsdup15 = 142, Evminsdup16 = 143, Evminsswap1 = 144,
      Evminsswap2 = 145, Evminsswap3 = 146, Evminsswap4 = 147,
      Evminsswap5 = 148, Evminsswap6 = 149, Evminsswap7 = 150,
      Evminsswap8 = 151, Evminsswap9 = 152, Evminsswap10 = 153,
      Evminsswap11 = 154, Evminsswap12 = 155, Evminsswap13 = 156,
      Evminsswap14 = 157, Evminsswap15 = 158, Evminsswap16 = 159,
      Evminslog0 = 160, Evminslog1 = 161, Evminslog2 = 162, Evminslog3 = 163,
      Evminslog4 = 164, Evminscreate = 240, Evminscall = 241,
      Evminscallcode = 242, Evminsreturn = 243, Evminsdelegatecall = 244,
      Evminscallblackbox = 245, Evminsstaticcall = 250, Evminsrevert = 253,
      Evminssuicide = 255, Evminsinvalid = 512, Evminsending = 513
else:
  static :
    hint("Declaration of " & "enumevminsn" & " already exists, not redeclaring")
when not declared(enumevminsngroup):
  type
    enumevminsngroup* {.size: sizeof(cuint).} = enum
      Evmgrpinvalid = 0, Evmgrpjump = 1, Evmgrpmath = 8, Evmgrpstackwrite = 9,
      Evmgrpstackread = 10, Evmgrpmemwrite = 11, Evmgrpmemread = 12,
      Evmgrpstorewrite = 13, Evmgrpstoreread = 14, Evmgrphalt = 15,
      Evmgrpending = 16
else:
  static :
    hint("Declaration of " & "enumevminsngroup" &
        " already exists, not redeclaring")
when not declared(enumcserr):
  type
    enumcserr* {.size: sizeof(cuint).} = enum
      Cserrok = 0, Cserrmem = 1, Cserrarch = 2, Cserrhandle = 3, Cserrcsh = 4,
      Cserrmode = 5, Cserroption = 6, Cserrdetail = 7, Cserrmemsetup = 8,
      Cserrversion = 9, Cserrdiet = 10, Cserrskipdata = 11, Cserrx86att = 12,
      Cserrx86intel = 13, Cserrx86masm = 14
else:
  static :
    hint("Declaration of " & "enumcserr" & " already exists, not redeclaring")
type
  csh_553648559 = csize_t    ## Generated based on /usr/include/capstone/capstone.h:71:16
  csarch_553648564 = enumcsarch_553648563 ## Generated based on /usr/include/capstone/capstone.h:89:3
  csmode_553648568 = enumcsmode_553648567 ## Generated based on /usr/include/capstone/capstone.h:137:3
  csmalloct_553648570 = proc (a0: csize_t): pointer {.cdecl.} ## Generated based on /usr/include/capstone/capstone.h:139:30
  cscalloct_553648572 = proc (a0: csize_t; a1: csize_t): pointer {.cdecl.} ## Generated based on /usr/include/capstone/capstone.h:140:30
  csrealloct_553648574 = proc (a0: pointer; a1: csize_t): pointer {.cdecl.} ## Generated based on /usr/include/capstone/capstone.h:141:30
  csfreet_553648576 = proc (a0: pointer): void {.cdecl.} ## Generated based on /usr/include/capstone/capstone.h:142:29
  csvsnprintft_553648578 = proc (a0: cstring; a1: csize_t; a2: cstring): cint {.
      cdecl, varargs.}       ## Generated based on /usr/include/capstone/capstone.h:143:28
  structcsoptmem_553648580 {.pure, inheritable, bycopy.} = object
    malloc*: csmalloct_553648571 ## Generated based on /usr/include/capstone/capstone.h:148:16
    calloc*: cscalloct_553648573
    realloc*: csrealloct_553648575
    free*: csfreet_553648577
    vsnprintf*: csvsnprintft_553648579

  csoptmem_553648582 = structcsoptmem_553648581 ## Generated based on /usr/include/capstone/capstone.h:154:3
  structcsoptmnem_553648584 {.pure, inheritable, bycopy.} = object
    id*: cuint               ## Generated based on /usr/include/capstone/capstone.h:160:16
    mnemonic*: cstring

  csoptmnem_553648586 = structcsoptmnem_553648585 ## Generated based on /usr/include/capstone/capstone.h:165:3
  csopttype_553648590 = enumcsopttype_553648589 ## Generated based on /usr/include/capstone/capstone.h:178:3
  csoptvalue_553648594 = enumcsoptvalue_553648593 ## Generated based on /usr/include/capstone/capstone.h:189:3
  csoptype_553648598 = enumcsoptype_553648597 ## Generated based on /usr/include/capstone/capstone.h:198:3
  csactype_553648602 = enumcsactype_553648601 ## Generated based on /usr/include/capstone/capstone.h:206:3
  csgrouptype_553648606 = enumcsgrouptype_553648605 ## Generated based on /usr/include/capstone/capstone.h:218:3
  csskipdatacbt_553648608 = proc (a0: ptr uint8; a1: csize_t; a2: csize_t;
                                  a3: pointer): csize_t {.cdecl.} ## Generated based on /usr/include/capstone/capstone.h:234:31
  structcsoptskipdata_553648610 {.pure, inheritable, bycopy.} = object
    mnemonic*: cstring       ## Generated based on /usr/include/capstone/capstone.h:237:16
    callback*: csskipdatacbt_553648609
    userdata*: pointer

  csoptskipdata_553648612 = structcsoptskipdata_553648611 ## Generated based on /usr/include/capstone/capstone.h:264:3
  armshifter_553648616 = enumarmshifter_553648615 ## Generated based on /usr/include/capstone/arm.h:30:3
  armcc_553648620 = enumarmcc_553648619 ## Generated based on /usr/include/capstone/arm.h:50:3
  armsysreg_553648624 = enumarmsysreg_553648623 ## Generated based on /usr/include/capstone/arm.h:136:3
  armmembarrier_553648628 = enumarmmembarrier_553648627 ## Generated based on /usr/include/capstone/arm.h:158:3
  armoptype_553648632 = enumarmoptype_553648631 ## Generated based on /usr/include/capstone/arm.h:171:3
  armsetendtype_553648636 = enumarmsetendtype_553648635 ## Generated based on /usr/include/capstone/arm.h:178:3
  armcpsmodetype_553648640 = enumarmcpsmodetype_553648639 ## Generated based on /usr/include/capstone/arm.h:184:3
  armcpsflagtype_553648644 = enumarmcpsflagtype_553648643 ## Generated based on /usr/include/capstone/arm.h:193:3
  armvectordatatype_553648655 = enumarmvectordatatype_553648654 ## Generated based on /usr/include/capstone/arm.h:249:3
  armreg_553648659 = enumarmreg_553648658 ## Generated based on /usr/include/capstone/arm.h:376:3
  structarmopmem_553648661 {.pure, inheritable, bycopy.} = object
    base*: armreg_553648660  ## Generated based on /usr/include/capstone/arm.h:380:16
    index*: armreg_553648660
    scale*: cint
    disp*: cint
    lshift*: cint

  armopmem_553648663 = structarmopmem_553648662 ## Generated based on /usr/include/capstone/arm.h:388:3
  structcsarmop_shift_t {.pure, inheritable, bycopy.} = object
    typefield*: armshifter_553648617
    value*: cuint

  structcsarmop_anon0_t {.union, bycopy.} = object
    reg*: cint
    imm*: int32
    fp*: cdouble
    mem*: armopmem_553648664
    setend*: armsetendtype_553648637

  structcsarmop_553648665 {.pure, inheritable, bycopy.} = object
    vectorindex*: cint       ## Generated based on /usr/include/capstone/arm.h:391:16
    shift*: structcsarmop_shift_t
    typefield*: armoptype_553648633
    anon0*: structcsarmop_anon0_t
    subtracted*: bool
    access*: uint8
    neonlane*: int8

  csarmop_553648667 = structcsarmop_553648666 ## Generated based on /usr/include/capstone/arm.h:421:3
  structcsarm_553648669 {.pure, inheritable, bycopy.} = object
    usermode*: bool          ## Generated based on /usr/include/capstone/arm.h:424:16
    vectorsize*: cint
    vectordata*: armvectordatatype_553648656
    cpsmode*: armcpsmodetype_553648641
    cpsflag*: armcpsflagtype_553648645
    cc*: armcc_553648621
    updateflags*: bool
    writeback*: bool
    membarrier*: armmembarrier_553648629
    opcount*: uint8
    operands*: array[36'i64, csarmop_553648668]

  csarm_553648671 = structcsarm_553648670 ## Generated based on /usr/include/capstone/arm.h:440:3
  arminsn_553648675 = enumarminsn_553648674 ## Generated based on /usr/include/capstone/arm.h:882:3
  arminsngroup_553648679 = enumarminsngroup_553648678 ## Generated based on /usr/include/capstone/arm.h:931:3
  arm64shifter_553648683 = enumarm64shifter_553648682 ## Generated based on /usr/include/capstone/arm64.h:25:3
  arm64extender_553648687 = enumarm64extender_553648686 ## Generated based on /usr/include/capstone/arm64.h:38:3
  arm64cc_553648691 = enumarm64cc_553648690 ## Generated based on /usr/include/capstone/arm64.h:61:3
  arm64sysreg_553648695 = enumarm64sysreg_553648694 ## Generated based on /usr/include/capstone/arm64.h:163:3
  arm64msrreg_553648699 = enumarm64msrreg_553648698 ## Generated based on /usr/include/capstone/arm64.h:182:3
  arm64pstate_553648703 = enumarm64pstate_553648702 ## Generated based on /usr/include/capstone/arm64.h:190:3
  arm64vas_553648707 = enumarm64vas_553648706 ## Generated based on /usr/include/capstone/arm64.h:204:3
  arm64vess_553648711 = enumarm64vess_553648710 ## Generated based on /usr/include/capstone/arm64.h:213:3
  arm64barrierop_553648715 = enumarm64barrierop_553648714 ## Generated based on /usr/include/capstone/arm64.h:230:3
  arm64optype_553648719 = enumarm64optype_553648718 ## Generated based on /usr/include/capstone/arm64.h:246:3
  arm64tlbiop_553648723 = enumarm64tlbiop_553648722 ## Generated based on /usr/include/capstone/arm64.h:283:3
  arm64atop_553648727 = enumarm64atop_553648726 ## Generated based on /usr/include/capstone/arm64.h:299:3
  arm64dcop_553648731 = enumarm64dcop_553648730 ## Generated based on /usr/include/capstone/arm64.h:312:3
  arm64icop_553648735 = enumarm64icop_553648734 ## Generated based on /usr/include/capstone/arm64.h:320:3
  arm64prefetchop_553648739 = enumarm64prefetchop_553648738 ## Generated based on /usr/include/capstone/arm64.h:343:3
  arm64reg_553648743 = enumarm64reg_553648742 ## Generated based on /usr/include/capstone/arm64.h:619:3
  structarm64opmem_553648745 {.pure, inheritable, bycopy.} = object
    base*: arm64reg_553648744 ## Generated based on /usr/include/capstone/arm64.h:623:16
    index*: arm64reg_553648744
    disp*: int32

  arm64opmem_553648747 = structarm64opmem_553648746 ## Generated based on /usr/include/capstone/arm64.h:627:3
  structcsarm64op_shift_t {.pure, inheritable, bycopy.} = object
    typefield*: arm64shifter_553648684
    value*: cuint

  structcsarm64op_anon0_t {.union, bycopy.} = object
    reg*: arm64reg_553648744
    imm*: int64
    fp*: cdouble
    mem*: arm64opmem_553648748
    pstate*: arm64pstate_553648704
    sys*: cuint
    prefetch*: arm64prefetchop_553648740
    barrier*: arm64barrierop_553648716

  structcsarm64op_553648749 {.pure, inheritable, bycopy.} = object
    vectorindex*: cint       ## Generated based on /usr/include/capstone/arm64.h:630:16
    vas*: arm64vas_553648708
    vess*: arm64vess_553648712
    shift*: structcsarm64op_shift_t
    ext*: arm64extender_553648688
    typefield*: arm64optype_553648720
    anon0*: structcsarm64op_anon0_t
    access*: uint8

  csarm64op_553648751 = structcsarm64op_553648750 ## Generated based on /usr/include/capstone/arm64.h:655:3
  structcsarm64_553648753 {.pure, inheritable, bycopy.} = object
    cc*: arm64cc_553648692   ## Generated based on /usr/include/capstone/arm64.h:658:16
    updateflags*: bool
    writeback*: bool
    opcount*: uint8
    operands*: array[8'i64, csarm64op_553648752]

  csarm64_553648755 = structcsarm64_553648754 ## Generated based on /usr/include/capstone/arm64.h:668:3
  arm64insn_553648759 = enumarm64insn_553648758 ## Generated based on /usr/include/capstone/arm64.h:1136:3
  arm64insngroup_553648763 = enumarm64insngroup_553648762 ## Generated based on /usr/include/capstone/arm64.h:1158:3
  m68kreg_553648767 = enumm68kreg_553648766 ## Generated based on /usr/include/capstone/m68k.h:76:3
  m68kaddressmode_553648771 = enumm68kaddressmode_553648770 ## Generated based on /usr/include/capstone/m68k.h:109:3
  m68koptype_553648775 = enumm68koptype_553648774 ## Generated based on /usr/include/capstone/m68k.h:122:3
  structm68kopmem_553648777 {.pure, inheritable, bycopy.} = object
    basereg*: m68kreg_553648768 ## Generated based on /usr/include/capstone/m68k.h:126:16
    indexreg*: m68kreg_553648768
    inbasereg*: m68kreg_553648768
    indisp*: uint32
    outdisp*: uint32
    disp*: int16
    scale*: uint8
    bitfield*: uint8
    width*: uint8
    offset*: uint8
    indexsize*: uint8

  m68kopmem_553648779 = structm68kopmem_553648778 ## Generated based on /usr/include/capstone/m68k.h:138:3
  m68kopbrdispsize_553648783 = enumm68kopbrdispsize_553648782 ## Generated based on /usr/include/capstone/m68k.h:146:3
  structm68kopbrdisp_553648785 {.pure, inheritable, bycopy.} = object
    disp*: int32             ## Generated based on /usr/include/capstone/m68k.h:148:16
    dispsize*: uint8

  m68kopbrdisp_553648787 = structm68kopbrdisp_553648786 ## Generated based on /usr/include/capstone/m68k.h:151:3
  structcsm68kopregpair_553648789 {.pure, inheritable, bycopy.} = object
    reg0*: m68kreg_553648768 ## Generated based on /usr/include/capstone/m68k.h:154:16
    reg1*: m68kreg_553648768

  csm68kopregpair_553648791 = structcsm68kopregpair_553648790 ## Generated based on /usr/include/capstone/m68k.h:157:3
  structcsm68kop_anon0_t {.union, bycopy.} = object
    imm*: uint64
    dimm*: cdouble
    simm*: cfloat
    reg*: m68kreg_553648768
    regpair*: csm68kopregpair_553648792

  structcsm68kop_553648793 {.pure, inheritable, bycopy.} = object
    anon0*: structcsm68kop_anon0_t ## Generated based on /usr/include/capstone/m68k.h:160:16
    mem*: m68kopmem_553648780
    brdisp*: m68kopbrdisp_553648788
    registerbits*: uint32
    typefield*: m68koptype_553648776
    addressmode*: m68kaddressmode_553648772

  csm68kop_553648795 = structcsm68kop_553648794 ## Generated based on /usr/include/capstone/m68k.h:174:3
  m68kcpusize_553648799 = enumm68kcpusize_553648798 ## Generated based on /usr/include/capstone/m68k.h:182:3
  m68kfpusize_553648803 = enumm68kfpusize_553648802 ## Generated based on /usr/include/capstone/m68k.h:190:3
  m68ksizetype_553648807 = enumm68ksizetype_553648806 ## Generated based on /usr/include/capstone/m68k.h:198:3
  structm68kopsize_anon0_t {.union, bycopy.} = object
    cpusize*: m68kcpusize_553648800
    fpusize*: m68kfpusize_553648804

  structm68kopsize_553648809 {.pure, inheritable, bycopy.} = object
    typefield*: m68ksizetype_553648808 ## Generated based on /usr/include/capstone/m68k.h:201:16
    anon0*: structm68kopsize_anon0_t

  m68kopsize_553648811 = structm68kopsize_553648810 ## Generated based on /usr/include/capstone/m68k.h:207:3
  structcsm68k_553648813 {.pure, inheritable, bycopy.} = object
    operands*: array[4'i64, csm68kop_553648796] ## Generated based on /usr/include/capstone/m68k.h:210:16
    opsize*: m68kopsize_553648812
    opcount*: uint8

  csm68k_553648815 = structcsm68k_553648814 ## Generated based on /usr/include/capstone/m68k.h:215:3
  m68kinsn_553648819 = enumm68kinsn_553648818 ## Generated based on /usr/include/capstone/m68k.h:596:3
  m68kgrouptype_553648823 = enumm68kgrouptype_553648822 ## Generated based on /usr/include/capstone/m68k.h:607:3
  mipsoptype_553648827 = enummipsoptype_553648826 ## Generated based on /usr/include/capstone/mips.h:27:3
  mipsreg_553648831 = enummipsreg_553648830 ## Generated based on /usr/include/capstone/mips.h:230:3
  structmipsopmem_553648833 {.pure, inheritable, bycopy.} = object
    base*: mipsreg_553648832 ## Generated based on /usr/include/capstone/mips.h:234:16
    disp*: int64

  mipsopmem_553648835 = structmipsopmem_553648834 ## Generated based on /usr/include/capstone/mips.h:237:3
  structcsmipsop_anon0_t {.union, bycopy.} = object
    reg*: mipsreg_553648832
    imm*: int64
    mem*: mipsopmem_553648836

  structcsmipsop_553648837 {.pure, inheritable, bycopy.} = object
    typefield*: mipsoptype_553648828 ## Generated based on /usr/include/capstone/mips.h:240:16
    anon0*: structcsmipsop_anon0_t

  csmipsop_553648839 = structcsmipsop_553648838 ## Generated based on /usr/include/capstone/mips.h:247:3
  structcsmips_553648841 {.pure, inheritable, bycopy.} = object
    opcount*: uint8          ## Generated based on /usr/include/capstone/mips.h:250:16
    operands*: array[10'i64, csmipsop_553648840]

  csmips_553648843 = structcsmips_553648842 ## Generated based on /usr/include/capstone/mips.h:255:3
  mipsinsn_553648847 = enummipsinsn_553648846 ## Generated based on /usr/include/capstone/mips.h:892:3
  mipsinsngroup_553648851 = enummipsinsngroup_553648850 ## Generated based on /usr/include/capstone/mips.h:950:3
  ppcbc_553648855 = enumppcbc_553648854 ## Generated based on /usr/include/capstone/ppc.h:32:3
  ppcbh_553648859 = enumppcbh_553648858 ## Generated based on /usr/include/capstone/ppc.h:39:3
  ppcoptype_553648863 = enumppcoptype_553648862 ## Generated based on /usr/include/capstone/ppc.h:48:3
  ppcreg_553648867 = enumppcreg_553648866 ## Generated based on /usr/include/capstone/ppc.h:267:3
  structppcopmem_553648869 {.pure, inheritable, bycopy.} = object
    base*: ppcreg_553648868  ## Generated based on /usr/include/capstone/ppc.h:271:16
    disp*: int32

  ppcopmem_553648871 = structppcopmem_553648870 ## Generated based on /usr/include/capstone/ppc.h:274:3
  structppcopcrx_553648873 {.pure, inheritable, bycopy.} = object
    scale*: cuint            ## Generated based on /usr/include/capstone/ppc.h:276:16
    reg*: ppcreg_553648868
    cond*: ppcbc_553648856

  ppcopcrx_553648875 = structppcopcrx_553648874 ## Generated based on /usr/include/capstone/ppc.h:280:3
  structcsppcop_anon0_t {.union, bycopy.} = object
    reg*: ppcreg_553648868
    imm*: int64
    mem*: ppcopmem_553648872
    crx*: ppcopcrx_553648876

  structcsppcop_553648877 {.pure, inheritable, bycopy.} = object
    typefield*: ppcoptype_553648864 ## Generated based on /usr/include/capstone/ppc.h:283:16
    anon0*: structcsppcop_anon0_t

  csppcop_553648879 = structcsppcop_553648878 ## Generated based on /usr/include/capstone/ppc.h:291:3
  structcsppc_553648881 {.pure, inheritable, bycopy.} = object
    bc*: ppcbc_553648856     ## Generated based on /usr/include/capstone/ppc.h:294:16
    bh*: ppcbh_553648860
    updatecr0*: bool
    opcount*: uint8
    operands*: array[8'i64, csppcop_553648880]

  csppc_553648883 = structcsppc_553648882 ## Generated based on /usr/include/capstone/ppc.h:308:3
  ppcinsn_553648887 = enumppcinsn_553648886 ## Generated based on /usr/include/capstone/ppc.h:1430:3
  ppcinsngroup_553648891 = enumppcinsngroup_553648890 ## Generated based on /usr/include/capstone/ppc.h:1457:3
  sparccc_553648895 = enumsparccc_553648894 ## Generated based on /usr/include/capstone/sparc.h:59:3
  sparchint_553648899 = enumsparchint_553648898 ## Generated based on /usr/include/capstone/sparc.h:67:3
  sparcoptype_553648903 = enumsparcoptype_553648902 ## Generated based on /usr/include/capstone/sparc.h:75:3
  sparcreg_553648907 = enumsparcreg_553648906 ## Generated based on /usr/include/capstone/sparc.h:176:3
  structsparcopmem_553648909 {.pure, inheritable, bycopy.} = object
    base*: uint8             ## Generated based on /usr/include/capstone/sparc.h:180:16
    index*: uint8
    disp*: int32

  sparcopmem_553648911 = structsparcopmem_553648910 ## Generated based on /usr/include/capstone/sparc.h:186:3
  structcssparcop_anon0_t {.union, bycopy.} = object
    reg*: sparcreg_553648908
    imm*: int64
    mem*: sparcopmem_553648912

  structcssparcop_553648913 {.pure, inheritable, bycopy.} = object
    typefield*: sparcoptype_553648904 ## Generated based on /usr/include/capstone/sparc.h:189:16
    anon0*: structcssparcop_anon0_t

  cssparcop_553648915 = structcssparcop_553648914 ## Generated based on /usr/include/capstone/sparc.h:196:3
  structcssparc_553648917 {.pure, inheritable, bycopy.} = object
    cc*: sparccc_553648896   ## Generated based on /usr/include/capstone/sparc.h:199:16
    hint*: sparchint_553648900
    opcount*: uint8
    operands*: array[4'i64, cssparcop_553648916]

  cssparc_553648919 = structcssparc_553648918 ## Generated based on /usr/include/capstone/sparc.h:206:3
  sparcinsn_553648923 = enumsparcinsn_553648922 ## Generated based on /usr/include/capstone/sparc.h:494:3
  sparcinsngroup_553648927 = enumsparcinsngroup_553648926 ## Generated based on /usr/include/capstone/sparc.h:514:3
  syszcc_553648931 = enumsyszcc_553648930 ## Generated based on /usr/include/capstone/systemz.h:35:3
  syszoptype_553648935 = enumsyszoptype_553648934 ## Generated based on /usr/include/capstone/systemz.h:44:3
  syszreg_553648939 = enumsyszreg_553648938 ## Generated based on /usr/include/capstone/systemz.h:87:3
  structsyszopmem_553648941 {.pure, inheritable, bycopy.} = object
    base*: uint8             ## Generated based on /usr/include/capstone/systemz.h:91:16
    index*: uint8
    length*: uint64
    disp*: int64

  syszopmem_553648943 = structsyszopmem_553648942 ## Generated based on /usr/include/capstone/systemz.h:98:3
  structcssyszop_anon0_t {.union, bycopy.} = object
    reg*: syszreg_553648940
    imm*: int64
    mem*: syszopmem_553648944

  structcssyszop_553648945 {.pure, inheritable, bycopy.} = object
    typefield*: syszoptype_553648936 ## Generated based on /usr/include/capstone/systemz.h:101:16
    anon0*: structcssyszop_anon0_t

  cssyszop_553648947 = structcssyszop_553648946 ## Generated based on /usr/include/capstone/systemz.h:108:3
  structcssysz_553648949 {.pure, inheritable, bycopy.} = object
    cc*: syszcc_553648932    ## Generated based on /usr/include/capstone/systemz.h:111:16
    opcount*: uint8
    operands*: array[6'i64, cssyszop_553648948]

  cssysz_553648951 = structcssysz_553648950 ## Generated based on /usr/include/capstone/systemz.h:117:3
  syszinsn_553648955 = enumsyszinsn_553648954 ## Generated based on /usr/include/capstone/systemz.h:806:3
  syszinsngroup_553648959 = enumsyszinsngroup_553648958 ## Generated based on /usr/include/capstone/systemz.h:824:3
  x86reg_553648963 = enumx86reg_553648962 ## Generated based on /usr/include/capstone/x86.h:72:3
  x86optype_553648967 = enumx86optype_553648966 ## Generated based on /usr/include/capstone/x86.h:163:3
  x86xopcc_553648971 = enumx86xopcc_553648970 ## Generated based on /usr/include/capstone/x86.h:176:3
  x86avxbcast_553648975 = enumx86avxbcast_553648974 ## Generated based on /usr/include/capstone/x86.h:185:3
  x86ssecc_553648979 = enumx86ssecc_553648978 ## Generated based on /usr/include/capstone/x86.h:198:3
  x86avxcc_553648983 = enumx86avxcc_553648982 ## Generated based on /usr/include/capstone/x86.h:235:3
  x86avxrm_553648987 = enumx86avxrm_553648986 ## Generated based on /usr/include/capstone/x86.h:244:3
  x86prefix_553648991 = enumx86prefix_553648990 ## Generated based on /usr/include/capstone/x86.h:262:3
  structx86opmem_553648993 {.pure, inheritable, bycopy.} = object
    segment*: x86reg_553648964 ## Generated based on /usr/include/capstone/x86.h:266:16
    base*: x86reg_553648964
    index*: x86reg_553648964
    scale*: cint
    disp*: int64

  x86opmem_553648995 = structx86opmem_553648994 ## Generated based on /usr/include/capstone/x86.h:272:3
  structcsx86op_anon0_t {.union, bycopy.} = object
    reg*: x86reg_553648964
    imm*: int64
    mem*: x86opmem_553648996

  structcsx86op_553648997 {.pure, inheritable, bycopy.} = object
    typefield*: x86optype_553648968 ## Generated based on /usr/include/capstone/x86.h:275:16
    anon0*: structcsx86op_anon0_t
    size*: uint8
    access*: uint8
    avxbcast*: x86avxbcast_553648976
    avxzeroopmask*: bool

  csx86op_553648999 = structcsx86op_553648998 ## Generated based on /usr/include/capstone/x86.h:296:3
  structcsx86encoding_553649001 {.pure, inheritable, bycopy.} = object
    modrmoffset*: uint8      ## Generated based on /usr/include/capstone/x86.h:298:16
    dispoffset*: uint8
    dispsize*: uint8
    immoffset*: uint8
    immsize*: uint8

  csx86encoding_553649003 = structcsx86encoding_553649002 ## Generated based on /usr/include/capstone/x86.h:309:3
  structcsx86_anon0_t {.union, bycopy.} = object
    eflags*: uint64
    fpuflags*: uint64

  structcsx86_553649005 {.pure, inheritable, bycopy.} = object
    prefix*: array[4'i64, uint8] ## Generated based on /usr/include/capstone/x86.h:312:16
    opcode*: array[4'i64, uint8]
    rex*: uint8
    addrsize*: uint8
    modrm*: uint8
    sib*: uint8
    disp*: int64
    sibindex*: x86reg_553648964
    sibscale*: int8
    sibbase*: x86reg_553648964
    xopcc*: x86xopcc_553648972
    ssecc*: x86ssecc_553648980
    avxcc*: x86avxcc_553648984
    avxsae*: bool
    avxrm*: x86avxrm_553648988
    anon0*: structcsx86_anon0_t
    opcount*: uint8
    operands*: array[8'i64, csx86op_553649000]
    encoding*: csx86encoding_553649004

  csx86_553649007 = structcsx86_553649006 ## Generated based on /usr/include/capstone/x86.h:381:3
  x86insn_553649011 = enumx86insn_553649010 ## Generated based on /usr/include/capstone/x86.h:1899:3
  x86insngroup_553649015 = enumx86insngroup_553649014 ## Generated based on /usr/include/capstone/x86.h:1966:3
  xcoreoptype_553649019 = enumxcoreoptype_553649018 ## Generated based on /usr/include/capstone/xcore.h:23:3
  xcorereg_553649023 = enumxcorereg_553649022 ## Generated based on /usr/include/capstone/xcore.h:61:3
  structxcoreopmem_553649025 {.pure, inheritable, bycopy.} = object
    base*: uint8             ## Generated based on /usr/include/capstone/xcore.h:65:16
    index*: uint8
    disp*: int32
    direct*: cint

  xcoreopmem_553649027 = structxcoreopmem_553649026 ## Generated based on /usr/include/capstone/xcore.h:72:3
  structcsxcoreop_anon0_t {.union, bycopy.} = object
    reg*: xcorereg_553649024
    imm*: int32
    mem*: xcoreopmem_553649028

  structcsxcoreop_553649029 {.pure, inheritable, bycopy.} = object
    typefield*: xcoreoptype_553649020 ## Generated based on /usr/include/capstone/xcore.h:75:16
    anon0*: structcsxcoreop_anon0_t

  csxcoreop_553649031 = structcsxcoreop_553649030 ## Generated based on /usr/include/capstone/xcore.h:82:3
  structcsxcore_553649033 {.pure, inheritable, bycopy.} = object
    opcount*: uint8          ## Generated based on /usr/include/capstone/xcore.h:85:16
    operands*: array[8'i64, csxcoreop_553649032]

  csxcore_553649035 = structcsxcore_553649034 ## Generated based on /usr/include/capstone/xcore.h:90:3
  xcoreinsn_553649039 = enumxcoreinsn_553649038 ## Generated based on /usr/include/capstone/xcore.h:218:3
  xcoreinsngroup_553649043 = enumxcoreinsngroup_553649042 ## Generated based on /usr/include/capstone/xcore.h:229:3
  tms320c64xoptype_553649047 = enumtms320c64xoptype_553649046 ## Generated based on /usr/include/capstone/tms320c64x.h:24:3
  tms320c64xmemdisp_553649051 = enumtms320c64xmemdisp_553649050 ## Generated based on /usr/include/capstone/tms320c64x.h:30:3
  tms320c64xmemdir_553649055 = enumtms320c64xmemdir_553649054 ## Generated based on /usr/include/capstone/tms320c64x.h:36:3
  tms320c64xmemmod_553649059 = enumtms320c64xmemmod_553649058 ## Generated based on /usr/include/capstone/tms320c64x.h:43:3
  structtms320c64xopmem_553649061 {.pure, inheritable, bycopy.} = object
    base*: cuint             ## Generated based on /usr/include/capstone/tms320c64x.h:45:16
    disp*: cuint
    unit*: cuint
    scaled*: cuint
    disptype*: cuint
    direction*: cuint
    modify*: cuint

  tms320c64xopmem_553649063 = structtms320c64xopmem_553649062 ## Generated based on /usr/include/capstone/tms320c64x.h:53:3
  structcstms320c64xop_anon0_t {.union, bycopy.} = object
    reg*: cuint
    imm*: int32
    mem*: tms320c64xopmem_553649064

  structcstms320c64xop_553649065 {.pure, inheritable, bycopy.} = object
    typefield*: tms320c64xoptype_553649048 ## Generated based on /usr/include/capstone/tms320c64x.h:55:16
    anon0*: structcstms320c64xop_anon0_t

  cstms320c64xop_553649067 = structcstms320c64xop_553649066 ## Generated based on /usr/include/capstone/tms320c64x.h:62:3
  structcstms320c64x_condition_t {.pure, inheritable, bycopy.} = object
    reg*: cuint
    zero*: cuint

  structcstms320c64x_funit_t {.pure, inheritable, bycopy.} = object
    unit*: cuint
    side*: cuint
    crosspath*: cuint

  structcstms320c64x_553649069 {.pure, inheritable, bycopy.} = object
    opcount*: uint8          ## Generated based on /usr/include/capstone/tms320c64x.h:64:16
    operands*: array[8'i64, cstms320c64xop_553649068]
    condition*: structcstms320c64x_condition_t
    funit*: structcstms320c64x_funit_t
    parallel*: cuint

  cstms320c64x_553649071 = structcstms320c64x_553649070 ## Generated based on /usr/include/capstone/tms320c64x.h:77:3
  tms320c64xreg_553649075 = enumtms320c64xreg_553649074 ## Generated based on /usr/include/capstone/tms320c64x.h:177:3
  tms320c64xinsn_553649079 = enumtms320c64xinsn_553649078 ## Generated based on /usr/include/capstone/tms320c64x.h:329:3
  tms320c64xinsngroup_553649083 = enumtms320c64xinsngroup_553649082 ## Generated based on /usr/include/capstone/tms320c64x.h:343:3
  tms320c64xfunit_553649087 = enumtms320c64xfunit_553649086 ## Generated based on /usr/include/capstone/tms320c64x.h:352:3
  m680xreg_553649091 = enumm680xreg_553649090 ## Generated based on /usr/include/capstone/m680x.h:52:3
  m680xoptype_553649095 = enumm680xoptype_553649094 ## Generated based on /usr/include/capstone/m680x.h:65:3
  structm680xopidx_553649097 {.pure, inheritable, bycopy.} = object
    basereg*: m680xreg_553649092 ## Generated based on /usr/include/capstone/m680x.h:81:16
    offsetreg*: m680xreg_553649092
    offset*: int16
    offsetaddr*: uint16
    offsetbits*: uint8
    incdec*: int8
    flags*: uint8

  m680xopidx_553649099 = structm680xopidx_553649098 ## Generated based on /usr/include/capstone/m680x.h:97:3
  structm680xoprel_553649101 {.pure, inheritable, bycopy.} = object
    address*: uint16         ## Generated based on /usr/include/capstone/m680x.h:100:16
    offset*: int16

  m680xoprel_553649103 = structm680xoprel_553649102 ## Generated based on /usr/include/capstone/m680x.h:105:3
  structm680xopext_553649105 {.pure, inheritable, bycopy.} = object
    address*: uint16         ## Generated based on /usr/include/capstone/m680x.h:108:16
    indirect*: bool

  m680xopext_553649107 = structm680xopext_553649106 ## Generated based on /usr/include/capstone/m680x.h:111:3
  structcsm680xop_anon0_t {.union, bycopy.} = object
    imm*: int32
    reg*: m680xreg_553649092
    idx*: m680xopidx_553649100
    rel*: m680xoprel_553649104
    ext*: m680xopext_553649108
    directaddr*: uint8
    constval*: uint8

  structcsm680xop_553649109 {.pure, inheritable, bycopy.} = object
    typefield*: m680xoptype_553649096 ## Generated based on /usr/include/capstone/m680x.h:114:16
    anon0*: structcsm680xop_anon0_t
    size*: uint8
    access*: uint8

  csm680xop_553649111 = structcsm680xop_553649110 ## Generated based on /usr/include/capstone/m680x.h:130:3
  m680xgrouptype_553649115 = enumm680xgrouptype_553649114 ## Generated based on /usr/include/capstone/m680x.h:153:3
  structcsm680x_553649117 {.pure, inheritable, bycopy.} = object
    flags*: uint8            ## Generated based on /usr/include/capstone/m680x.h:165:16
    opcount*: uint8
    operands*: array[9'i64, csm680xop_553649112]

  csm680x_553649119 = structcsm680x_553649118 ## Generated based on /usr/include/capstone/m680x.h:169:3
  m680xinsn_553649123 = enumm680xinsn_553649122 ## Generated based on /usr/include/capstone/m680x.h:531:3
  structcsevm_553649125 {.pure, inheritable, bycopy.} = object
    pop*: uint8              ## Generated based on /usr/include/capstone/evm.h:18:16
    push*: uint8
    fee*: cuint

  csevm_553649127 = structcsevm_553649126 ## Generated based on /usr/include/capstone/evm.h:22:3
  evminsn_553649131 = enumevminsn_553649130 ## Generated based on /usr/include/capstone/evm.h:164:3
  evminsngroup_553649135 = enumevminsngroup_553649134 ## Generated based on /usr/include/capstone/evm.h:182:3
  structcsdetail_anon0_t {.union, bycopy.} = object
    x86*: csx86_553649008
    arm64*: csarm64_553648756
    arm*: csarm_553648672
    m68k*: csm68k_553648816
    mips*: csmips_553648844
    ppc*: csppc_553648884
    sparc*: cssparc_553648920
    sysz*: cssysz_553648952
    xcore*: csxcore_553649036
    tms320c64x*: cstms320c64x_553649072
    m680x*: csm680x_553649120
    evm*: csevm_553649128

  structcsdetail_553649137 {.pure, inheritable, bycopy.} = object
    regsread*: array[12'i64, uint16] ## Generated based on /usr/include/capstone/capstone.h:285:16
    regsreadcount*: uint8
    regswrite*: array[20'i64, uint16]
    regswritecount*: uint8
    groups*: array[8'i64, uint8]
    groupscount*: uint8
    anon0*: structcsdetail_anon0_t

  csdetail_553649139 = structcsdetail_553649138 ## Generated based on /usr/include/capstone/capstone.h:310:3
  structcsinsn_553649141 {.pure, inheritable, bycopy.} = object
    id*: cuint               ## Generated based on /usr/include/capstone/capstone.h:313:16
    address*: uint64
    size*: uint16
    bytes*: array[16'i64, uint8]
    mnemonic*: array[32'i64, cschar]
    opstr*: array[160'i64, cschar]
    detail*: ptr csdetail_553649140

  csinsn_553649143 = structcsinsn_553649142 ## Generated based on /usr/include/capstone/capstone.h:350:3
  cserr_553649147 = enumcserr_553649146 ## Generated based on /usr/include/capstone/capstone.h:377:3
  csregs_553649149 = array[64'i64, uint16] ## Generated based on /usr/include/capstone/capstone.h:738:18
  enumarminsn_553648674 = (when declared(enumarminsn):
    enumarminsn
   else:
    enumarminsn_553648673)
  m68kopsize_553648812 = (when declared(m68kopsize):
    m68kopsize
   else:
    m68kopsize_553648811)
  m68kaddressmode_553648772 = (when declared(m68kaddressmode):
    m68kaddressmode
   else:
    m68kaddressmode_553648771)
  csoptskipdata_553648613 = (when declared(csoptskipdata):
    csoptskipdata
   else:
    csoptskipdata_553648612)
  enumarm64barrierop_553648714 = (when declared(enumarm64barrierop):
    enumarm64barrierop
   else:
    enumarm64barrierop_553648713)
  arminsn_553648676 = (when declared(arminsn):
    arminsn
   else:
    arminsn_553648675)
  structm680xopext_553649106 = (when declared(structm680xopext):
    structm680xopext
   else:
    structm680xopext_553649105)
  csdetail_553649140 = (when declared(csdetail):
    csdetail
   else:
    csdetail_553649139)
  m68kgrouptype_553648824 = (when declared(m68kgrouptype):
    m68kgrouptype
   else:
    m68kgrouptype_553648823)
  csppcop_553648880 = (when declared(csppcop):
    csppcop
   else:
    csppcop_553648879)
  m680xopext_553649108 = (when declared(m680xopext):
    m680xopext
   else:
    m680xopext_553649107)
  enumx86insngroup_553649014 = (when declared(enumx86insngroup):
    enumx86insngroup
   else:
    enumx86insngroup_553649013)
  enumppcinsn_553648886 = (when declared(enumppcinsn):
    enumppcinsn
   else:
    enumppcinsn_553648885)
  cserr_553649148 = (when declared(cserr):
    cserr
   else:
    cserr_553649147)
  csmalloct_553648571 = (when declared(csmalloct):
    csmalloct
   else:
    csmalloct_553648570)
  syszinsn_553648956 = (when declared(syszinsn):
    syszinsn
   else:
    syszinsn_553648955)
  csarm_553648672 = (when declared(csarm):
    csarm
   else:
    csarm_553648671)
  enumarm64cc_553648690 = (when declared(enumarm64cc):
    enumarm64cc
   else:
    enumarm64cc_553648689)
  csxcoreop_553649032 = (when declared(csxcoreop):
    csxcoreop
   else:
    csxcoreop_553649031)
  enumsyszcc_553648930 = (when declared(enumsyszcc):
    enumsyszcc
   else:
    enumsyszcc_553648929)
  csm68kop_553648796 = (when declared(csm68kop):
    csm68kop
   else:
    csm68kop_553648795)
  xcoreinsngroup_553649044 = (when declared(xcoreinsngroup):
    xcoreinsngroup
   else:
    xcoreinsngroup_553649043)
  ppcinsngroup_553648892 = (when declared(ppcinsngroup):
    ppcinsngroup
   else:
    ppcinsngroup_553648891)
  enummipsinsn_553648846 = (when declared(enummipsinsn):
    enummipsinsn
   else:
    enummipsinsn_553648845)
  armsetendtype_553648637 = (when declared(armsetendtype):
    armsetendtype
   else:
    armsetendtype_553648636)
  tms320c64xmemdisp_553649052 = (when declared(tms320c64xmemdisp):
    tms320c64xmemdisp
   else:
    tms320c64xmemdisp_553649051)
  structtms320c64xopmem_553649062 = (when declared(structtms320c64xopmem):
    structtms320c64xopmem
   else:
    structtms320c64xopmem_553649061)
  csskipdatacbt_553648609 = (when declared(csskipdatacbt):
    csskipdatacbt
   else:
    csskipdatacbt_553648608)
  arm64reg_553648744 = (when declared(arm64reg):
    arm64reg
   else:
    arm64reg_553648743)
  syszopmem_553648944 = (when declared(syszopmem):
    syszopmem
   else:
    syszopmem_553648943)
  syszoptype_553648936 = (when declared(syszoptype):
    syszoptype
   else:
    syszoptype_553648935)
  tms320c64xmemdir_553649056 = (when declared(tms320c64xmemdir):
    tms320c64xmemdir
   else:
    tms320c64xmemdir_553649055)
  enumcsoptype_553648597 = (when declared(enumcsoptype):
    enumcsoptype
   else:
    enumcsoptype_553648596)
  structppcopcrx_553648874 = (when declared(structppcopcrx):
    structppcopcrx
   else:
    structppcopcrx_553648873)
  arm64barrierop_553648716 = (when declared(arm64barrierop):
    arm64barrierop
   else:
    arm64barrierop_553648715)
  arm64tlbiop_553648724 = (when declared(arm64tlbiop):
    arm64tlbiop
   else:
    arm64tlbiop_553648723)
  x86ssecc_553648980 = (when declared(x86ssecc):
    x86ssecc
   else:
    x86ssecc_553648979)
  enumm68kaddressmode_553648770 = (when declared(enumm68kaddressmode):
    enumm68kaddressmode
   else:
    enumm68kaddressmode_553648769)
  armcc_553648621 = (when declared(armcc):
    armcc
   else:
    armcc_553648620)
  structcsm68kopregpair_553648790 = (when declared(structcsm68kopregpair):
    structcsm68kopregpair
   else:
    structcsm68kopregpair_553648789)
  enumarm64reg_553648742 = (when declared(enumarm64reg):
    enumarm64reg
   else:
    enumarm64reg_553648741)
  enumppcreg_553648866 = (when declared(enumppcreg):
    enumppcreg
   else:
    enumppcreg_553648865)
  structm68kopmem_553648778 = (when declared(structm68kopmem):
    structm68kopmem
   else:
    structm68kopmem_553648777)
  enumx86avxbcast_553648974 = (when declared(enumx86avxbcast):
    enumx86avxbcast
   else:
    enumx86avxbcast_553648973)
  csoptype_553648599 = (when declared(csoptype):
    csoptype
   else:
    csoptype_553648598)
  enumcsarch_553648563 = (when declared(enumcsarch):
    enumcsarch
   else:
    enumcsarch_553648562)
  enumarminsngroup_553648678 = (when declared(enumarminsngroup):
    enumarminsngroup
   else:
    enumarminsngroup_553648677)
  enumm680xinsn_553649122 = (when declared(enumm680xinsn):
    enumm680xinsn
   else:
    enumm680xinsn_553649121)
  structx86opmem_553648994 = (when declared(structx86opmem):
    structx86opmem
   else:
    structx86opmem_553648993)
  csarmop_553648668 = (when declared(csarmop):
    csarmop
   else:
    csarmop_553648667)
  armreg_553648660 = (when declared(armreg):
    armreg
   else:
    armreg_553648659)
  structcstms320c64x_553649070 = (when declared(structcstms320c64x):
    structcstms320c64x
   else:
    structcstms320c64x_553649069)
  structcsmips_553648842 = (when declared(structcsmips):
    structcsmips
   else:
    structcsmips_553648841)
  enumxcorereg_553649022 = (when declared(enumxcorereg):
    enumxcorereg
   else:
    enumxcorereg_553649021)
  csinsn_553649144 = (when declared(csinsn):
    csinsn
   else:
    csinsn_553649143)
  csmode_553648569 = (when declared(csmode):
    csmode
   else:
    csmode_553648568)
  evminsngroup_553649136 = (when declared(evminsngroup):
    evminsngroup
   else:
    evminsngroup_553649135)
  structcssparc_553648918 = (when declared(structcssparc):
    structcssparc
   else:
    structcssparc_553648917)
  enumarm64vas_553648706 = (when declared(enumarm64vas):
    enumarm64vas
   else:
    enumarm64vas_553648705)
  structcsarm_553648670 = (when declared(structcsarm):
    structcsarm
   else:
    structcsarm_553648669)
  enumsparcinsn_553648922 = (when declared(enumsparcinsn):
    enumsparcinsn
   else:
    enumsparcinsn_553648921)
  structcssyszop_553648946 = (when declared(structcssyszop):
    structcssyszop
   else:
    structcssyszop_553648945)
  enumx86optype_553648966 = (when declared(enumx86optype):
    enumx86optype
   else:
    enumx86optype_553648965)
  enumxcoreinsn_553649038 = (when declared(enumxcoreinsn):
    enumxcoreinsn
   else:
    enumxcoreinsn_553649037)
  m680xoptype_553649096 = (when declared(m680xoptype):
    m680xoptype
   else:
    m680xoptype_553649095)
  ppcbc_553648856 = (when declared(ppcbc):
    ppcbc
   else:
    ppcbc_553648855)
  enumtms320c64xinsn_553649078 = (when declared(enumtms320c64xinsn):
    enumtms320c64xinsn
   else:
    enumtms320c64xinsn_553649077)
  structcsarm64_553648754 = (when declared(structcsarm64):
    structcsarm64
   else:
    structcsarm64_553648753)
  enumcsmode_553648567 = (when declared(enumcsmode):
    enumcsmode
   else:
    enumcsmode_553648566)
  enumarmshifter_553648615 = (when declared(enumarmshifter):
    enumarmshifter
   else:
    enumarmshifter_553648614)
  enumsparcreg_553648906 = (when declared(enumsparcreg):
    enumsparcreg
   else:
    enumsparcreg_553648905)
  csm68kopregpair_553648792 = (when declared(csm68kopregpair):
    csm68kopregpair
   else:
    csm68kopregpair_553648791)
  m68ksizetype_553648808 = (when declared(m68ksizetype):
    m68ksizetype
   else:
    m68ksizetype_553648807)
  structcsoptmem_553648581 = (when declared(structcsoptmem):
    structcsoptmem
   else:
    structcsoptmem_553648580)
  csppc_553648884 = (when declared(csppc):
    csppc
   else:
    csppc_553648883)
  structcsx86encoding_553649002 = (when declared(structcsx86encoding):
    structcsx86encoding
   else:
    structcsx86encoding_553649001)
  enumarm64atop_553648726 = (when declared(enumarm64atop):
    enumarm64atop
   else:
    enumarm64atop_553648725)
  structm68kopbrdisp_553648786 = (when declared(structm68kopbrdisp):
    structm68kopbrdisp
   else:
    structm68kopbrdisp_553648785)
  enumsyszreg_553648938 = (when declared(enumsyszreg):
    enumsyszreg
   else:
    enumsyszreg_553648937)
  tms320c64xreg_553649076 = (when declared(tms320c64xreg):
    tms320c64xreg
   else:
    tms320c64xreg_553649075)
  enumcsactype_553648601 = (when declared(enumcsactype):
    enumcsactype
   else:
    enumcsactype_553648600)
  arm64extender_553648688 = (when declared(arm64extender):
    arm64extender
   else:
    arm64extender_553648687)
  structarm64opmem_553648746 = (when declared(structarm64opmem):
    structarm64opmem
   else:
    structarm64opmem_553648745)
  ppcinsn_553648888 = (when declared(ppcinsn):
    ppcinsn
   else:
    ppcinsn_553648887)
  cssparcop_553648916 = (when declared(cssparcop):
    cssparcop
   else:
    cssparcop_553648915)
  structcsoptmnem_553648585 = (when declared(structcsoptmnem):
    structcsoptmnem
   else:
    structcsoptmnem_553648584)
  enumarm64dcop_553648730 = (when declared(enumarm64dcop):
    enumarm64dcop
   else:
    enumarm64dcop_553648729)
  enumx86xopcc_553648970 = (when declared(enumx86xopcc):
    enumx86xopcc
   else:
    enumx86xopcc_553648969)
  enumx86insn_553649010 = (when declared(enumx86insn):
    enumx86insn
   else:
    enumx86insn_553649009)
  cstms320c64x_553649072 = (when declared(cstms320c64x):
    cstms320c64x
   else:
    cstms320c64x_553649071)
  structarmopmem_553648662 = (when declared(structarmopmem):
    structarmopmem
   else:
    structarmopmem_553648661)
  enumtms320c64xfunit_553649086 = (when declared(enumtms320c64xfunit):
    enumtms320c64xfunit
   else:
    enumtms320c64xfunit_553649085)
  enumsparcoptype_553648902 = (when declared(enumsparcoptype):
    enumsparcoptype
   else:
    enumsparcoptype_553648901)
  enumm68kcpusize_553648798 = (when declared(enumm68kcpusize):
    enumm68kcpusize
   else:
    enumm68kcpusize_553648797)
  enumm68kgrouptype_553648822 = (when declared(enumm68kgrouptype):
    enumm68kgrouptype
   else:
    enumm68kgrouptype_553648821)
  csarm64op_553648752 = (when declared(csarm64op):
    csarm64op
   else:
    csarm64op_553648751)
  structm680xoprel_553649102 = (when declared(structm680xoprel):
    structm680xoprel
   else:
    structm680xoprel_553649101)
  csm680xop_553649112 = (when declared(csm680xop):
    csm680xop
   else:
    csm680xop_553649111)
  ppcreg_553648868 = (when declared(ppcreg):
    ppcreg
   else:
    ppcreg_553648867)
  structcsx86_553649006 = (when declared(structcsx86):
    structcsx86
   else:
    structcsx86_553649005)
  enumarm64vess_553648710 = (when declared(enumarm64vess):
    enumarm64vess
   else:
    enumarm64vess_553648709)
  enummipsoptype_553648826 = (when declared(enummipsoptype):
    enummipsoptype
   else:
    enummipsoptype_553648825)
  csmipsop_553648840 = (when declared(csmipsop):
    csmipsop
   else:
    csmipsop_553648839)
  sparcopmem_553648912 = (when declared(sparcopmem):
    sparcopmem
   else:
    sparcopmem_553648911)
  armcpsflagtype_553648645 = (when declared(armcpsflagtype):
    armcpsflagtype
   else:
    armcpsflagtype_553648644)
  structcsm680xop_553649110 = (when declared(structcsm680xop):
    structcsm680xop
   else:
    structcsm680xop_553649109)
  enumsparchint_553648898 = (when declared(enumsparchint):
    enumsparchint
   else:
    enumsparchint_553648897)
  enumarmcpsmodetype_553648639 = (when declared(enumarmcpsmodetype):
    enumarmcpsmodetype
   else:
    enumarmcpsmodetype_553648638)
  syszcc_553648932 = (when declared(syszcc):
    syszcc
   else:
    syszcc_553648931)
  enumarmmembarrier_553648627 = (when declared(enumarmmembarrier):
    enumarmmembarrier
   else:
    enumarmmembarrier_553648626)
  arm64pstate_553648704 = (when declared(arm64pstate):
    arm64pstate
   else:
    arm64pstate_553648703)
  arm64opmem_553648748 = (when declared(arm64opmem):
    arm64opmem
   else:
    arm64opmem_553648747)
  sparcinsn_553648924 = (when declared(sparcinsn):
    sparcinsn
   else:
    sparcinsn_553648923)
  enumcsopttype_553648589 = (when declared(enumcsopttype):
    enumcsopttype
   else:
    enumcsopttype_553648588)
  m680xreg_553649092 = (when declared(m680xreg):
    m680xreg
   else:
    m680xreg_553649091)
  enumm68koptype_553648774 = (when declared(enumm68koptype):
    enumm68koptype
   else:
    enumm68koptype_553648773)
  armshifter_553648617 = (when declared(armshifter):
    armshifter
   else:
    armshifter_553648616)
  enumm68kreg_553648766 = (when declared(enumm68kreg):
    enumm68kreg
   else:
    enumm68kreg_553648765)
  structcsppc_553648882 = (when declared(structcsppc):
    structcsppc
   else:
    structcsppc_553648881)
  tms320c64xfunit_553649088 = (when declared(tms320c64xfunit):
    tms320c64xfunit
   else:
    tms320c64xfunit_553649087)
  csx86op_553649000 = (when declared(csx86op):
    csx86op
   else:
    csx86op_553648999)
  csfreet_553648577 = (when declared(csfreet):
    csfreet
   else:
    csfreet_553648576)
  tms320c64xmemmod_553649060 = (when declared(tms320c64xmemmod):
    tms320c64xmemmod
   else:
    tms320c64xmemmod_553649059)
  enumsyszinsngroup_553648958 = (when declared(enumsyszinsngroup):
    enumsyszinsngroup
   else:
    enumsyszinsngroup_553648957)
  structcssysz_553648950 = (when declared(structcssysz):
    structcssysz
   else:
    structcssysz_553648949)
  arm64prefetchop_553648740 = (when declared(arm64prefetchop):
    arm64prefetchop
   else:
    arm64prefetchop_553648739)
  enumcsgrouptype_553648605 = (when declared(enumcsgrouptype):
    enumcsgrouptype
   else:
    enumcsgrouptype_553648604)
  arm64dcop_553648732 = (when declared(arm64dcop):
    arm64dcop
   else:
    arm64dcop_553648731)
  arm64sysreg_553648696 = (when declared(arm64sysreg):
    arm64sysreg
   else:
    arm64sysreg_553648695)
  x86insngroup_553649016 = (when declared(x86insngroup):
    x86insngroup
   else:
    x86insngroup_553649015)
  structcsdetail_553649138 = (when declared(structcsdetail):
    structcsdetail
   else:
    structcsdetail_553649137)
  cssyszop_553648948 = (when declared(cssyszop):
    cssyszop
   else:
    cssyszop_553648947)
  tms320c64xinsn_553649080 = (when declared(tms320c64xinsn):
    tms320c64xinsn
   else:
    tms320c64xinsn_553649079)
  arm64icop_553648736 = (when declared(arm64icop):
    arm64icop
   else:
    arm64icop_553648735)
  enumarm64tlbiop_553648722 = (when declared(enumarm64tlbiop):
    enumarm64tlbiop
   else:
    enumarm64tlbiop_553648721)
  enumx86ssecc_553648978 = (when declared(enumx86ssecc):
    enumx86ssecc
   else:
    enumx86ssecc_553648977)
  csactype_553648603 = (when declared(csactype):
    csactype
   else:
    csactype_553648602)
  structcsarm64op_553648750 = (when declared(structcsarm64op):
    structcsarm64op
   else:
    structcsarm64op_553648749)
  csxcore_553649036 = (when declared(csxcore):
    csxcore
   else:
    csxcore_553649035)
  csarch_553648565 = (when declared(csarch):
    csarch
   else:
    csarch_553648564)
  enummipsinsngroup_553648850 = (when declared(enummipsinsngroup):
    enummipsinsngroup
   else:
    enummipsinsngroup_553648849)
  armoptype_553648633 = (when declared(armoptype):
    armoptype
   else:
    armoptype_553648632)
  armopmem_553648664 = (when declared(armopmem):
    armopmem
   else:
    armopmem_553648663)
  m68koptype_553648776 = (when declared(m68koptype):
    m68koptype
   else:
    m68koptype_553648775)
  m68kreg_553648768 = (when declared(m68kreg):
    m68kreg
   else:
    m68kreg_553648767)
  syszreg_553648940 = (when declared(syszreg):
    syszreg
   else:
    syszreg_553648939)
  armmembarrier_553648629 = (when declared(armmembarrier):
    armmembarrier
   else:
    armmembarrier_553648628)
  m68kfpusize_553648804 = (when declared(m68kfpusize):
    m68kfpusize
   else:
    m68kfpusize_553648803)
  structcsinsn_553649142 = (when declared(structcsinsn):
    structcsinsn
   else:
    structcsinsn_553649141)
  arm64vess_553648712 = (when declared(arm64vess):
    arm64vess
   else:
    arm64vess_553648711)
  enumx86avxcc_553648982 = (when declared(enumx86avxcc):
    enumx86avxcc
   else:
    enumx86avxcc_553648981)
  enumarm64insngroup_553648762 = (when declared(enumarm64insngroup):
    enumarm64insngroup
   else:
    enumarm64insngroup_553648761)
  enumarmsetendtype_553648635 = (when declared(enumarmsetendtype):
    enumarmsetendtype
   else:
    enumarmsetendtype_553648634)
  csopttype_553648591 = (when declared(csopttype):
    csopttype
   else:
    csopttype_553648590)
  arm64cc_553648692 = (when declared(arm64cc):
    arm64cc
   else:
    arm64cc_553648691)
  mipsoptype_553648828 = (when declared(mipsoptype):
    mipsoptype
   else:
    mipsoptype_553648827)
  structcssparcop_553648914 = (when declared(structcssparcop):
    structcssparcop
   else:
    structcssparcop_553648913)
  structcsoptskipdata_553648611 = (when declared(structcsoptskipdata):
    structcsoptskipdata
   else:
    structcsoptskipdata_553648610)
  sparcoptype_553648904 = (when declared(sparcoptype):
    sparcoptype
   else:
    sparcoptype_553648903)
  x86avxrm_553648988 = (when declared(x86avxrm):
    x86avxrm
   else:
    x86avxrm_553648987)
  m680xoprel_553649104 = (when declared(m680xoprel):
    m680xoprel
   else:
    m680xoprel_553649103)
  cstms320c64xop_553649068 = (when declared(cstms320c64xop):
    cstms320c64xop
   else:
    cstms320c64xop_553649067)
  csvsnprintft_553648579 = (when declared(csvsnprintft):
    csvsnprintft
   else:
    csvsnprintft_553648578)
  enumarm64msrreg_553648698 = (when declared(enumarm64msrreg):
    enumarm64msrreg
   else:
    enumarm64msrreg_553648697)
  enumarm64sysreg_553648694 = (when declared(enumarm64sysreg):
    enumarm64sysreg
   else:
    enumarm64sysreg_553648693)
  enumarm64prefetchop_553648738 = (when declared(enumarm64prefetchop):
    enumarm64prefetchop
   else:
    enumarm64prefetchop_553648737)
  enumarmreg_553648658 = (when declared(enumarmreg):
    enumarmreg
   else:
    enumarmreg_553648657)
  enumsparccc_553648894 = (when declared(enumsparccc):
    enumsparccc
   else:
    enumsparccc_553648893)
  m68kcpusize_553648800 = (when declared(m68kcpusize):
    m68kcpusize
   else:
    m68kcpusize_553648799)
  enumm68kopbrdispsize_553648782 = (when declared(enumm68kopbrdispsize):
    enumm68kopbrdispsize
   else:
    enumm68kopbrdispsize_553648781)
  x86xopcc_553648972 = (when declared(x86xopcc):
    x86xopcc
   else:
    x86xopcc_553648971)
  arm64insn_553648760 = (when declared(arm64insn):
    arm64insn
   else:
    arm64insn_553648759)
  x86avxcc_553648984 = (when declared(x86avxcc):
    x86avxcc
   else:
    x86avxcc_553648983)
  x86opmem_553648996 = (when declared(x86opmem):
    x86opmem
   else:
    x86opmem_553648995)
  structxcoreopmem_553649026 = (when declared(structxcoreopmem):
    structxcoreopmem
   else:
    structxcoreopmem_553649025)
  sparcreg_553648908 = (when declared(sparcreg):
    sparcreg
   else:
    sparcreg_553648907)
  structcsxcore_553649034 = (when declared(structcsxcore):
    structcsxcore
   else:
    structcsxcore_553649033)
  armsysreg_553648625 = (when declared(armsysreg):
    armsysreg
   else:
    armsysreg_553648624)
  x86reg_553648964 = (when declared(x86reg):
    x86reg
   else:
    x86reg_553648963)
  csregs_553649150 = (when declared(csregs):
    csregs
   else:
    csregs_553649149)
  structcsarmop_553648666 = (when declared(structcsarmop):
    structcsarmop
   else:
    structcsarmop_553648665)
  structcsm68k_553648814 = (when declared(structcsm68k):
    structcsm68k
   else:
    structcsm68k_553648813)
  enumm68ksizetype_553648806 = (when declared(enumm68ksizetype):
    enumm68ksizetype
   else:
    enumm68ksizetype_553648805)
  csarm64_553648756 = (when declared(csarm64):
    csarm64
   else:
    csarm64_553648755)
  enumtms320c64xinsngroup_553649082 = (when declared(enumtms320c64xinsngroup):
    enumtms320c64xinsngroup
   else:
    enumtms320c64xinsngroup_553649081)
  m68kopbrdispsize_553648784 = (when declared(m68kopbrdispsize):
    m68kopbrdispsize
   else:
    m68kopbrdispsize_553648783)
  xcoreinsn_553649040 = (when declared(xcoreinsn):
    xcoreinsn
   else:
    xcoreinsn_553649039)
  arm64insngroup_553648764 = (when declared(arm64insngroup):
    arm64insngroup
   else:
    arm64insngroup_553648763)
  mipsopmem_553648836 = (when declared(mipsopmem):
    mipsopmem
   else:
    mipsopmem_553648835)
  enumxcoreoptype_553649018 = (when declared(enumxcoreoptype):
    enumxcoreoptype
   else:
    enumxcoreoptype_553649017)
  arm64msrreg_553648700 = (when declared(arm64msrreg):
    arm64msrreg
   else:
    arm64msrreg_553648699)
  structcsppcop_553648878 = (when declared(structcsppcop):
    structcsppcop
   else:
    structcsppcop_553648877)
  structm680xopidx_553649098 = (when declared(structm680xopidx):
    structm680xopidx
   else:
    structm680xopidx_553649097)
  enumsparcinsngroup_553648926 = (when declared(enumsparcinsngroup):
    enumsparcinsngroup
   else:
    enumsparcinsngroup_553648925)
  structcsmipsop_553648838 = (when declared(structcsmipsop):
    structcsmipsop
   else:
    structcsmipsop_553648837)
  cssparc_553648920 = (when declared(cssparc):
    cssparc
   else:
    cssparc_553648919)
  x86avxbcast_553648976 = (when declared(x86avxbcast):
    x86avxbcast
   else:
    x86avxbcast_553648975)
  tms320c64xopmem_553649064 = (when declared(tms320c64xopmem):
    tms320c64xopmem
   else:
    tms320c64xopmem_553649063)
  enumm68kinsn_553648818 = (when declared(enumm68kinsn):
    enumm68kinsn
   else:
    enumm68kinsn_553648817)
  csh_553648561 = (when declared(csh):
    csh
   else:
    csh_553648559)
  m68kopmem_553648780 = (when declared(m68kopmem):
    m68kopmem
   else:
    m68kopmem_553648779)
  csx86_553649008 = (when declared(csx86):
    csx86
   else:
    csx86_553649007)
  csm680x_553649120 = (when declared(csm680x):
    csm680x
   else:
    csm680x_553649119)
  mipsinsn_553648848 = (when declared(mipsinsn):
    mipsinsn
   else:
    mipsinsn_553648847)
  armvectordatatype_553648656 = (when declared(armvectordatatype):
    armvectordatatype
   else:
    armvectordatatype_553648655)
  structcsm680x_553649118 = (when declared(structcsm680x):
    structcsm680x
   else:
    structcsm680x_553649117)
  enumm680xreg_553649090 = (when declared(enumm680xreg):
    enumm680xreg
   else:
    enumm680xreg_553649089)
  csgrouptype_553648607 = (when declared(csgrouptype):
    csgrouptype
   else:
    csgrouptype_553648606)
  ppcoptype_553648864 = (when declared(ppcoptype):
    ppcoptype
   else:
    ppcoptype_553648863)
  arm64vas_553648708 = (when declared(arm64vas):
    arm64vas
   else:
    arm64vas_553648707)
  mipsreg_553648832 = (when declared(mipsreg):
    mipsreg
   else:
    mipsreg_553648831)
  enumcsoptvalue_553648593 = (when declared(enumcsoptvalue):
    enumcsoptvalue
   else:
    enumcsoptvalue_553648592)
  enumppcbh_553648858 = (when declared(enumppcbh):
    enumppcbh
   else:
    enumppcbh_553648857)
  structsyszopmem_553648942 = (when declared(structsyszopmem):
    structsyszopmem
   else:
    structsyszopmem_553648941)
  enumarmsysreg_553648623 = (when declared(enumarmsysreg):
    enumarmsysreg
   else:
    enumarmsysreg_553648622)
  csoptmem_553648583 = (when declared(csoptmem):
    csoptmem
   else:
    csoptmem_553648582)
  enumm68kfpusize_553648802 = (when declared(enumm68kfpusize):
    enumm68kfpusize
   else:
    enumm68kfpusize_553648801)
  enumx86reg_553648962 = (when declared(enumx86reg):
    enumx86reg
   else:
    enumx86reg_553648961)
  structsparcopmem_553648910 = (when declared(structsparcopmem):
    structsparcopmem
   else:
    structsparcopmem_553648909)
  csoptvalue_553648595 = (when declared(csoptvalue):
    csoptvalue
   else:
    csoptvalue_553648594)
  structmipsopmem_553648834 = (when declared(structmipsopmem):
    structmipsopmem
   else:
    structmipsopmem_553648833)
  ppcopmem_553648872 = (when declared(ppcopmem):
    ppcopmem
   else:
    ppcopmem_553648871)
  x86optype_553648968 = (when declared(x86optype):
    x86optype
   else:
    x86optype_553648967)
  arm64optype_553648720 = (when declared(arm64optype):
    arm64optype
   else:
    arm64optype_553648719)
  armcpsmodetype_553648641 = (when declared(armcpsmodetype):
    armcpsmodetype
   else:
    armcpsmodetype_553648640)
  m680xinsn_553649124 = (when declared(m680xinsn):
    m680xinsn
   else:
    m680xinsn_553649123)
  ppcopcrx_553648876 = (when declared(ppcopcrx):
    ppcopcrx
   else:
    ppcopcrx_553648875)
  m68kopbrdisp_553648788 = (when declared(m68kopbrdisp):
    m68kopbrdisp
   else:
    m68kopbrdisp_553648787)
  structcsevm_553649126 = (when declared(structcsevm):
    structcsevm
   else:
    structcsevm_553649125)
  enumppcinsngroup_553648890 = (when declared(enumppcinsngroup):
    enumppcinsngroup
   else:
    enumppcinsngroup_553648889)
  arm64atop_553648728 = (when declared(arm64atop):
    arm64atop
   else:
    arm64atop_553648727)
  enumtms320c64xmemmod_553649058 = (when declared(enumtms320c64xmemmod):
    enumtms320c64xmemmod
   else:
    enumtms320c64xmemmod_553649057)
  enumarm64shifter_553648682 = (when declared(enumarm64shifter):
    enumarm64shifter
   else:
    enumarm64shifter_553648681)
  m680xopidx_553649100 = (when declared(m680xopidx):
    m680xopidx
   else:
    m680xopidx_553649099)
  enumarm64pstate_553648702 = (when declared(enumarm64pstate):
    enumarm64pstate
   else:
    enumarm64pstate_553648701)
  enumarmvectordatatype_553648654 = (when declared(enumarmvectordatatype):
    enumarmvectordatatype
   else:
    enumarmvectordatatype_553648646)
  mipsinsngroup_553648852 = (when declared(mipsinsngroup):
    mipsinsngroup
   else:
    mipsinsngroup_553648851)
  structm68kopsize_553648810 = (when declared(structm68kopsize):
    structm68kopsize
   else:
    structm68kopsize_553648809)
  enumppcbc_553648854 = (when declared(enumppcbc):
    enumppcbc
   else:
    enumppcbc_553648853)
  enumsyszoptype_553648934 = (when declared(enumsyszoptype):
    enumsyszoptype
   else:
    enumsyszoptype_553648933)
  tms320c64xoptype_553649048 = (when declared(tms320c64xoptype):
    tms320c64xoptype
   else:
    tms320c64xoptype_553649047)
  arminsngroup_553648680 = (when declared(arminsngroup):
    arminsngroup
   else:
    arminsngroup_553648679)
  enumarm64optype_553648718 = (when declared(enumarm64optype):
    enumarm64optype
   else:
    enumarm64optype_553648717)
  structcsm68kop_553648794 = (when declared(structcsm68kop):
    structcsm68kop
   else:
    structcsm68kop_553648793)
  sparchint_553648900 = (when declared(sparchint):
    sparchint
   else:
    sparchint_553648899)
  structcsx86op_553648998 = (when declared(structcsx86op):
    structcsx86op
   else:
    structcsx86op_553648997)
  enumppcoptype_553648862 = (when declared(enumppcoptype):
    enumppcoptype
   else:
    enumppcoptype_553648861)
  enumxcoreinsngroup_553649042 = (when declared(enumxcoreinsngroup):
    enumxcoreinsngroup
   else:
    enumxcoreinsngroup_553649041)
  enumm680xgrouptype_553649114 = (when declared(enumm680xgrouptype):
    enumm680xgrouptype
   else:
    enumm680xgrouptype_553649113)
  enumarmcpsflagtype_553648643 = (when declared(enumarmcpsflagtype):
    enumarmcpsflagtype
   else:
    enumarmcpsflagtype_553648642)
  csevm_553649128 = (when declared(csevm):
    csevm
   else:
    csevm_553649127)
  x86prefix_553648992 = (when declared(x86prefix):
    x86prefix
   else:
    x86prefix_553648991)
  enumm680xoptype_553649094 = (when declared(enumm680xoptype):
    enumm680xoptype
   else:
    enumm680xoptype_553649093)
  structppcopmem_553648870 = (when declared(structppcopmem):
    structppcopmem
   else:
    structppcopmem_553648869)
  xcoreopmem_553649028 = (when declared(xcoreopmem):
    xcoreopmem
   else:
    xcoreopmem_553649027)
  enumtms320c64xmemdir_553649054 = (when declared(enumtms320c64xmemdir):
    enumtms320c64xmemdir
   else:
    enumtms320c64xmemdir_553649053)
  enumarm64insn_553648758 = (when declared(enumarm64insn):
    enumarm64insn
   else:
    enumarm64insn_553648757)
  csm68k_553648816 = (when declared(csm68k):
    csm68k
   else:
    csm68k_553648815)
  cscalloct_553648573 = (when declared(cscalloct):
    cscalloct
   else:
    cscalloct_553648572)
  enumevminsn_553649130 = (when declared(enumevminsn):
    enumevminsn
   else:
    enumevminsn_553649129)
  xcorereg_553649024 = (when declared(xcorereg):
    xcorereg
   else:
    xcorereg_553649023)
  csx86encoding_553649004 = (when declared(csx86encoding):
    csx86encoding
   else:
    csx86encoding_553649003)
  enumtms320c64xmemdisp_553649050 = (when declared(enumtms320c64xmemdisp):
    enumtms320c64xmemdisp
   else:
    enumtms320c64xmemdisp_553649049)
  structcstms320c64xop_553649066 = (when declared(structcstms320c64xop):
    structcstms320c64xop
   else:
    structcstms320c64xop_553649065)
  enummipsreg_553648830 = (when declared(enummipsreg):
    enummipsreg
   else:
    enummipsreg_553648829)
  ppcbh_553648860 = (when declared(ppcbh):
    ppcbh
   else:
    ppcbh_553648859)
  enumtms320c64xreg_553649074 = (when declared(enumtms320c64xreg):
    enumtms320c64xreg
   else:
    enumtms320c64xreg_553649073)
  enumarmoptype_553648631 = (when declared(enumarmoptype):
    enumarmoptype
   else:
    enumarmoptype_553648630)
  sparccc_553648896 = (when declared(sparccc):
    sparccc
   else:
    sparccc_553648895)
  enumtms320c64xoptype_553649046 = (when declared(enumtms320c64xoptype):
    enumtms320c64xoptype
   else:
    enumtms320c64xoptype_553649045)
  enumx86prefix_553648990 = (when declared(enumx86prefix):
    enumx86prefix
   else:
    enumx86prefix_553648989)
  enumarm64extender_553648686 = (when declared(enumarm64extender):
    enumarm64extender
   else:
    enumarm64extender_553648685)
  enumx86avxrm_553648986 = (when declared(enumx86avxrm):
    enumx86avxrm
   else:
    enumx86avxrm_553648985)
  xcoreoptype_553649020 = (when declared(xcoreoptype):
    xcoreoptype
   else:
    xcoreoptype_553649019)
  sparcinsngroup_553648928 = (when declared(sparcinsngroup):
    sparcinsngroup
   else:
    sparcinsngroup_553648927)
  x86insn_553649012 = (when declared(x86insn):
    x86insn
   else:
    x86insn_553649011)
  enumevminsngroup_553649134 = (when declared(enumevminsngroup):
    enumevminsngroup
   else:
    enumevminsngroup_553649133)
  m680xgrouptype_553649116 = (when declared(m680xgrouptype):
    m680xgrouptype
   else:
    m680xgrouptype_553649115)
  csoptmnem_553648587 = (when declared(csoptmnem):
    csoptmnem
   else:
    csoptmnem_553648586)
  structcsxcoreop_553649030 = (when declared(structcsxcoreop):
    structcsxcoreop
   else:
    structcsxcoreop_553649029)
  m68kinsn_553648820 = (when declared(m68kinsn):
    m68kinsn
   else:
    m68kinsn_553648819)
  cssysz_553648952 = (when declared(cssysz):
    cssysz
   else:
    cssysz_553648951)
  syszinsngroup_553648960 = (when declared(syszinsngroup):
    syszinsngroup
   else:
    syszinsngroup_553648959)
  arm64shifter_553648684 = (when declared(arm64shifter):
    arm64shifter
   else:
    arm64shifter_553648683)
  csmips_553648844 = (when declared(csmips):
    csmips
   else:
    csmips_553648843)
  enumsyszinsn_553648954 = (when declared(enumsyszinsn):
    enumsyszinsn
   else:
    enumsyszinsn_553648953)
  csrealloct_553648575 = (when declared(csrealloct):
    csrealloct
   else:
    csrealloct_553648574)
  tms320c64xinsngroup_553649084 = (when declared(tms320c64xinsngroup):
    tms320c64xinsngroup
   else:
    tms320c64xinsngroup_553649083)
  enumarm64icop_553648734 = (when declared(enumarm64icop):
    enumarm64icop
   else:
    enumarm64icop_553648733)
  evminsn_553649132 = (when declared(evminsn):
    evminsn
   else:
    evminsn_553649131)
  enumarmcc_553648619 = (when declared(enumarmcc):
    enumarmcc
   else:
    enumarmcc_553648618)
  enumcserr_553649146 = (when declared(enumcserr):
    enumcserr
   else:
    enumcserr_553649145)
when not declared(m68kopsize):
  type
    m68kopsize* = m68kopsize_553648811
else:
  static :
    hint("Declaration of " & "m68kopsize" & " already exists, not redeclaring")
when not declared(m68kaddressmode):
  type
    m68kaddressmode* = m68kaddressmode_553648771
else:
  static :
    hint("Declaration of " & "m68kaddressmode" &
        " already exists, not redeclaring")
when not declared(csoptskipdata):
  type
    csoptskipdata* = csoptskipdata_553648612
else:
  static :
    hint("Declaration of " & "csoptskipdata" &
        " already exists, not redeclaring")
when not declared(arminsn):
  type
    arminsn* = arminsn_553648675
else:
  static :
    hint("Declaration of " & "arminsn" & " already exists, not redeclaring")
when not declared(structm680xopext):
  type
    structm680xopext* = structm680xopext_553649105
else:
  static :
    hint("Declaration of " & "structm680xopext" &
        " already exists, not redeclaring")
when not declared(csdetail):
  type
    csdetail* = csdetail_553649139
else:
  static :
    hint("Declaration of " & "csdetail" & " already exists, not redeclaring")
when not declared(m68kgrouptype):
  type
    m68kgrouptype* = m68kgrouptype_553648823
else:
  static :
    hint("Declaration of " & "m68kgrouptype" &
        " already exists, not redeclaring")
when not declared(csppcop):
  type
    csppcop* = csppcop_553648879
else:
  static :
    hint("Declaration of " & "csppcop" & " already exists, not redeclaring")
when not declared(m680xopext):
  type
    m680xopext* = m680xopext_553649107
else:
  static :
    hint("Declaration of " & "m680xopext" & " already exists, not redeclaring")
when not declared(cserr):
  type
    cserr* = cserr_553649147
else:
  static :
    hint("Declaration of " & "cserr" & " already exists, not redeclaring")
when not declared(csmalloct):
  type
    csmalloct* = csmalloct_553648570
else:
  static :
    hint("Declaration of " & "csmalloct" & " already exists, not redeclaring")
when not declared(syszinsn):
  type
    syszinsn* = syszinsn_553648955
else:
  static :
    hint("Declaration of " & "syszinsn" & " already exists, not redeclaring")
when not declared(csarm):
  type
    csarm* = csarm_553648671
else:
  static :
    hint("Declaration of " & "csarm" & " already exists, not redeclaring")
when not declared(csxcoreop):
  type
    csxcoreop* = csxcoreop_553649031
else:
  static :
    hint("Declaration of " & "csxcoreop" & " already exists, not redeclaring")
when not declared(csm68kop):
  type
    csm68kop* = csm68kop_553648795
else:
  static :
    hint("Declaration of " & "csm68kop" & " already exists, not redeclaring")
when not declared(xcoreinsngroup):
  type
    xcoreinsngroup* = xcoreinsngroup_553649043
else:
  static :
    hint("Declaration of " & "xcoreinsngroup" &
        " already exists, not redeclaring")
when not declared(ppcinsngroup):
  type
    ppcinsngroup* = ppcinsngroup_553648891
else:
  static :
    hint("Declaration of " & "ppcinsngroup" & " already exists, not redeclaring")
when not declared(armsetendtype):
  type
    armsetendtype* = armsetendtype_553648636
else:
  static :
    hint("Declaration of " & "armsetendtype" &
        " already exists, not redeclaring")
when not declared(tms320c64xmemdisp):
  type
    tms320c64xmemdisp* = tms320c64xmemdisp_553649051
else:
  static :
    hint("Declaration of " & "tms320c64xmemdisp" &
        " already exists, not redeclaring")
when not declared(structtms320c64xopmem):
  type
    structtms320c64xopmem* = structtms320c64xopmem_553649061
else:
  static :
    hint("Declaration of " & "structtms320c64xopmem" &
        " already exists, not redeclaring")
when not declared(csskipdatacbt):
  type
    csskipdatacbt* = csskipdatacbt_553648608
else:
  static :
    hint("Declaration of " & "csskipdatacbt" &
        " already exists, not redeclaring")
when not declared(arm64reg):
  type
    arm64reg* = arm64reg_553648743
else:
  static :
    hint("Declaration of " & "arm64reg" & " already exists, not redeclaring")
when not declared(syszopmem):
  type
    syszopmem* = syszopmem_553648943
else:
  static :
    hint("Declaration of " & "syszopmem" & " already exists, not redeclaring")
when not declared(syszoptype):
  type
    syszoptype* = syszoptype_553648935
else:
  static :
    hint("Declaration of " & "syszoptype" & " already exists, not redeclaring")
when not declared(tms320c64xmemdir):
  type
    tms320c64xmemdir* = tms320c64xmemdir_553649055
else:
  static :
    hint("Declaration of " & "tms320c64xmemdir" &
        " already exists, not redeclaring")
when not declared(structppcopcrx):
  type
    structppcopcrx* = structppcopcrx_553648873
else:
  static :
    hint("Declaration of " & "structppcopcrx" &
        " already exists, not redeclaring")
when not declared(arm64barrierop):
  type
    arm64barrierop* = arm64barrierop_553648715
else:
  static :
    hint("Declaration of " & "arm64barrierop" &
        " already exists, not redeclaring")
when not declared(arm64tlbiop):
  type
    arm64tlbiop* = arm64tlbiop_553648723
else:
  static :
    hint("Declaration of " & "arm64tlbiop" & " already exists, not redeclaring")
when not declared(x86ssecc):
  type
    x86ssecc* = x86ssecc_553648979
else:
  static :
    hint("Declaration of " & "x86ssecc" & " already exists, not redeclaring")
when not declared(armcc):
  type
    armcc* = armcc_553648620
else:
  static :
    hint("Declaration of " & "armcc" & " already exists, not redeclaring")
when not declared(structcsm68kopregpair):
  type
    structcsm68kopregpair* = structcsm68kopregpair_553648789
else:
  static :
    hint("Declaration of " & "structcsm68kopregpair" &
        " already exists, not redeclaring")
when not declared(structm68kopmem):
  type
    structm68kopmem* = structm68kopmem_553648777
else:
  static :
    hint("Declaration of " & "structm68kopmem" &
        " already exists, not redeclaring")
when not declared(csoptype):
  type
    csoptype* = csoptype_553648598
else:
  static :
    hint("Declaration of " & "csoptype" & " already exists, not redeclaring")
when not declared(structx86opmem):
  type
    structx86opmem* = structx86opmem_553648993
else:
  static :
    hint("Declaration of " & "structx86opmem" &
        " already exists, not redeclaring")
when not declared(csarmop):
  type
    csarmop* = csarmop_553648667
else:
  static :
    hint("Declaration of " & "csarmop" & " already exists, not redeclaring")
when not declared(armreg):
  type
    armreg* = armreg_553648659
else:
  static :
    hint("Declaration of " & "armreg" & " already exists, not redeclaring")
when not declared(structcstms320c64x):
  type
    structcstms320c64x* = structcstms320c64x_553649069
else:
  static :
    hint("Declaration of " & "structcstms320c64x" &
        " already exists, not redeclaring")
when not declared(structcsmips):
  type
    structcsmips* = structcsmips_553648841
else:
  static :
    hint("Declaration of " & "structcsmips" & " already exists, not redeclaring")
when not declared(csinsn):
  type
    csinsn* = csinsn_553649143
else:
  static :
    hint("Declaration of " & "csinsn" & " already exists, not redeclaring")
when not declared(csmode):
  type
    csmode* = csmode_553648568
else:
  static :
    hint("Declaration of " & "csmode" & " already exists, not redeclaring")
when not declared(evminsngroup):
  type
    evminsngroup* = evminsngroup_553649135
else:
  static :
    hint("Declaration of " & "evminsngroup" & " already exists, not redeclaring")
when not declared(structcssparc):
  type
    structcssparc* = structcssparc_553648917
else:
  static :
    hint("Declaration of " & "structcssparc" &
        " already exists, not redeclaring")
when not declared(structcsarm):
  type
    structcsarm* = structcsarm_553648669
else:
  static :
    hint("Declaration of " & "structcsarm" & " already exists, not redeclaring")
when not declared(structcssyszop):
  type
    structcssyszop* = structcssyszop_553648945
else:
  static :
    hint("Declaration of " & "structcssyszop" &
        " already exists, not redeclaring")
when not declared(m680xoptype):
  type
    m680xoptype* = m680xoptype_553649095
else:
  static :
    hint("Declaration of " & "m680xoptype" & " already exists, not redeclaring")
when not declared(ppcbc):
  type
    ppcbc* = ppcbc_553648855
else:
  static :
    hint("Declaration of " & "ppcbc" & " already exists, not redeclaring")
when not declared(structcsarm64):
  type
    structcsarm64* = structcsarm64_553648753
else:
  static :
    hint("Declaration of " & "structcsarm64" &
        " already exists, not redeclaring")
when not declared(csm68kopregpair):
  type
    csm68kopregpair* = csm68kopregpair_553648791
else:
  static :
    hint("Declaration of " & "csm68kopregpair" &
        " already exists, not redeclaring")
when not declared(m68ksizetype):
  type
    m68ksizetype* = m68ksizetype_553648807
else:
  static :
    hint("Declaration of " & "m68ksizetype" & " already exists, not redeclaring")
when not declared(structcsoptmem):
  type
    structcsoptmem* = structcsoptmem_553648580
else:
  static :
    hint("Declaration of " & "structcsoptmem" &
        " already exists, not redeclaring")
when not declared(csppc):
  type
    csppc* = csppc_553648883
else:
  static :
    hint("Declaration of " & "csppc" & " already exists, not redeclaring")
when not declared(structcsx86encoding):
  type
    structcsx86encoding* = structcsx86encoding_553649001
else:
  static :
    hint("Declaration of " & "structcsx86encoding" &
        " already exists, not redeclaring")
when not declared(structm68kopbrdisp):
  type
    structm68kopbrdisp* = structm68kopbrdisp_553648785
else:
  static :
    hint("Declaration of " & "structm68kopbrdisp" &
        " already exists, not redeclaring")
when not declared(tms320c64xreg):
  type
    tms320c64xreg* = tms320c64xreg_553649075
else:
  static :
    hint("Declaration of " & "tms320c64xreg" &
        " already exists, not redeclaring")
when not declared(arm64extender):
  type
    arm64extender* = arm64extender_553648687
else:
  static :
    hint("Declaration of " & "arm64extender" &
        " already exists, not redeclaring")
when not declared(structarm64opmem):
  type
    structarm64opmem* = structarm64opmem_553648745
else:
  static :
    hint("Declaration of " & "structarm64opmem" &
        " already exists, not redeclaring")
when not declared(ppcinsn):
  type
    ppcinsn* = ppcinsn_553648887
else:
  static :
    hint("Declaration of " & "ppcinsn" & " already exists, not redeclaring")
when not declared(cssparcop):
  type
    cssparcop* = cssparcop_553648915
else:
  static :
    hint("Declaration of " & "cssparcop" & " already exists, not redeclaring")
when not declared(structcsoptmnem):
  type
    structcsoptmnem* = structcsoptmnem_553648584
else:
  static :
    hint("Declaration of " & "structcsoptmnem" &
        " already exists, not redeclaring")
when not declared(cstms320c64x):
  type
    cstms320c64x* = cstms320c64x_553649071
else:
  static :
    hint("Declaration of " & "cstms320c64x" & " already exists, not redeclaring")
when not declared(structarmopmem):
  type
    structarmopmem* = structarmopmem_553648661
else:
  static :
    hint("Declaration of " & "structarmopmem" &
        " already exists, not redeclaring")
when not declared(csarm64op):
  type
    csarm64op* = csarm64op_553648751
else:
  static :
    hint("Declaration of " & "csarm64op" & " already exists, not redeclaring")
when not declared(structm680xoprel):
  type
    structm680xoprel* = structm680xoprel_553649101
else:
  static :
    hint("Declaration of " & "structm680xoprel" &
        " already exists, not redeclaring")
when not declared(csm680xop):
  type
    csm680xop* = csm680xop_553649111
else:
  static :
    hint("Declaration of " & "csm680xop" & " already exists, not redeclaring")
when not declared(ppcreg):
  type
    ppcreg* = ppcreg_553648867
else:
  static :
    hint("Declaration of " & "ppcreg" & " already exists, not redeclaring")
when not declared(structcsx86):
  type
    structcsx86* = structcsx86_553649005
else:
  static :
    hint("Declaration of " & "structcsx86" & " already exists, not redeclaring")
when not declared(csmipsop):
  type
    csmipsop* = csmipsop_553648839
else:
  static :
    hint("Declaration of " & "csmipsop" & " already exists, not redeclaring")
when not declared(sparcopmem):
  type
    sparcopmem* = sparcopmem_553648911
else:
  static :
    hint("Declaration of " & "sparcopmem" & " already exists, not redeclaring")
when not declared(armcpsflagtype):
  type
    armcpsflagtype* = armcpsflagtype_553648644
else:
  static :
    hint("Declaration of " & "armcpsflagtype" &
        " already exists, not redeclaring")
when not declared(structcsm680xop):
  type
    structcsm680xop* = structcsm680xop_553649109
else:
  static :
    hint("Declaration of " & "structcsm680xop" &
        " already exists, not redeclaring")
when not declared(syszcc):
  type
    syszcc* = syszcc_553648931
else:
  static :
    hint("Declaration of " & "syszcc" & " already exists, not redeclaring")
when not declared(arm64pstate):
  type
    arm64pstate* = arm64pstate_553648703
else:
  static :
    hint("Declaration of " & "arm64pstate" & " already exists, not redeclaring")
when not declared(arm64opmem):
  type
    arm64opmem* = arm64opmem_553648747
else:
  static :
    hint("Declaration of " & "arm64opmem" & " already exists, not redeclaring")
when not declared(sparcinsn):
  type
    sparcinsn* = sparcinsn_553648923
else:
  static :
    hint("Declaration of " & "sparcinsn" & " already exists, not redeclaring")
when not declared(m680xreg):
  type
    m680xreg* = m680xreg_553649091
else:
  static :
    hint("Declaration of " & "m680xreg" & " already exists, not redeclaring")
when not declared(armshifter):
  type
    armshifter* = armshifter_553648616
else:
  static :
    hint("Declaration of " & "armshifter" & " already exists, not redeclaring")
when not declared(structcsppc):
  type
    structcsppc* = structcsppc_553648881
else:
  static :
    hint("Declaration of " & "structcsppc" & " already exists, not redeclaring")
when not declared(tms320c64xfunit):
  type
    tms320c64xfunit* = tms320c64xfunit_553649087
else:
  static :
    hint("Declaration of " & "tms320c64xfunit" &
        " already exists, not redeclaring")
when not declared(csx86op):
  type
    csx86op* = csx86op_553648999
else:
  static :
    hint("Declaration of " & "csx86op" & " already exists, not redeclaring")
when not declared(csfreet):
  type
    csfreet* = csfreet_553648576
else:
  static :
    hint("Declaration of " & "csfreet" & " already exists, not redeclaring")
when not declared(tms320c64xmemmod):
  type
    tms320c64xmemmod* = tms320c64xmemmod_553649059
else:
  static :
    hint("Declaration of " & "tms320c64xmemmod" &
        " already exists, not redeclaring")
when not declared(structcssysz):
  type
    structcssysz* = structcssysz_553648949
else:
  static :
    hint("Declaration of " & "structcssysz" & " already exists, not redeclaring")
when not declared(arm64prefetchop):
  type
    arm64prefetchop* = arm64prefetchop_553648739
else:
  static :
    hint("Declaration of " & "arm64prefetchop" &
        " already exists, not redeclaring")
when not declared(arm64dcop):
  type
    arm64dcop* = arm64dcop_553648731
else:
  static :
    hint("Declaration of " & "arm64dcop" & " already exists, not redeclaring")
when not declared(arm64sysreg):
  type
    arm64sysreg* = arm64sysreg_553648695
else:
  static :
    hint("Declaration of " & "arm64sysreg" & " already exists, not redeclaring")
when not declared(x86insngroup):
  type
    x86insngroup* = x86insngroup_553649015
else:
  static :
    hint("Declaration of " & "x86insngroup" & " already exists, not redeclaring")
when not declared(structcsdetail):
  type
    structcsdetail* = structcsdetail_553649137
else:
  static :
    hint("Declaration of " & "structcsdetail" &
        " already exists, not redeclaring")
when not declared(cssyszop):
  type
    cssyszop* = cssyszop_553648947
else:
  static :
    hint("Declaration of " & "cssyszop" & " already exists, not redeclaring")
when not declared(tms320c64xinsn):
  type
    tms320c64xinsn* = tms320c64xinsn_553649079
else:
  static :
    hint("Declaration of " & "tms320c64xinsn" &
        " already exists, not redeclaring")
when not declared(arm64icop):
  type
    arm64icop* = arm64icop_553648735
else:
  static :
    hint("Declaration of " & "arm64icop" & " already exists, not redeclaring")
when not declared(csactype):
  type
    csactype* = csactype_553648602
else:
  static :
    hint("Declaration of " & "csactype" & " already exists, not redeclaring")
when not declared(structcsarm64op):
  type
    structcsarm64op* = structcsarm64op_553648749
else:
  static :
    hint("Declaration of " & "structcsarm64op" &
        " already exists, not redeclaring")
when not declared(csxcore):
  type
    csxcore* = csxcore_553649035
else:
  static :
    hint("Declaration of " & "csxcore" & " already exists, not redeclaring")
when not declared(csarch):
  type
    csarch* = csarch_553648564
else:
  static :
    hint("Declaration of " & "csarch" & " already exists, not redeclaring")
when not declared(armoptype):
  type
    armoptype* = armoptype_553648632
else:
  static :
    hint("Declaration of " & "armoptype" & " already exists, not redeclaring")
when not declared(armopmem):
  type
    armopmem* = armopmem_553648663
else:
  static :
    hint("Declaration of " & "armopmem" & " already exists, not redeclaring")
when not declared(m68koptype):
  type
    m68koptype* = m68koptype_553648775
else:
  static :
    hint("Declaration of " & "m68koptype" & " already exists, not redeclaring")
when not declared(m68kreg):
  type
    m68kreg* = m68kreg_553648767
else:
  static :
    hint("Declaration of " & "m68kreg" & " already exists, not redeclaring")
when not declared(syszreg):
  type
    syszreg* = syszreg_553648939
else:
  static :
    hint("Declaration of " & "syszreg" & " already exists, not redeclaring")
when not declared(armmembarrier):
  type
    armmembarrier* = armmembarrier_553648628
else:
  static :
    hint("Declaration of " & "armmembarrier" &
        " already exists, not redeclaring")
when not declared(m68kfpusize):
  type
    m68kfpusize* = m68kfpusize_553648803
else:
  static :
    hint("Declaration of " & "m68kfpusize" & " already exists, not redeclaring")
when not declared(structcsinsn):
  type
    structcsinsn* = structcsinsn_553649141
else:
  static :
    hint("Declaration of " & "structcsinsn" & " already exists, not redeclaring")
when not declared(arm64vess):
  type
    arm64vess* = arm64vess_553648711
else:
  static :
    hint("Declaration of " & "arm64vess" & " already exists, not redeclaring")
when not declared(csopttype):
  type
    csopttype* = csopttype_553648590
else:
  static :
    hint("Declaration of " & "csopttype" & " already exists, not redeclaring")
when not declared(arm64cc):
  type
    arm64cc* = arm64cc_553648691
else:
  static :
    hint("Declaration of " & "arm64cc" & " already exists, not redeclaring")
when not declared(mipsoptype):
  type
    mipsoptype* = mipsoptype_553648827
else:
  static :
    hint("Declaration of " & "mipsoptype" & " already exists, not redeclaring")
when not declared(structcssparcop):
  type
    structcssparcop* = structcssparcop_553648913
else:
  static :
    hint("Declaration of " & "structcssparcop" &
        " already exists, not redeclaring")
when not declared(structcsoptskipdata):
  type
    structcsoptskipdata* = structcsoptskipdata_553648610
else:
  static :
    hint("Declaration of " & "structcsoptskipdata" &
        " already exists, not redeclaring")
when not declared(sparcoptype):
  type
    sparcoptype* = sparcoptype_553648903
else:
  static :
    hint("Declaration of " & "sparcoptype" & " already exists, not redeclaring")
when not declared(x86avxrm):
  type
    x86avxrm* = x86avxrm_553648987
else:
  static :
    hint("Declaration of " & "x86avxrm" & " already exists, not redeclaring")
when not declared(m680xoprel):
  type
    m680xoprel* = m680xoprel_553649103
else:
  static :
    hint("Declaration of " & "m680xoprel" & " already exists, not redeclaring")
when not declared(cstms320c64xop):
  type
    cstms320c64xop* = cstms320c64xop_553649067
else:
  static :
    hint("Declaration of " & "cstms320c64xop" &
        " already exists, not redeclaring")
when not declared(csvsnprintft):
  type
    csvsnprintft* = csvsnprintft_553648578
else:
  static :
    hint("Declaration of " & "csvsnprintft" & " already exists, not redeclaring")
when not declared(m68kcpusize):
  type
    m68kcpusize* = m68kcpusize_553648799
else:
  static :
    hint("Declaration of " & "m68kcpusize" & " already exists, not redeclaring")
when not declared(x86xopcc):
  type
    x86xopcc* = x86xopcc_553648971
else:
  static :
    hint("Declaration of " & "x86xopcc" & " already exists, not redeclaring")
when not declared(arm64insn):
  type
    arm64insn* = arm64insn_553648759
else:
  static :
    hint("Declaration of " & "arm64insn" & " already exists, not redeclaring")
when not declared(x86avxcc):
  type
    x86avxcc* = x86avxcc_553648983
else:
  static :
    hint("Declaration of " & "x86avxcc" & " already exists, not redeclaring")
when not declared(x86opmem):
  type
    x86opmem* = x86opmem_553648995
else:
  static :
    hint("Declaration of " & "x86opmem" & " already exists, not redeclaring")
when not declared(structxcoreopmem):
  type
    structxcoreopmem* = structxcoreopmem_553649025
else:
  static :
    hint("Declaration of " & "structxcoreopmem" &
        " already exists, not redeclaring")
when not declared(sparcreg):
  type
    sparcreg* = sparcreg_553648907
else:
  static :
    hint("Declaration of " & "sparcreg" & " already exists, not redeclaring")
when not declared(structcsxcore):
  type
    structcsxcore* = structcsxcore_553649033
else:
  static :
    hint("Declaration of " & "structcsxcore" &
        " already exists, not redeclaring")
when not declared(armsysreg):
  type
    armsysreg* = armsysreg_553648624
else:
  static :
    hint("Declaration of " & "armsysreg" & " already exists, not redeclaring")
when not declared(x86reg):
  type
    x86reg* = x86reg_553648963
else:
  static :
    hint("Declaration of " & "x86reg" & " already exists, not redeclaring")
when not declared(csregs):
  type
    csregs* = csregs_553649149
else:
  static :
    hint("Declaration of " & "csregs" & " already exists, not redeclaring")
when not declared(structcsarmop):
  type
    structcsarmop* = structcsarmop_553648665
else:
  static :
    hint("Declaration of " & "structcsarmop" &
        " already exists, not redeclaring")
when not declared(structcsm68k):
  type
    structcsm68k* = structcsm68k_553648813
else:
  static :
    hint("Declaration of " & "structcsm68k" & " already exists, not redeclaring")
when not declared(csarm64):
  type
    csarm64* = csarm64_553648755
else:
  static :
    hint("Declaration of " & "csarm64" & " already exists, not redeclaring")
when not declared(m68kopbrdispsize):
  type
    m68kopbrdispsize* = m68kopbrdispsize_553648783
else:
  static :
    hint("Declaration of " & "m68kopbrdispsize" &
        " already exists, not redeclaring")
when not declared(xcoreinsn):
  type
    xcoreinsn* = xcoreinsn_553649039
else:
  static :
    hint("Declaration of " & "xcoreinsn" & " already exists, not redeclaring")
when not declared(arm64insngroup):
  type
    arm64insngroup* = arm64insngroup_553648763
else:
  static :
    hint("Declaration of " & "arm64insngroup" &
        " already exists, not redeclaring")
when not declared(mipsopmem):
  type
    mipsopmem* = mipsopmem_553648835
else:
  static :
    hint("Declaration of " & "mipsopmem" & " already exists, not redeclaring")
when not declared(arm64msrreg):
  type
    arm64msrreg* = arm64msrreg_553648699
else:
  static :
    hint("Declaration of " & "arm64msrreg" & " already exists, not redeclaring")
when not declared(structcsppcop):
  type
    structcsppcop* = structcsppcop_553648877
else:
  static :
    hint("Declaration of " & "structcsppcop" &
        " already exists, not redeclaring")
when not declared(structm680xopidx):
  type
    structm680xopidx* = structm680xopidx_553649097
else:
  static :
    hint("Declaration of " & "structm680xopidx" &
        " already exists, not redeclaring")
when not declared(structcsmipsop):
  type
    structcsmipsop* = structcsmipsop_553648837
else:
  static :
    hint("Declaration of " & "structcsmipsop" &
        " already exists, not redeclaring")
when not declared(cssparc):
  type
    cssparc* = cssparc_553648919
else:
  static :
    hint("Declaration of " & "cssparc" & " already exists, not redeclaring")
when not declared(x86avxbcast):
  type
    x86avxbcast* = x86avxbcast_553648975
else:
  static :
    hint("Declaration of " & "x86avxbcast" & " already exists, not redeclaring")
when not declared(tms320c64xopmem):
  type
    tms320c64xopmem* = tms320c64xopmem_553649063
else:
  static :
    hint("Declaration of " & "tms320c64xopmem" &
        " already exists, not redeclaring")
when not declared(csh):
  type
    csh* = csh_553648559
else:
  static :
    hint("Declaration of " & "csh" & " already exists, not redeclaring")
when not declared(m68kopmem):
  type
    m68kopmem* = m68kopmem_553648779
else:
  static :
    hint("Declaration of " & "m68kopmem" & " already exists, not redeclaring")
when not declared(csx86):
  type
    csx86* = csx86_553649007
else:
  static :
    hint("Declaration of " & "csx86" & " already exists, not redeclaring")
when not declared(csm680x):
  type
    csm680x* = csm680x_553649119
else:
  static :
    hint("Declaration of " & "csm680x" & " already exists, not redeclaring")
when not declared(mipsinsn):
  type
    mipsinsn* = mipsinsn_553648847
else:
  static :
    hint("Declaration of " & "mipsinsn" & " already exists, not redeclaring")
when not declared(armvectordatatype):
  type
    armvectordatatype* = armvectordatatype_553648655
else:
  static :
    hint("Declaration of " & "armvectordatatype" &
        " already exists, not redeclaring")
when not declared(structcsm680x):
  type
    structcsm680x* = structcsm680x_553649117
else:
  static :
    hint("Declaration of " & "structcsm680x" &
        " already exists, not redeclaring")
when not declared(csgrouptype):
  type
    csgrouptype* = csgrouptype_553648606
else:
  static :
    hint("Declaration of " & "csgrouptype" & " already exists, not redeclaring")
when not declared(ppcoptype):
  type
    ppcoptype* = ppcoptype_553648863
else:
  static :
    hint("Declaration of " & "ppcoptype" & " already exists, not redeclaring")
when not declared(arm64vas):
  type
    arm64vas* = arm64vas_553648707
else:
  static :
    hint("Declaration of " & "arm64vas" & " already exists, not redeclaring")
when not declared(mipsreg):
  type
    mipsreg* = mipsreg_553648831
else:
  static :
    hint("Declaration of " & "mipsreg" & " already exists, not redeclaring")
when not declared(structsyszopmem):
  type
    structsyszopmem* = structsyszopmem_553648941
else:
  static :
    hint("Declaration of " & "structsyszopmem" &
        " already exists, not redeclaring")
when not declared(csoptmem):
  type
    csoptmem* = csoptmem_553648582
else:
  static :
    hint("Declaration of " & "csoptmem" & " already exists, not redeclaring")
when not declared(structsparcopmem):
  type
    structsparcopmem* = structsparcopmem_553648909
else:
  static :
    hint("Declaration of " & "structsparcopmem" &
        " already exists, not redeclaring")
when not declared(csoptvalue):
  type
    csoptvalue* = csoptvalue_553648594
else:
  static :
    hint("Declaration of " & "csoptvalue" & " already exists, not redeclaring")
when not declared(structmipsopmem):
  type
    structmipsopmem* = structmipsopmem_553648833
else:
  static :
    hint("Declaration of " & "structmipsopmem" &
        " already exists, not redeclaring")
when not declared(ppcopmem):
  type
    ppcopmem* = ppcopmem_553648871
else:
  static :
    hint("Declaration of " & "ppcopmem" & " already exists, not redeclaring")
when not declared(x86optype):
  type
    x86optype* = x86optype_553648967
else:
  static :
    hint("Declaration of " & "x86optype" & " already exists, not redeclaring")
when not declared(arm64optype):
  type
    arm64optype* = arm64optype_553648719
else:
  static :
    hint("Declaration of " & "arm64optype" & " already exists, not redeclaring")
when not declared(armcpsmodetype):
  type
    armcpsmodetype* = armcpsmodetype_553648640
else:
  static :
    hint("Declaration of " & "armcpsmodetype" &
        " already exists, not redeclaring")
when not declared(m680xinsn):
  type
    m680xinsn* = m680xinsn_553649123
else:
  static :
    hint("Declaration of " & "m680xinsn" & " already exists, not redeclaring")
when not declared(ppcopcrx):
  type
    ppcopcrx* = ppcopcrx_553648875
else:
  static :
    hint("Declaration of " & "ppcopcrx" & " already exists, not redeclaring")
when not declared(m68kopbrdisp):
  type
    m68kopbrdisp* = m68kopbrdisp_553648787
else:
  static :
    hint("Declaration of " & "m68kopbrdisp" & " already exists, not redeclaring")
when not declared(structcsevm):
  type
    structcsevm* = structcsevm_553649125
else:
  static :
    hint("Declaration of " & "structcsevm" & " already exists, not redeclaring")
when not declared(arm64atop):
  type
    arm64atop* = arm64atop_553648727
else:
  static :
    hint("Declaration of " & "arm64atop" & " already exists, not redeclaring")
when not declared(m680xopidx):
  type
    m680xopidx* = m680xopidx_553649099
else:
  static :
    hint("Declaration of " & "m680xopidx" & " already exists, not redeclaring")
when not declared(mipsinsngroup):
  type
    mipsinsngroup* = mipsinsngroup_553648851
else:
  static :
    hint("Declaration of " & "mipsinsngroup" &
        " already exists, not redeclaring")
when not declared(structm68kopsize):
  type
    structm68kopsize* = structm68kopsize_553648809
else:
  static :
    hint("Declaration of " & "structm68kopsize" &
        " already exists, not redeclaring")
when not declared(tms320c64xoptype):
  type
    tms320c64xoptype* = tms320c64xoptype_553649047
else:
  static :
    hint("Declaration of " & "tms320c64xoptype" &
        " already exists, not redeclaring")
when not declared(arminsngroup):
  type
    arminsngroup* = arminsngroup_553648679
else:
  static :
    hint("Declaration of " & "arminsngroup" & " already exists, not redeclaring")
when not declared(structcsm68kop):
  type
    structcsm68kop* = structcsm68kop_553648793
else:
  static :
    hint("Declaration of " & "structcsm68kop" &
        " already exists, not redeclaring")
when not declared(sparchint):
  type
    sparchint* = sparchint_553648899
else:
  static :
    hint("Declaration of " & "sparchint" & " already exists, not redeclaring")
when not declared(structcsx86op):
  type
    structcsx86op* = structcsx86op_553648997
else:
  static :
    hint("Declaration of " & "structcsx86op" &
        " already exists, not redeclaring")
when not declared(csevm):
  type
    csevm* = csevm_553649127
else:
  static :
    hint("Declaration of " & "csevm" & " already exists, not redeclaring")
when not declared(x86prefix):
  type
    x86prefix* = x86prefix_553648991
else:
  static :
    hint("Declaration of " & "x86prefix" & " already exists, not redeclaring")
when not declared(structppcopmem):
  type
    structppcopmem* = structppcopmem_553648869
else:
  static :
    hint("Declaration of " & "structppcopmem" &
        " already exists, not redeclaring")
when not declared(xcoreopmem):
  type
    xcoreopmem* = xcoreopmem_553649027
else:
  static :
    hint("Declaration of " & "xcoreopmem" & " already exists, not redeclaring")
when not declared(csm68k):
  type
    csm68k* = csm68k_553648815
else:
  static :
    hint("Declaration of " & "csm68k" & " already exists, not redeclaring")
when not declared(cscalloct):
  type
    cscalloct* = cscalloct_553648572
else:
  static :
    hint("Declaration of " & "cscalloct" & " already exists, not redeclaring")
when not declared(xcorereg):
  type
    xcorereg* = xcorereg_553649023
else:
  static :
    hint("Declaration of " & "xcorereg" & " already exists, not redeclaring")
when not declared(csx86encoding):
  type
    csx86encoding* = csx86encoding_553649003
else:
  static :
    hint("Declaration of " & "csx86encoding" &
        " already exists, not redeclaring")
when not declared(structcstms320c64xop):
  type
    structcstms320c64xop* = structcstms320c64xop_553649065
else:
  static :
    hint("Declaration of " & "structcstms320c64xop" &
        " already exists, not redeclaring")
when not declared(ppcbh):
  type
    ppcbh* = ppcbh_553648859
else:
  static :
    hint("Declaration of " & "ppcbh" & " already exists, not redeclaring")
when not declared(sparccc):
  type
    sparccc* = sparccc_553648895
else:
  static :
    hint("Declaration of " & "sparccc" & " already exists, not redeclaring")
when not declared(xcoreoptype):
  type
    xcoreoptype* = xcoreoptype_553649019
else:
  static :
    hint("Declaration of " & "xcoreoptype" & " already exists, not redeclaring")
when not declared(sparcinsngroup):
  type
    sparcinsngroup* = sparcinsngroup_553648927
else:
  static :
    hint("Declaration of " & "sparcinsngroup" &
        " already exists, not redeclaring")
when not declared(x86insn):
  type
    x86insn* = x86insn_553649011
else:
  static :
    hint("Declaration of " & "x86insn" & " already exists, not redeclaring")
when not declared(m680xgrouptype):
  type
    m680xgrouptype* = m680xgrouptype_553649115
else:
  static :
    hint("Declaration of " & "m680xgrouptype" &
        " already exists, not redeclaring")
when not declared(csoptmnem):
  type
    csoptmnem* = csoptmnem_553648586
else:
  static :
    hint("Declaration of " & "csoptmnem" & " already exists, not redeclaring")
when not declared(structcsxcoreop):
  type
    structcsxcoreop* = structcsxcoreop_553649029
else:
  static :
    hint("Declaration of " & "structcsxcoreop" &
        " already exists, not redeclaring")
when not declared(m68kinsn):
  type
    m68kinsn* = m68kinsn_553648819
else:
  static :
    hint("Declaration of " & "m68kinsn" & " already exists, not redeclaring")
when not declared(cssysz):
  type
    cssysz* = cssysz_553648951
else:
  static :
    hint("Declaration of " & "cssysz" & " already exists, not redeclaring")
when not declared(syszinsngroup):
  type
    syszinsngroup* = syszinsngroup_553648959
else:
  static :
    hint("Declaration of " & "syszinsngroup" &
        " already exists, not redeclaring")
when not declared(arm64shifter):
  type
    arm64shifter* = arm64shifter_553648683
else:
  static :
    hint("Declaration of " & "arm64shifter" & " already exists, not redeclaring")
when not declared(csmips):
  type
    csmips* = csmips_553648843
else:
  static :
    hint("Declaration of " & "csmips" & " already exists, not redeclaring")
when not declared(csrealloct):
  type
    csrealloct* = csrealloct_553648574
else:
  static :
    hint("Declaration of " & "csrealloct" & " already exists, not redeclaring")
when not declared(tms320c64xinsngroup):
  type
    tms320c64xinsngroup* = tms320c64xinsngroup_553649083
else:
  static :
    hint("Declaration of " & "tms320c64xinsngroup" &
        " already exists, not redeclaring")
when not declared(evminsn):
  type
    evminsn* = evminsn_553649131
else:
  static :
    hint("Declaration of " & "evminsn" & " already exists, not redeclaring")
when not declared(Csapimajor):
  when 4 is static:
    const
      Csapimajor* = 4        ## Generated based on /usr/include/capstone/capstone.h:50:9
  else:
    let Csapimajor* = 4      ## Generated based on /usr/include/capstone/capstone.h:50:9
else:
  static :
    hint("Declaration of " & "Csapimajor" & " already exists, not redeclaring")
when not declared(Csapiminor):
  when 0 is static:
    const
      Csapiminor* = 0        ## Generated based on /usr/include/capstone/capstone.h:51:9
  else:
    let Csapiminor* = 0      ## Generated based on /usr/include/capstone/capstone.h:51:9
else:
  static :
    hint("Declaration of " & "Csapiminor" & " already exists, not redeclaring")
when not declared(Csnextversion):
  when 5 is static:
    const
      Csnextversion* = 5     ## Generated based on /usr/include/capstone/capstone.h:56:9
  else:
    let Csnextversion* = 5   ## Generated based on /usr/include/capstone/capstone.h:56:9
else:
  static :
    hint("Declaration of " & "Csnextversion" &
        " already exists, not redeclaring")
when not declared(Csversionmajor):
  when Csapimajor is typedesc:
    type
      Csversionmajor* = Csapimajor ## Generated based on /usr/include/capstone/capstone.h:59:9
  else:
    when Csapimajor is static:
      const
        Csversionmajor* = Csapimajor ## Generated based on /usr/include/capstone/capstone.h:59:9
    else:
      let Csversionmajor* = Csapimajor ## Generated based on /usr/include/capstone/capstone.h:59:9
else:
  static :
    hint("Declaration of " & "Csversionmajor" &
        " already exists, not redeclaring")
when not declared(Csversionminor):
  when Csapiminor is typedesc:
    type
      Csversionminor* = Csapiminor ## Generated based on /usr/include/capstone/capstone.h:60:9
  else:
    when Csapiminor is static:
      const
        Csversionminor* = Csapiminor ## Generated based on /usr/include/capstone/capstone.h:60:9
    else:
      let Csversionminor* = Csapiminor ## Generated based on /usr/include/capstone/capstone.h:60:9
else:
  static :
    hint("Declaration of " & "Csversionminor" &
        " already exists, not redeclaring")
when not declared(Csversionextra):
  when 2 is static:
    const
      Csversionextra* = 2    ## Generated based on /usr/include/capstone/capstone.h:61:9
  else:
    let Csversionextra* = 2  ## Generated based on /usr/include/capstone/capstone.h:61:9
else:
  static :
    hint("Declaration of " & "Csversionextra" &
        " already exists, not redeclaring")
when not declared(Csmnemonicsize):
  when 32 is static:
    const
      Csmnemonicsize* = 32   ## Generated based on /usr/include/capstone/capstone.h:68:9
  else:
    let Csmnemonicsize* = 32 ## Generated based on /usr/include/capstone/capstone.h:68:9
else:
  static :
    hint("Declaration of " & "Csmnemonicsize" &
        " already exists, not redeclaring")
when not declared(M68koperandcount):
  when 4 is static:
    const
      M68koperandcount* = 4  ## Generated based on /usr/include/capstone/m68k.h:17:9
  else:
    let M68koperandcount* = 4 ## Generated based on /usr/include/capstone/m68k.h:17:9
else:
  static :
    hint("Declaration of " & "M68koperandcount" &
        " already exists, not redeclaring")
when not declared(M680xoperandcount):
  when 9 is static:
    const
      M680xoperandcount* = 9 ## Generated based on /usr/include/capstone/m680x.h:17:9
  else:
    let M680xoperandcount* = 9 ## Generated based on /usr/include/capstone/m680x.h:17:9
else:
  static :
    hint("Declaration of " & "M680xoperandcount" &
        " already exists, not redeclaring")
when not declared(M680xoffsetnone):
  when 0 is static:
    const
      M680xoffsetnone* = 0   ## Generated based on /usr/include/capstone/m680x.h:68:9
  else:
    let M680xoffsetnone* = 0 ## Generated based on /usr/include/capstone/m680x.h:68:9
else:
  static :
    hint("Declaration of " & "M680xoffsetnone" &
        " already exists, not redeclaring")
when not declared(M680xoffsetbits5):
  when 5 is static:
    const
      M680xoffsetbits5* = 5  ## Generated based on /usr/include/capstone/m680x.h:69:9
  else:
    let M680xoffsetbits5* = 5 ## Generated based on /usr/include/capstone/m680x.h:69:9
else:
  static :
    hint("Declaration of " & "M680xoffsetbits5" &
        " already exists, not redeclaring")
when not declared(M680xoffsetbits8):
  when 8 is static:
    const
      M680xoffsetbits8* = 8  ## Generated based on /usr/include/capstone/m680x.h:70:9
  else:
    let M680xoffsetbits8* = 8 ## Generated based on /usr/include/capstone/m680x.h:70:9
else:
  static :
    hint("Declaration of " & "M680xoffsetbits8" &
        " already exists, not redeclaring")
when not declared(M680xoffsetbits9):
  when 9 is static:
    const
      M680xoffsetbits9* = 9  ## Generated based on /usr/include/capstone/m680x.h:71:9
  else:
    let M680xoffsetbits9* = 9 ## Generated based on /usr/include/capstone/m680x.h:71:9
else:
  static :
    hint("Declaration of " & "M680xoffsetbits9" &
        " already exists, not redeclaring")
when not declared(M680xoffsetbits16):
  when 16 is static:
    const
      M680xoffsetbits16* = 16 ## Generated based on /usr/include/capstone/m680x.h:72:9
  else:
    let M680xoffsetbits16* = 16 ## Generated based on /usr/include/capstone/m680x.h:72:9
else:
  static :
    hint("Declaration of " & "M680xoffsetbits16" &
        " already exists, not redeclaring")
when not declared(M680xidxindirect):
  when 1 is static:
    const
      M680xidxindirect* = 1  ## Generated based on /usr/include/capstone/m680x.h:76:9
  else:
    let M680xidxindirect* = 1 ## Generated based on /usr/include/capstone/m680x.h:76:9
else:
  static :
    hint("Declaration of " & "M680xidxindirect" &
        " already exists, not redeclaring")
when not declared(M680xidxnocomma):
  when 2 is static:
    const
      M680xidxnocomma* = 2   ## Generated based on /usr/include/capstone/m680x.h:77:9
  else:
    let M680xidxnocomma* = 2 ## Generated based on /usr/include/capstone/m680x.h:77:9
else:
  static :
    hint("Declaration of " & "M680xidxnocomma" &
        " already exists, not redeclaring")
when not declared(M680xidxpostincdec):
  when 4 is static:
    const
      M680xidxpostincdec* = 4 ## Generated based on /usr/include/capstone/m680x.h:78:9
  else:
    let M680xidxpostincdec* = 4 ## Generated based on /usr/include/capstone/m680x.h:78:9
else:
  static :
    hint("Declaration of " & "M680xidxpostincdec" &
        " already exists, not redeclaring")
when not declared(M680xfirstopinmnem):
  when 1 is static:
    const
      M680xfirstopinmnem* = 1 ## Generated based on /usr/include/capstone/m680x.h:159:9
  else:
    let M680xfirstopinmnem* = 1 ## Generated based on /usr/include/capstone/m680x.h:159:9
else:
  static :
    hint("Declaration of " & "M680xfirstopinmnem" &
        " already exists, not redeclaring")
when not declared(M680xsecondopinmnem):
  when 2 is static:
    const
      M680xsecondopinmnem* = 2 ## Generated based on /usr/include/capstone/m680x.h:162:9
  else:
    let M680xsecondopinmnem* = 2 ## Generated based on /usr/include/capstone/m680x.h:162:9
else:
  static :
    hint("Declaration of " & "M680xsecondopinmnem" &
        " already exists, not redeclaring")
when not declared(csversion):
  proc csversion*(major: ptr cint; minor: ptr cint): cuint {.cdecl,
      importc: "cs_version".}
else:
  static :
    hint("Declaration of " & "csversion" & " already exists, not redeclaring")
when not declared(cssupport):
  proc cssupport*(query: cint): bool {.cdecl, importc: "cs_support".}
else:
  static :
    hint("Declaration of " & "cssupport" & " already exists, not redeclaring")
when not declared(csopen):
  proc csopen*(arch: csarch_553648565; mode: csmode_553648569; handle: ptr csh_553648561): cserr_553649148 {.
      cdecl, importc: "cs_open".}
else:
  static :
    hint("Declaration of " & "csopen" & " already exists, not redeclaring")
when not declared(csclose):
  proc csclose*(handle: ptr csh_553648561): cserr_553649148 {.cdecl,
      importc: "cs_close".}
else:
  static :
    hint("Declaration of " & "csclose" & " already exists, not redeclaring")
when not declared(csoption):
  proc csoption*(handle: csh_553648561; typearg: csopttype_553648591;
                 value: csize_t): cserr_553649148 {.cdecl, importc: "cs_option".}
else:
  static :
    hint("Declaration of " & "csoption" & " already exists, not redeclaring")
when not declared(cserrno):
  proc cserrno*(handle: csh_553648561): cserr_553649148 {.cdecl,
      importc: "cs_errno".}
else:
  static :
    hint("Declaration of " & "cserrno" & " already exists, not redeclaring")
when not declared(csstrerror):
  proc csstrerror*(code: cserr_553649148): cstring {.cdecl,
      importc: "cs_strerror".}
else:
  static :
    hint("Declaration of " & "csstrerror" & " already exists, not redeclaring")
when not declared(csdisasm):
  proc csdisasm*(handle: csh_553648561; code: ptr uint8; codesize: csize_t;
                 address: uint64; count: csize_t; insn: ptr ptr csinsn_553649144): csize_t {.
      cdecl, importc: "cs_disasm".}
else:
  static :
    hint("Declaration of " & "csdisasm" & " already exists, not redeclaring")
when not declared(csdisasmex):
  proc csdisasmex*(handle: csh_553648561; code: ptr uint8; codesize: csize_t;
                   address: uint64; count: csize_t; insn: ptr ptr csinsn_553649144): csize_t {.
      cdecl, importc: "cs_disasm_ex".}
else:
  static :
    hint("Declaration of " & "csdisasmex" & " already exists, not redeclaring")
when not declared(csfree):
  proc csfree*(insn: ptr csinsn_553649144; count: csize_t): void {.cdecl,
      importc: "cs_free".}
else:
  static :
    hint("Declaration of " & "csfree" & " already exists, not redeclaring")
when not declared(csmalloc):
  proc csmalloc*(handle: csh_553648561): ptr csinsn_553649144 {.cdecl,
      importc: "cs_malloc".}
else:
  static :
    hint("Declaration of " & "csmalloc" & " already exists, not redeclaring")
when not declared(csdisasmiter):
  proc csdisasmiter*(handle: csh_553648561; code: ptr ptr uint8;
                     size: ptr csize_t; address: ptr uint64; insn: ptr csinsn_553649144): bool {.
      cdecl, importc: "cs_disasm_iter".}
else:
  static :
    hint("Declaration of " & "csdisasmiter" & " already exists, not redeclaring")
when not declared(csregname):
  proc csregname*(handle: csh_553648561; regid: cuint): cstring {.cdecl,
      importc: "cs_reg_name".}
else:
  static :
    hint("Declaration of " & "csregname" & " already exists, not redeclaring")
when not declared(csinsnname):
  proc csinsnname*(handle: csh_553648561; insnid: cuint): cstring {.cdecl,
      importc: "cs_insn_name".}
else:
  static :
    hint("Declaration of " & "csinsnname" & " already exists, not redeclaring")
when not declared(csgroupname):
  proc csgroupname*(handle: csh_553648561; groupid: cuint): cstring {.cdecl,
      importc: "cs_group_name".}
else:
  static :
    hint("Declaration of " & "csgroupname" & " already exists, not redeclaring")
when not declared(csinsngroup):
  proc csinsngroup*(handle: csh_553648561; insn: ptr csinsn_553649144;
                    groupid: cuint): bool {.cdecl, importc: "cs_insn_group".}
else:
  static :
    hint("Declaration of " & "csinsngroup" & " already exists, not redeclaring")
when not declared(csregread):
  proc csregread*(handle: csh_553648561; insn: ptr csinsn_553649144;
                  regid: cuint): bool {.cdecl, importc: "cs_reg_read".}
else:
  static :
    hint("Declaration of " & "csregread" & " already exists, not redeclaring")
when not declared(csregwrite):
  proc csregwrite*(handle: csh_553648561; insn: ptr csinsn_553649144;
                   regid: cuint): bool {.cdecl, importc: "cs_reg_write".}
else:
  static :
    hint("Declaration of " & "csregwrite" & " already exists, not redeclaring")
when not declared(csopcount):
  proc csopcount*(handle: csh_553648561; insn: ptr csinsn_553649144;
                  optype: cuint): cint {.cdecl, importc: "cs_op_count".}
else:
  static :
    hint("Declaration of " & "csopcount" & " already exists, not redeclaring")
when not declared(csopindex):
  proc csopindex*(handle: csh_553648561; insn: ptr csinsn_553649144;
                  optype: cuint; position: cuint): cint {.cdecl,
      importc: "cs_op_index".}
else:
  static :
    hint("Declaration of " & "csopindex" & " already exists, not redeclaring")
when not declared(csregsaccess):
  proc csregsaccess*(handle: csh_553648561; insn: ptr csinsn_553649144;
                     regsread: csregs_553649150; regsreadcount: ptr uint8;
                     regswrite: csregs_553649150; regswritecount: ptr uint8): cserr_553649148 {.
      cdecl, importc: "cs_regs_access".}
else:
  static :
    hint("Declaration of " & "csregsaccess" & " already exists, not redeclaring")