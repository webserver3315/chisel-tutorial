// See LICENSE.txt for license details.
package problems

import chisel3.iotesters.PeekPokeTester

// Problem:
//
// Implement test for MaxN using PeekPokeTester
//
class MaxNTests(c: MaxN) extends PeekPokeTester(c) {
  for (t <- 0 until 10) {
    printf("%dth TEST\n", t)
    var mx = 0
    for (i <- 0 until c.n) {
      // Implement below ----------
      val testcase = rnd.nextInt(2^c.w - 1)
      printf("%dth input: %d\n", i, testcase)
      poke(c.io.ins(i), testcase)
      if(mx < testcase) mx = testcase
      // Implement above ----------
    }
    step(1)
    // Implement below ----------
    val out = peek(c.io.out).toInt
    printf("biggest: %d\n", mx)
    printf("output: %d\n", out)
    expect(c.io.out, mx)
    // Implement above ----------
  }
}
