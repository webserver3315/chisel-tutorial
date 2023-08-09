module PredicateFilter(
  input         io_in_valid,
  input  [15:0] io_in_bits,
  output        io_out_valid,
  output [15:0] io_out_bits
);
  wire  _T = io_in_bits < 16'ha; // @[SingleEvenFilter.scala 31:51]
  assign io_out_valid = io_in_valid & _T; // @[SingleEvenFilter.scala 24:16]
  assign io_out_bits = io_in_bits; // @[SingleEvenFilter.scala 25:16]
endmodule
module PredicateFilter_1(
  input         io_in_valid,
  input  [15:0] io_in_bits,
  output        io_out_valid,
  output [15:0] io_out_bits
);
  assign io_out_valid = io_in_valid & io_in_bits[0]; // @[SingleEvenFilter.scala 24:16]
  assign io_out_bits = io_in_bits; // @[SingleEvenFilter.scala 25:16]
endmodule
module SingleEvenFilter(
  input         clock,
  input         reset,
  input         io_in_valid,
  input  [15:0] io_in_bits,
  output        io_out_valid,
  output [15:0] io_out_bits
);
  wire  u_single_io_in_valid; // @[SingleEvenFilter.scala 31:11]
  wire [15:0] u_single_io_in_bits; // @[SingleEvenFilter.scala 31:11]
  wire  u_single_io_out_valid; // @[SingleEvenFilter.scala 31:11]
  wire [15:0] u_single_io_out_bits; // @[SingleEvenFilter.scala 31:11]
  wire  u_even_io_in_valid; // @[SingleEvenFilter.scala 38:11]
  wire [15:0] u_even_io_in_bits; // @[SingleEvenFilter.scala 38:11]
  wire  u_even_io_out_valid; // @[SingleEvenFilter.scala 38:11]
  wire [15:0] u_even_io_out_bits; // @[SingleEvenFilter.scala 38:11]
  PredicateFilter u_single ( // @[SingleEvenFilter.scala 31:11]
    .io_in_valid(u_single_io_in_valid),
    .io_in_bits(u_single_io_in_bits),
    .io_out_valid(u_single_io_out_valid),
    .io_out_bits(u_single_io_out_bits)
  );
  PredicateFilter_1 u_even ( // @[SingleEvenFilter.scala 38:11]
    .io_in_valid(u_even_io_in_valid),
    .io_in_bits(u_even_io_in_bits),
    .io_out_valid(u_even_io_out_valid),
    .io_out_bits(u_even_io_out_bits)
  );
  assign io_out_valid = u_even_io_out_valid; // @[SingleEvenFilter.scala 48:10]
  assign io_out_bits = u_even_io_out_bits; // @[SingleEvenFilter.scala 48:10]
  assign u_single_io_in_valid = io_in_valid; // @[SingleEvenFilter.scala 46:18]
  assign u_single_io_in_bits = io_in_bits; // @[SingleEvenFilter.scala 46:18]
  assign u_even_io_in_valid = u_single_io_out_valid; // @[SingleEvenFilter.scala 47:16]
  assign u_even_io_in_bits = u_single_io_out_bits; // @[SingleEvenFilter.scala 47:16]
endmodule
