// lab2_jc.sv
// Jordan Carlin, jcarlin@hmc.edu, 7 September 2024
// FPGA implementation for E155 Lab 2

module lab2_jc (
  input  logic [3:0] s0, s1,
  output logic [4:0] leds,
  output logic [6:0] segs,
  output logic disp0, disp1
);

	logic clk;

	// Internal high-speed oscillator
	HSOSC hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(clk));

	// Main verilog module
	top top (.*);
endmodule
