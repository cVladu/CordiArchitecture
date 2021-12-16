`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:09:11 12/16/2021 
// Design Name: 
// Module Name:    arith_rsh 
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
module arith_rsh #(parameter dw = 'h10, shw = 4)
(  input [shw-1:0] p,
	input [dw-1:0] i,
	output [dw-1:0] o
    );
	 
assign o = $signed(i) >>> p;

endmodule
