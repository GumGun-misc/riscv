module g_mux2(
	input [31:0] input0_i,
	input [31:0] input1_i,
	input [0:0] selector_i,
	output reg [31:0] output_o
);
	always @(*) begin
		case(selector_i)
			1'b0: output_o <= input0_i;
			1'b1: output_o <= input1_i;
		endcase
	end
endmodule

