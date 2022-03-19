`timescale 1s/10ms
module adder_tb();
	reg [31:0] input0;
	reg [31:0] input1;
	wire [31:0] result;
	wire [0:0] carry;
	
	
	adder DUT(
		input0,
		input1,
		result,
		carry
	);
	initial begin
		#0.4 input0=0;
		#0.4 input1=0;
		#0.4 input0=32'hffffffff;
		#0.4 input1=32'h00000002;
	end
	
	
endmodule