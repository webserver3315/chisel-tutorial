;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit Counter : 
  module Counter : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip inc : UInt<1>, flip amt : UInt<4>, tot : UInt<8>}
    
    reg _T : UInt<8>, clock with : (reset => (reset, UInt<8>("h00"))) @[Counter.scala 18:20]
    when io.inc : @[Counter.scala 25:15]
      node _T_1 = add(_T, io.amt) @[Counter.scala 26:22]
      node _T_2 = tail(_T_1, 1) @[Counter.scala 26:22]
      node _T_3 = gt(_T_2, UInt<8>("h0ff")) @[Counter.scala 14:11]
      node _T_4 = mux(_T_3, UInt<1>("h00"), _T_2) @[Counter.scala 14:8]
      _T <= _T_4 @[Counter.scala 26:8]
      skip @[Counter.scala 25:15]
    io.tot <= _T @[Counter.scala 41:10]
    
