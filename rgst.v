`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:18:21 12/16/2021 
// Design Name: 
// Module Name:    rgst 
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
module rgst #(parameter dw = 'h10, clr_val = {dw{1'b0}})
(  input ld,
	input [dw-1:0] d,
	input clr,
	input clk,
	output reg [dw-1:0] q
    );

always @(posedge clk) begin
	if(clr) q <= clr_val;
	if(ld) q <= d;
end
endmodule
