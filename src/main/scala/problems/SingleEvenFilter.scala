// See LICENSE.txt for license details.
package problems

import chisel3._
import chisel3.util._

// Problem:
//
// Create a composition (chain) of two filters:
//
// SingleFilter - indicates that input is single decimal digit
// (i.e. is less or equal to 9)
//
// EvenFilter   - indicates that input is even number
//
abstract class Filter[T <: Data](dtype: T) extends Module {
  val io = IO(new Bundle {
    val in = Input(Valid(dtype))
    val out = Output(Valid(dtype))
  })
}

class PredicateFilter[T <: Data](dtype: T, f: T => Bool) extends Filter(dtype) {
  io.out.valid := io.in.valid && f(io.in.bits)
  io.out.bits  := io.in.bits
}

object SingleFilter {
  def apply[T <: UInt](dtype: T) = 
    // Change function argument of Predicate filter below ----------
    Module(new PredicateFilter(dtype, (x: T) => x < 10.U))
    // Change function argument of Predicate filter above ----------
}

object EvenFilter {
  def apply[T <: UInt](dtype: T) = 
    // Change function argument of Predicate filter below ----------
    Module(new PredicateFilter(dtype, (x: T) => x(0)))
    // Change function argument of Predicate filter above ----------
}

class SingleEvenFilter[T <: UInt](dtype: T) extends Filter(dtype) {
  // Implement composition below ----------
  val u_single = SingleFilter(dtype)
  val u_even = EvenFilter(dtype)
  u_single.io.in := io.in
  u_even.io.in := u_single.io.out
  io.out := u_even.io.out

  // Implement composition above ----------
}
