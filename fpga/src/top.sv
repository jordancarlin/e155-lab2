// top.sv
// Jordan Carlin, jcarlin@hmc.edu, 7 September 2024
// Top-level module for the E155 Lab 2 FPGA design

module top (
  input  logic       clk, reset,
  input  logic [3:0] s0, s1,
  output logic [4:0] leds,
  output logic [6:0] segs,
  output logic       disp0, disp1
);

  // Internal logic
  logic [3:0] s;

  // Display sum of inputs on LEDs
  adder adder (.s0, .s1, .sum(leds));

  // Toggle active display
  pulse #(100000) pulse (.clk, .reset, .disp0, .disp1, .s, .s0, .s1);

  // Seven-segment display decoder
  seg_decoder seg_decoder (.s, .segs(segs));

endmodule
