;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit Adder : 
  module Adder : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in0 : UInt<8>, flip in1 : UInt<8>, out : UInt<8>}
    
    node _T = add(io.in0, io.in1) @[Adder.scala 19:20]
    node _T_1 = tail(_T, 1) @[Adder.scala 19:20]
    io.out <= _T_1 @[Adder.scala 19:10]
    node _T_2 = bits(reset, 0, 0) @[Adder.scala 20:9]
    node _T_3 = eq(_T_2, UInt<1>("h00")) @[Adder.scala 20:9]
    when _T_3 : @[Adder.scala 20:9]
      printf(clock, UInt<1>(1), "Adder: %d := %d + %d\n", io.out, io.in0, io.in1) @[Adder.scala 20:9]
      skip @[Adder.scala 20:9]
    
