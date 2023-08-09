;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit Accumulator : 
  module Accumulator : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<1>, out : UInt<8>}
    
    reg counter : UInt<8>, clock with : (reset => (reset, UInt<8>("h00"))) @[Accumulator.scala 20:30]
    node _T = add(counter, io.in) @[Accumulator.scala 21:28]
    node _T_1 = tail(_T, 1) @[Accumulator.scala 21:28]
    counter <= _T_1 @[Accumulator.scala 21:17]
    io.out <= counter @[Accumulator.scala 22:16]
    node _T_2 = bits(reset, 0, 0) @[Accumulator.scala 24:15]
    node _T_3 = eq(_T_2, UInt<1>("h00")) @[Accumulator.scala 24:15]
    when _T_3 : @[Accumulator.scala 24:15]
      printf(clock, UInt<1>(1), "Accumulator: %d %d\n", io.in, io.out) @[Accumulator.scala 24:15]
      skip @[Accumulator.scala 24:15]
    
