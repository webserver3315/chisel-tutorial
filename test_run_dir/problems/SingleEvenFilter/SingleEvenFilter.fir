;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit SingleEvenFilter : 
  module PredicateFilter : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : {valid : UInt<1>, bits : UInt<16>}, out : {valid : UInt<1>, bits : UInt<16>}}
    
    node _T = lt(io.in.bits, UInt<4>("h0a")) @[SingleEvenFilter.scala 31:51]
    node _T_1 = and(io.in.valid, _T) @[SingleEvenFilter.scala 24:31]
    io.out.valid <= _T_1 @[SingleEvenFilter.scala 24:16]
    io.out.bits <= io.in.bits @[SingleEvenFilter.scala 25:16]
    
  module PredicateFilter_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip in : {valid : UInt<1>, bits : UInt<16>}, out : {valid : UInt<1>, bits : UInt<16>}}
    
    node _T = bits(io.in.bits, 0, 0) @[SingleEvenFilter.scala 38:50]
    node _T_1 = and(io.in.valid, _T) @[SingleEvenFilter.scala 24:31]
    io.out.valid <= _T_1 @[SingleEvenFilter.scala 24:16]
    io.out.bits <= io.in.bits @[SingleEvenFilter.scala 25:16]
    
  module SingleEvenFilter : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : {valid : UInt<1>, bits : UInt<16>}, out : {valid : UInt<1>, bits : UInt<16>}}
    
    inst u_single of PredicateFilter @[SingleEvenFilter.scala 31:11]
    u_single.clock <= clock
    u_single.reset <= reset
    inst u_even of PredicateFilter_1 @[SingleEvenFilter.scala 38:11]
    u_even.clock <= clock
    u_even.reset <= reset
    u_single.io.in.bits <= io.in.bits @[SingleEvenFilter.scala 46:18]
    u_single.io.in.valid <= io.in.valid @[SingleEvenFilter.scala 46:18]
    u_even.io.in.bits <= u_single.io.out.bits @[SingleEvenFilter.scala 47:16]
    u_even.io.in.valid <= u_single.io.out.valid @[SingleEvenFilter.scala 47:16]
    io.out.bits <= u_even.io.out.bits @[SingleEvenFilter.scala 48:10]
    io.out.valid <= u_even.io.out.valid @[SingleEvenFilter.scala 48:10]
    
