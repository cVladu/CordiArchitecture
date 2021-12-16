`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:26:25 12/16/2021 
// Design Name: 
// Module Name:    cordicctrl 
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
module cordicctrl #(parameter rndw = 4)
(	input bgn, clk,
	input [rndw-1:0] itr,
	output reg init, ld, fin
    );
localparam S_WAIT = 2'b00;
localparam S_EXEC = 2'b01;
localparam S_END = 2'b10;

reg[1:0] state, state_next;

initial begin
	state = S_WAIT;
end

always @(posedge clk) begin
	//#1;
	state <= state_next;
end

always @(state, bgn, itr) begin
	ld = 1'b0;
	init = 1'b0;
	fin = 1'b0;
	case(state)
		S_WAIT: 
			if(bgn) begin
				ld <= 1'b1;
				init <= 1'b1;
				state_next <= S_EXEC;
			end
			else begin
				state_next <= S_WAIT;
			end
		S_EXEC:
			if(itr == 15) begin
				ld <= 1'b1;
				state_next <= S_END;
			end
			else begin
				ld <= 1'b1;
				state_next <= S_EXEC;
			end
		S_END:
			begin
				fin <= 1'b1;
				state_next <= S_WAIT;
			end
		endcase
end
	
endmodule
