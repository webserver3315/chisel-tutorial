// See LICENSE.txt for license details.
package problems

import chisel3._

// Problem:
//
// Implement test for this module. Please edit:
// .../chisel-tutorial/src/test/scala/problems/MaxNTests.scala
//
class MaxN(val n: Int, val w: Int) extends Module {

  private def Max2(x: UInt, y: UInt) = Mux(x > y, x, y)

  val io = IO(new Bundle {
    val ins = Input(Vec(n, UInt(w.W)))
    val out = Output(UInt(w.W))
  })
  io.out := io.ins.reduceLeft(Max2)
  // https://stackoverflow.com/questions/75702209/reduceleft-or-foldleft-vs-reduceright-or-foldright-in-scala
  // list(x1, x2, ..., xn).reduceLeft(op)
  // == x1.op(x2)....op(xn)
  // 즉, ins(1).Max2(ins(2)).Max2(ins(3))....Max2(insn)
}
