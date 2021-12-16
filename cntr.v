`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:22:15 12/16/2021 
// Design Name: 
// Module Name:    cntr 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module cntr #(parameter rndw = 4)
(  input clk, clr, c_up,
	output reg [rndw-1:0] q
    );

always @(posedge clk) begin
	if(clr) q <= 0;
	if(c_up) q <= q + 1;
end
endmodule
