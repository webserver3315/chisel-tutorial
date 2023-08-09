// See LICENSE.txt for license details.
package problems

import chisel3._
import chisel3.util.{Valid, DeqIO}

// Problem:
// Implement a GCD circuit (the greatest common divisor of two numbers).
// Input numbers are bundled as 'RealGCDInput' and communicated using the Decoupled handshake protocol
//
class RealGCDInput extends Bundle {
  val a = UInt(16.W)
  val b = UInt(16.W)
}

class RealGCD extends Module {
  val io  = IO(new Bundle {
    val in  = DeqIO(new RealGCDInput())
    val out = Output(Valid(UInt(16.W)))
  })

  // Implement below ----------
  val a_reg = RegInit(0.U(16.W))
  val b_reg = RegInit(0.U(16.W))
  // val a_reg = Reg(UInt())
  // val b_reg = Reg(UInt())

  io.in.ready := true.B

  when (io.in.valid){
    a_reg := io.in.bits.a
    b_reg := io.in.bits.b
  } .elsewhen(a_reg === 0.U){ // return
    a_reg := a_reg
    b_reg := b_reg
  }.elsewhen(a_reg < b_reg) {
    a_reg := b_reg - a_reg
    b_reg := a_reg
  } .otherwise{
    a_reg := a_reg - b_reg
    b_reg := b_reg
  }

  io.out.bits := b_reg
  when(a_reg === 0.U){
    io.out.valid := true.B
  }.otherwise{
    io.out.valid := false.B
  }



  // Implement above ----------

}