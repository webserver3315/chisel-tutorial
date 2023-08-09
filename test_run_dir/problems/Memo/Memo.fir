;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit Memo : 
  module Memo : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip wen : UInt<1>, flip wrAddr : UInt<8>, flip wrData : UInt<8>, flip ren : UInt<1>, flip rdAddr : UInt<8>, rdData : UInt<8>}
    
    cmem mem : UInt<8>[256] @[Memo.scala 23:16]
    when io.wen : @[Memo.scala 43:15]
      infer mport _T = mem[io.wrAddr], clock @[Memo.scala 44:8]
      _T <= io.wrData @[Memo.scala 44:20]
      skip @[Memo.scala 43:15]
    io.rdData <= UInt<1>("h00") @[Memo.scala 47:13]
    when io.ren : @[Memo.scala 48:15]
      infer mport _T_1 = mem[io.rdAddr], clock @[Memo.scala 49:21]
      io.rdData <= _T_1 @[Memo.scala 49:15]
      skip @[Memo.scala 48:15]
    
