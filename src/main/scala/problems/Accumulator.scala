// See LICENSE.txt for license details.
package problems

import chisel3._

// Problem:
//
// Count incoming trues
// (increase counter every clock if 'in' is asserted)
//
class Accumulator extends Module {
	val io = IO(
		new Bundle {
			val in  = Input(UInt(1.W))
			val out = Output(UInt(8.W))
		}
	)

  // Implement below ----------
	val counter = RegInit(0.U(8.W))
	counter := counter + io.in
	io.out := counter
	
	printf("Accumulator: %d %d\n", io.in, io.out)
	println(s"io.out Type: ${io.out.getClass.getSimpleName}")

}
