;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit LFSR16 : 
  module LFSR16 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip inc : UInt<1>, out : UInt<16>}
    
    reg regs : UInt<16>, clock with : (reset => (reset, UInt<16>("h01"))) @[LFSR16.scala 22:21]
    when io.inc : @[LFSR16.scala 23:15]
      node _T = bits(regs, 0, 0) @[LFSR16.scala 24:28]
      node _T_1 = bits(regs, 2, 2) @[LFSR16.scala 24:36]
      node _T_2 = xor(_T, _T_1) @[LFSR16.scala 24:31]
      node _T_3 = bits(regs, 3, 3) @[LFSR16.scala 24:44]
      node _T_4 = xor(_T_2, _T_3) @[LFSR16.scala 24:39]
      node _T_5 = bits(regs, 5, 5) @[LFSR16.scala 24:52]
      node _T_6 = xor(_T_4, _T_5) @[LFSR16.scala 24:47]
      node _T_7 = bits(regs, 15, 1) @[LFSR16.scala 24:61]
      node _T_8 = cat(_T_6, _T_7) @[Cat.scala 29:58]
      regs <= _T_8 @[LFSR16.scala 26:10]
      skip @[LFSR16.scala 23:15]
    io.out <= regs @[LFSR16.scala 29:10]
    
