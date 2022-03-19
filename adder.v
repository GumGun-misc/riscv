module adder(
	input [31:0] input0_i,
	input [31:0] input1_i,
	output [31:0] output_o,
	output [0:0] carry_o
);
	wire [32:0] addi;
	assign addi = input0_i+input1_i;
	assign output_o = addi[31:0];
	assign carry_o = addi[32];
endmodule