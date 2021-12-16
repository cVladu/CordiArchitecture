`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:05:44 12/16/2021 
// Design Name: 
// Module Name:    Add_Sub 
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
module Add_Sub #(parameter dw = 'h10)
(	input [dw-1: 0] a, b,
	input add,
	output [dw-1: 0] c
    );

assign c = add ? a + b : a - b;

endmodule
