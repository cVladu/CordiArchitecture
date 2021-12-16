`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:11:01 12/16/2021
// Design Name:   arith_rsh
// Module Name:   /home/cvladu/Fundamentele_Calculatoarelor/ArhitecturaCalculatoarelor/CordicArchitecture/CordicArchitecture/arith_rsh_tb.v
// Project Name:  CordicArchitecture
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: arith_rsh
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module arith_rsh_tb;

	// Inputs
	reg [15:0] p;
	reg [3:0] i;

	// Outputs
	wire [15:0] o;

	// Instantiate the Unit Under Test (UUT)
	arith_rsh uut (
		.p(p), 
		.i(i), 
		.o(o)
	);

	initial begin
		// Initialize Inputs
		p = 0;
		i = 0;

		// Wait 100 ns for global reset to finish
		#100;
      p = -5;
		i = 2;
		
		#100;
		p = 20;
		i = 3;
		
		#100;
		p = -20;
		i = 2;
		// Add stimulus here

	end
      
endmodule

