;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit VecShiftRegisterSimple : 
  module VecShiftRegisterSimple : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<8>, out : UInt<8>}
    
    reg delays : UInt<8>[4], clock @[VecShiftRegisterSimple.scala 19:19]
    delays[0] <= io.in @[VecShiftRegisterSimple.scala 23:13]
    delays[1] <= delays[0] @[VecShiftRegisterSimple.scala 25:15]
    delays[2] <= delays[1] @[VecShiftRegisterSimple.scala 25:15]
    delays[3] <= delays[2] @[VecShiftRegisterSimple.scala 25:15]
    io.out <= delays[3] @[VecShiftRegisterSimple.scala 27:10]
    
