// See LICENSE.txt for license details.
package problems

import chisel3.iotesters.PeekPokeTester

class AdderTests(c: Adder) extends PeekPokeTester(c) {
  for (i <- 0 until 10) {
    val in0 = rnd.nextInt(1 << c.w)
    val in1 = rnd.nextInt(1 << c.w)
    poke(c.io.in0, in0)
    poke(c.io.in1, in1)
    step(1)
    expect(c.io.out, (in0 + in1)&((1 << c.w)-1))
    // printf("hello world!")
    // println(s"c.io.in0 ${peek(c.io.in0)}")

    // printf("Type of io.input: %d\n", c.io.in0)
    // println(s"INPUT: c.io.out(%d) := c.io.in0(%d) + c.io.in1(%d)", c.io.out, c.io.in0, c.io.in1)
  }
}
