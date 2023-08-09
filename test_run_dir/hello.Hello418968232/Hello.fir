;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit Hello : 
  module Hello : 
    input clock : Clock
    input reset : UInt<1>
    output io : {out : UInt<8>}
    
    io.out <= UInt<6>("h02a") @[Hello.scala 11:10]
    
