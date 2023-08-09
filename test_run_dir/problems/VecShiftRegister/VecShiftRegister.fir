;buildInfoPackage: chisel3, version: 3.3.1, scalaVersion: 2.12.11, sbtVersion: 1.3.10
circuit VecShiftRegister : 
  module VecShiftRegister : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip ins : UInt<4>[4], flip load : UInt<1>, flip shift : UInt<1>, out : UInt<4>}
    
    reg shift_reg : UInt<4>[4], clock @[VecShiftRegister.scala 22:22]
    when io.load : @[VecShiftRegister.scala 23:16]
      shift_reg[0] <= io.ins[0] @[VecShiftRegister.scala 25:20]
      shift_reg[1] <= io.ins[1] @[VecShiftRegister.scala 25:20]
      shift_reg[2] <= io.ins[2] @[VecShiftRegister.scala 25:20]
      shift_reg[3] <= io.ins[3] @[VecShiftRegister.scala 25:20]
      skip @[VecShiftRegister.scala 23:16]
    else : @[VecShiftRegister.scala 27:23]
      when io.shift : @[VecShiftRegister.scala 27:23]
        shift_reg[1] <= shift_reg[0] @[VecShiftRegister.scala 29:22]
        shift_reg[2] <= shift_reg[1] @[VecShiftRegister.scala 29:22]
        shift_reg[3] <= shift_reg[2] @[VecShiftRegister.scala 29:22]
        shift_reg[0] <= io.ins[0] @[VecShiftRegister.scala 31:18]
        skip @[VecShiftRegister.scala 27:23]
    io.out <= shift_reg[3] @[VecShiftRegister.scala 35:10]
    
