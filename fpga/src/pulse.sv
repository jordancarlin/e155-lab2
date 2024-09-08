// pulse.sv
// Jordan Carlin, jcarlin@hmc.edu, 7 September 2024
// Pulse module that toggles outputs based on a configuirable frequency signal

module pulse #(parameter THRESHOLD = 1000) (
  input  logic       clk,
  input  logic [3:0] s0, s1,
  output logic [3:0] s,
  output logic       disp0, disp1
);

  logic        ck_stb;
  logic [31:0] counter;

  // Generate slower clock signal
  always_ff @(posedge clk)
    ck_stb <= (counter == THRESHOLD-1'b1);

  // Toggle the LED when the counter reaches the threshold
  always_ff @(posedge clk) begin
    if (ck_stb) begin
      disp0 <= ~disp0;
      s = disp0 ? s0 : s1;
      counter <= 0;
    end else
      counter <= counter + 1;
  end

  // Only one display should be active
  assign disp1 = ~disp0;
endmodule
