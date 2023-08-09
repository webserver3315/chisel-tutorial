module RealGCD(
  input         clock,
  input         reset,
  output        io_in_ready,
  input         io_in_valid,
  input  [15:0] io_in_bits_a,
  input  [15:0] io_in_bits_b,
  output        io_out_valid,
  output [15:0] io_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [15:0] a_reg; // @[RealGCD.scala 23:22]
  reg [15:0] b_reg; // @[RealGCD.scala 24:22]
  wire  _T = a_reg == 16'h0; // @[RealGCD.scala 33:21]
  wire  _T_1 = a_reg < b_reg; // @[RealGCD.scala 36:20]
  wire [15:0] _T_3 = b_reg - a_reg; // @[RealGCD.scala 37:20]
  wire [15:0] _T_5 = a_reg - b_reg; // @[RealGCD.scala 40:20]
  assign io_in_ready = 1'h1; // @[RealGCD.scala 28:15]
  assign io_out_valid = a_reg == 16'h0; // @[RealGCD.scala 46:18 RealGCD.scala 48:18]
  assign io_out_bits = b_reg; // @[RealGCD.scala 44:15]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  a_reg = _RAND_0[15:0];
  _RAND_1 = {1{`RANDOM}};
  b_reg = _RAND_1[15:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      a_reg <= 16'h0;
    end else if (io_in_valid) begin
      a_reg <= io_in_bits_a;
    end else if (!(_T)) begin
      if (_T_1) begin
        a_reg <= _T_3;
      end else begin
        a_reg <= _T_5;
      end
    end
    if (reset) begin
      b_reg <= 16'h0;
    end else if (io_in_valid) begin
      b_reg <= io_in_bits_b;
    end else if (!(_T)) begin
      if (_T_1) begin
        b_reg <= a_reg;
      end
    end
  end
endmodule
