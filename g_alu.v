module g_alu(
	input [31:0] input0_i,
	input [31:0] input1_i,
	input [2:0] funct3_i,
	input [0:0] funct7_i,
	output reg [31:0] output_o,
	output [0:0] carry_o
);
	reg [31:0] additionHolder;
	wire [31:0] adderOutput;
	wire [0:0] adderCarry;
	
	adder aluAdder(
		input0_i, 
		input1_i, 
		adderOutput, 
		adderCarry
	);
	
	always @* begin
		case(funct7_i)
			1'b0: additionHolder = input1_i;
			1'b1: additionHolder = ~input1_i+1;
		endcase
	end
	
	always @* begin
		case(funct3_i)
			3'h0:begin
				output_o <= input0_i + additionHolder;
			end
			3'h1:begin
				output_o <= input0_i << input1_i;
			end
			3'h2:begin
				output_o <= input0_i + input1_i;
			end
			3'h3:begin
				output_o <= input0_i + input1_i;
			end
			3'h4:begin
				output_o <= input0_i ^ input1_i;
			end
			3'h5:begin
				if(funct7_i)
					output_o <= input0_i >>> input1_i;
				else
					output_o <= input0_i >> input1_i;
			end
			3'h6:begin
				output_o <= input0_i | input1_i;
			end
			3'h7:begin
				output_o <= input0_i & input1_i;
			end
			default:output_o<=32'hffff;
		endcase
	end
endmodule