// See LICENSE.txt for license details.
package problems

import chisel3.iotesters.PeekPokeTester

class AccumulatorTests(c: Accumulator) extends PeekPokeTester(c) {
  var tot = 0
  for (t <- 0 until 16) {
    val in = rnd.nextInt(2)
    poke(c.io.in, in)
    step(1)
    if (in == 1) tot += 1

    val out = peek(c.io.out).toInt
    printf("out: %d\n", out)

    expect(c.io.out, tot)
	  // println("hello world!!!")
    // println(s"val in: $in")
    // println(s"c.io.out: $c.io.out")
    // println("c.io.out: " + c.io.out.peekInt())

    // printf("Accumulator: %d %d\n", c.io.in, c.io.out)
    // println(s"c.io.out Type: ${c.io.out.getClass.getSimpleName}")

  }
}
