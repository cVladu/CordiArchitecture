`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:45:15 12/16/2021 
// Design Name: 
// Module Name:    cordi_arch 
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
module cordi_arch
(
	input [15:0] theta, 
	input bgn,
	input clk,
	output [15:0] cos,
	output fin
);
wire[15:0] Xi, Xi_add, Xi_reg, Xi_sh, Yi, Yi_add, Yi_reg, Yi_sh, Zi, Zi_add, Zi_reg, arctan_const;
wire init, ld;
wire[3:0] iter;


mux_sel1 #(.dw(16)) MUX_X (.IN_1(16'h26dd), .IN_0(Xi_add), .sel(init), .OUT(Xi_reg));
mux_sel1 #(.dw(16)) MUX_Y (.IN_1(0), .IN_0(Yi_add), .sel(init), .OUT(Yi_reg));
mux_sel1 #(.dw(16)) MUX_Z (.IN_1(theta), .IN_0(Zi_add), .sel(init), .OUT(Zi_reg));

rgst #(.dw(16)) rgst_X (.d(Xi_reg), .clr(1'b0), .clk(clk), .ld(ld), .q(Xi));
rgst #(.dw(16)) rgst_Y (.d(Yi_reg), .clr(1'b0), .clk(clk), .ld(ld), .q(Yi));
rgst #(.dw(16)) rgst_Z (.d(Zi_reg), .clr(1'b0), .clk(clk), .ld(ld), .q(Zi));

cntr #(.rndw(4)) cntr_ (.clk(clk), .clr(init), .c_up(~init & ld), .q(iter));

cordicctrl #(.rndw(4)) ctrl_ (.clk(clk), .init(init), .ld(ld), .fin(fin), .bgn(bgn), .itr(iter));

ROM_Mem #(.aw(4), .dw(16)) rom (.clk(~clk), .rst_b(1'b1), .addr(iter), .data(arctan_const));

arith_rsh #(.dw(16), .shw(4)) arshX (.i(Xi), .p(iter), .o(Xi_sh));
arith_rsh #(.dw(16), .shw(4)) arshY (.i(Yi), .p(iter), .o(Yi_sh));

Add_Sub #(.dw(16)) AddSub_X (.a(Xi), .b(Yi_sh), .c(Xi_add), .add(Zi[15]));
Add_Sub #(.dw(16)) AddSub_Y (.a(Yi), .b(Xi_sh), .c(Yi_add), .add(~Zi[15]));
Add_Sub #(.dw(16)) AddSub_Z (.a(Zi), .b(arctan_const), .c(Zi_add), .add(Zi[15]));

assign cos = Xi;
endmodule
