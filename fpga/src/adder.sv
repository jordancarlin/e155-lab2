// adder.sv
// Jordan Carlin, jcarlin@hmc.edu, 7 September 2024
// Adds 2 binary encoded numbers

module adder(
  input  logic [3:0] s0, s1,
  output logic [4:0] sum
);

  assign sum = s0 + s1;

endmodule
