`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:07:35 12/16/2021
// Design Name:   Add_Sub
// Module Name:   /home/cvladu/Fundamentele_Calculatoarelor/ArhitecturaCalculatoarelor/CordicArchitecture/CordicArchitecture/Add_Sub_tb.v
// Project Name:  CordicArchitecture
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Add_Sub
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Add_Sub_tb;

	// Inputs
	reg [15:0] a;
	reg [15:0] b;
	reg add;

	// Outputs
	wire [15:0] c;

	// Instantiate the Unit Under Test (UUT)
	Add_Sub uut (
		.a(a), 
		.b(b), 
		.add(add), 
		.c(c)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		add = 0;

		// Wait 100 ns for global reset to finish
		#100;
      a = 20;
		b = 5;
		#100;
		a = 15;
		b = 2;
		add = 1;
		#100;
		a = 20;
		b = 5;
		#100;
		// Add stimulus here

	end
      
endmodule

