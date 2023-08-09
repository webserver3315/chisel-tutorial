// See LICENSE.txt for license details.
package problems

import chisel3._
import scala.collection.mutable.ArrayBuffer

// Problem:
//
// Implement a four-by-four multiplier using a look-up table.
//
class Mul extends Module {
  val io = IO(new Bundle {
    val x   = Input(UInt(4.W))
    val y   = Input(UInt(4.W))
    val z   = Output(UInt(8.W))
  })
  val mulsValues = new ArrayBuffer[UInt]()

  // Calculate io.z = io.x * io.y by generating a table of values for mulsValues
  for(x <- 0 until 1<<4){
    for(y<-0 until 1<<4){
      // mulsValues(x,y) := x*y
      mulsValues += (x*y).asUInt(8.W)
    }
  }

  val LUT = VecInit(mulsValues)
  // println(LUT.mkString(" "))
  // printf(cf"LUT = $LUT")

  // Implement below ----------
  // z := mulsValues(io.x,io.y)
  io.z := LUT((io.x << 4.U) | io.y)

  // Implement above ----------
}
