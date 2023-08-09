// See LICENSE.txt for license details.
package problems

import chisel3._

// Problem:
//
// Implement a parametrized simple shift register.
// 'n' is the number of elements in the shift register.
// 'w' is the width of one element.

class VecShiftRegisterParam(val n: Int, val w: Int) extends Module {
  val io = IO(new Bundle {
    val in  = Input(UInt(w.W))
    val out = Output(UInt(w.W))
  })

  // Implement below ----------
  val shift_reg = Reg(Vec(n, UInt(w.W)))
  for(i <- 1 until n){
    shift_reg(i) := shift_reg(i-1)
  }
  shift_reg(0) := io.in
  io.out := shift_reg(n-1)

}
// Implement above ----------
