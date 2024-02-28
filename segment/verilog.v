/* Automatically generated from https://wokwi.com/projects/390887658366731265 */

`default_nettype none

module top(
  input  wire [7:0] ui_in,    // Dedicated inputs
  output wire [7:0] uo_out,    // Dedicated outputs
  input ena,
  input clk,
  input rst_n
);

wire [7:0] value;
reg [7:0] out;

assign uo_out = out;

assign value = ui_in;

always@(*) begin
  case (value) 
      default: out = 7'b0111111;
      'h1: out = 7'b0000110;
      'h2: out = 7'b1011011;
      'h3: out = 7'b1001111;
      'h4: out = 7'b1100110;
      'h5: out = 7'b1101101;
      'h6: out = 7'b1111101;
      'h7: out = 7'b0000111;
      'h8: out = 7'b1111111;
      'h9: out = 7'b1100111;
      'ha: out = 7'b1110111;
      'hb: out = 7'b1111100;
      'hc: out = 7'b0111001;
      'hd: out = 7'b1011110;
      'he: out = 7'b1111001;
      'hf: out = 7'b1110001;
  endcase
end

endmodule






