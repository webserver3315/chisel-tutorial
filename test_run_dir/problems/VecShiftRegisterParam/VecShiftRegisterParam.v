module VecShiftRegisterParam(
  input        clock,
  input        reset,
  input  [3:0] io_in,
  output [3:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] shift_reg_0; // @[VecShiftRegisterParam.scala 19:22]
  reg [3:0] shift_reg_1; // @[VecShiftRegisterParam.scala 19:22]
  reg [3:0] shift_reg_2; // @[VecShiftRegisterParam.scala 19:22]
  reg [3:0] shift_reg_3; // @[VecShiftRegisterParam.scala 19:22]
  reg [3:0] shift_reg_4; // @[VecShiftRegisterParam.scala 19:22]
  reg [3:0] shift_reg_5; // @[VecShiftRegisterParam.scala 19:22]
  reg [3:0] shift_reg_6; // @[VecShiftRegisterParam.scala 19:22]
  reg [3:0] shift_reg_7; // @[VecShiftRegisterParam.scala 19:22]
  assign io_out = shift_reg_7; // @[VecShiftRegisterParam.scala 24:10]
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
  shift_reg_0 = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  shift_reg_1 = _RAND_1[3:0];
  _RAND_2 = {1{`RANDOM}};
  shift_reg_2 = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  shift_reg_3 = _RAND_3[3:0];
  _RAND_4 = {1{`RANDOM}};
  shift_reg_4 = _RAND_4[3:0];
  _RAND_5 = {1{`RANDOM}};
  shift_reg_5 = _RAND_5[3:0];
  _RAND_6 = {1{`RANDOM}};
  shift_reg_6 = _RAND_6[3:0];
  _RAND_7 = {1{`RANDOM}};
  shift_reg_7 = _RAND_7[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    shift_reg_0 <= io_in;
    shift_reg_1 <= shift_reg_0;
    shift_reg_2 <= shift_reg_1;
    shift_reg_3 <= shift_reg_2;
    shift_reg_4 <= shift_reg_3;
    shift_reg_5 <= shift_reg_4;
    shift_reg_6 <= shift_reg_5;
    shift_reg_7 <= shift_reg_6;
  end
endmodule
