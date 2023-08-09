// See LICENSE.txt for license details.
package problems

import chisel3._


import chisel3.util.Cat 
// Problem:
//
// Implement a 16-bit Fibonacci Linear-feedback shift register
// with polynomial x^16 + x^14 + x^13 + x^11 + 1
// State change is allowed only when 'inc' is asserted
//
class LFSR16 extends Module {
  val io = IO(new Bundle {
    val inc = Input(Bool())
    val out = Output(UInt(16.W))
  })

  // Implement below ----------

  val regs = RegInit(1.U(16.W))
  when(io.inc){
    val nxt_regs = Cat(regs(0)^regs(2)^regs(3)^regs(5), regs(15,1))
    // registers(0):=registers(16)+registers(14)+registers(13)+registers(11)+1
    regs := nxt_regs
  }

  io.out := regs

  // Implement above ----------
}
