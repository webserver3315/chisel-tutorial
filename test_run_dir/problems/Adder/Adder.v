module Adder(
  input        clock,
  input        reset,
  input  [7:0] io_in0,
  input  [7:0] io_in1,
  output [7:0] io_out
);
  wire  _T_3 = ~reset; // @[Adder.scala 20:9]
  assign io_out = io_in0 + io_in1; // @[Adder.scala 19:10]
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_3) begin
          $fwrite(32'h80000002,"Adder: %d := %d + %d\n",io_out,io_in0,io_in1); // @[Adder.scala 20:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
