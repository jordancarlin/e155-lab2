// lab2_tb.sv
// Jordan Carlin, jcarlin@hmc.edu, 7 September 2024
// Testbench for the E155 Lab 2 FPGA design

`timescale 1ns/1ns
`default_nettype none
`define N_TV 10

module lab2_tb();
  // Set up test signals
  logic        clk;
  logic [3:0]  s0, s1;
  logic [4:0]  leds//, leds_expected;
  logic [6:0]  segs//, segs_expected;
  // logic        disp0, disp1, disp0_expected, disp1_expected;
  // logic [31:0] vectornum, errors;
  // logic [21:0] testvectors[10000:0]; // Vectors of format s0[3:0]_s1[3:0]_segs[6:0]_disp0_disp1_leds

  // Instantiate the device under test
  top dut(.*);

  // Generate clock signal with a period of 10 timesteps.
  always begin
    clk = 1; #5;
    clk = 0; #5;
  end
  
  // At the start of the simulation:
  //  - Load the testvectors
  //  - Pulse the reset line (if applicable)
  // initial begin
  //   $readmemb("lab2_testvectors.tv", testvectors, 0, `N_TV - 1);
  //   vectornum = 0; errors = 0;
  // end

  // Apply test vector on the rising edge of clk
  initial begin
    #12;
    s0=4'b0000; s1=4'b0000; #20;
    s0=4'b0001; s1=4'b0000; #20;
    s0=4'b0000; s1=4'b0001; #20;
    s0=4'b0001; s1=4'b0001; #20;
    s0=4'b1111; s1=4'b0000; #20;
    s0=4'b0000; s1=4'b1111; #20;
    s0=4'b1111; s1=4'b1111; #20;
    s0=4'b0100; s1=4'b0010; #20;
  end

  // Create dumpfile for signals
  initial begin
    $dumpfile("lab2_tb.vcd");
    $dumpvars(0, lab2_tb);
  end

  // Check results on the falling edge of clk
  always @(negedge clk) begin
    // if (leds != leds_expected || segs != segs_expected || disp0 != disp0_expected || disp1 != disp1_expected) begin
    //   $display("Error: inputs: s0=%b, s1=%b", s0, s1);
    //   $display(" outputs: leds=%b (%b expected), segs=%b (%b expected), disp0_1=%b_%b (%b_%b expected)", leds, leds_expected, segs, segs_expected, disp0, disp1, disp0_expected, disp1_expected);
    //   errors = errors + 1;
    // end

    vectornum = vectornum + 1;
    if (testvectors[vectornum] === 22'bx) begin
      $display("%d tests completed") // with %d errors.", vectornum, errors);
      $stop;
    end
  end
endmodule
