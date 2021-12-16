`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:11:33 12/16/2021
// Design Name:   cordi_arch
// Module Name:   /home/cvladu/Fundamentele_Calculatoarelor/ArhitecturaCalculatoarelor/CordicArchitecture/CordicArchitecture/cordi_arch_tb.v
// Project Name:  CordicArchitecture
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cordi_arch
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module cordi_arch_tb;

	// Inputs
	reg [15:0] theta;
	reg bgn;
	reg clk;
	// Outputs
	wire [15:0] cos;
	wire fin;

	// Instantiate the Unit Under Test (UUT)
	cordi_arch uut (
		.theta(theta), 
		.bgn(bgn), 
		.cos(cos), 
		.fin(fin),
		.clk(clk)
	);
	always begin
		#1 clk <= ~clk;
	end
	initial begin
		// Initialize Inputs
		theta = 16'b1011_1100_1010_1101;
		bgn = 0;
		clk = 0;
		// Wait 100 ns for global reset to finish
		#100;
      bgn = 1;

		#20;
		bgn = 0;
		// Add stimulus here

	end
      
endmodule

