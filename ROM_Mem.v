`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:58:41 12/16/2021 
// Design Name: 
// Module Name:    ROM_Mem 
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
module ROM_Mem #(parameter aw='h10, dw=8, file="rom_file_arctan.txt")
(	input clk, rst_b,
	input [aw-1:0] addr,
	output reg [dw-1:0] data
    );

reg [dw-1:0] mem[0:2**aw-1];

initial $readmemh(file, mem, 0, 2**aw-1);

always @(posedge clk, negedge rst_b) begin
	if(rst_b == 0) data <= 0;
	else data <= mem[addr];
end

endmodule
