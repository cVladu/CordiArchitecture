`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:20:51 12/16/2021 
// Design Name: 
// Module Name:    mux_sel1 
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
module mux_sel1 #(parameter dw='h10)
(  input [dw-1:0] IN_0, IN_1,
	input sel,
	output [dw-1:0] OUT
    );

assign OUT = sel ? IN_1 : IN_0;

endmodule
