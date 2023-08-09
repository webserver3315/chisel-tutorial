;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit VecShiftRegisterParam : 
  module VecShiftRegisterParam : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<4>, out : UInt<4>}
    
    reg shift_reg : UInt<4>[8], clock @[VecShiftRegisterParam.scala 19:22]
    shift_reg[1] <= shift_reg[0] @[VecShiftRegisterParam.scala 21:18]
    shift_reg[2] <= shift_reg[1] @[VecShiftRegisterParam.scala 21:18]
    shift_reg[3] <= shift_reg[2] @[VecShiftRegisterParam.scala 21:18]
    shift_reg[4] <= shift_reg[3] @[VecShiftRegisterParam.scala 21:18]
    shift_reg[5] <= shift_reg[4] @[VecShiftRegisterParam.scala 21:18]
    shift_reg[6] <= shift_reg[5] @[VecShiftRegisterParam.scala 21:18]
    shift_reg[7] <= shift_reg[6] @[VecShiftRegisterParam.scala 21:18]
    shift_reg[0] <= io.in @[VecShiftRegisterParam.scala 23:16]
    io.out <= shift_reg[7] @[VecShiftRegisterParam.scala 24:10]
    
