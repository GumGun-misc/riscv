module risc(
	input [1:0] hola_i,
	output reg [31:0] hola_o
);
	wire [31:0] cable0;
	wire [31:0] cable1;
	assign cable0=32'h0000;
	assign cable1=32'hffff;
	
	g_mux2 test(cable0,cable1,hola_i,hola_o);

	/*
	always @(hola_i)begin
		hola_o <= 2'b00;
	end
	*/

endmodule