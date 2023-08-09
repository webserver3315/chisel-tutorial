// See LICENSE.txt for license details.
package problems

import chisel3.iotesters.PeekPokeTester

// Problem:
//
// Implement test with PeekPokeTester
//
class Max2Tests(c: Max2) extends PeekPokeTester(c) {
  for (i <- 0 until 10) {

    // Implement below ----------

    val in0 = rnd.nextInt(8) // 8 미만의 수가 랜덤으로 들어감
    val in1 = rnd.nextInt(8)
    println("in0(" + in0 + ") VS in1(" + in1 + ")")
    poke(c.io.in0, in0)
    poke(c.io.in1, in1)
    step(1)


    val out = peek(c.io.out).toString
    println("out(" + out + ")")

    expect(c.io.out, {if(in0 > in1) in0 else in1})

    // Implement above ----------
  }
}
