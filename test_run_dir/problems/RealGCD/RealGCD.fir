;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit RealGCD : 
  module RealGCD : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : {flip ready : UInt<1>, valid : UInt<1>, bits : {a : UInt<16>, b : UInt<16>}}, out : {valid : UInt<1>, bits : UInt<16>}}
    
    reg a_reg : UInt<16>, clock with : (reset => (reset, UInt<16>("h00"))) @[RealGCD.scala 23:22]
    reg b_reg : UInt<16>, clock with : (reset => (reset, UInt<16>("h00"))) @[RealGCD.scala 24:22]
    io.in.ready <= UInt<1>("h01") @[RealGCD.scala 28:15]
    when io.in.valid : @[RealGCD.scala 30:21]
      a_reg <= io.in.bits.a @[RealGCD.scala 31:11]
      b_reg <= io.in.bits.b @[RealGCD.scala 32:11]
      skip @[RealGCD.scala 30:21]
    else : @[RealGCD.scala 33:29]
      node _T = eq(a_reg, UInt<1>("h00")) @[RealGCD.scala 33:21]
      when _T : @[RealGCD.scala 33:29]
        a_reg <= a_reg @[RealGCD.scala 34:11]
        b_reg <= b_reg @[RealGCD.scala 35:11]
        skip @[RealGCD.scala 33:29]
      else : @[RealGCD.scala 36:29]
        node _T_1 = lt(a_reg, b_reg) @[RealGCD.scala 36:20]
        when _T_1 : @[RealGCD.scala 36:29]
          node _T_2 = sub(b_reg, a_reg) @[RealGCD.scala 37:20]
          node _T_3 = tail(_T_2, 1) @[RealGCD.scala 37:20]
          a_reg <= _T_3 @[RealGCD.scala 37:11]
          b_reg <= a_reg @[RealGCD.scala 38:11]
          skip @[RealGCD.scala 36:29]
        else : @[RealGCD.scala 39:15]
          node _T_4 = sub(a_reg, b_reg) @[RealGCD.scala 40:20]
          node _T_5 = tail(_T_4, 1) @[RealGCD.scala 40:20]
          a_reg <= _T_5 @[RealGCD.scala 40:11]
          b_reg <= b_reg @[RealGCD.scala 41:11]
          skip @[RealGCD.scala 39:15]
    io.out.bits <= b_reg @[RealGCD.scala 44:15]
    node _T_6 = eq(a_reg, UInt<1>("h00")) @[RealGCD.scala 45:14]
    when _T_6 : @[RealGCD.scala 45:22]
      io.out.valid <= UInt<1>("h01") @[RealGCD.scala 46:18]
      skip @[RealGCD.scala 45:22]
    else : @[RealGCD.scala 47:14]
      io.out.valid <= UInt<1>("h00") @[RealGCD.scala 48:18]
      skip @[RealGCD.scala 47:14]
    
