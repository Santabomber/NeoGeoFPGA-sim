`timescale 1ns/1ns

module FJD(
	input CK,
	input J, K,
	input nCL,
	output reg Q = 1'b0,
	output nQ
);

	always @(posedge CK or posedge ~nCL)
	begin
		if (~nCL)
			Q <= 1'b0;
		else
		begin
			case({J, K})
				2'b00 : Q <= Q;
				2'b01 : Q <= 1'b0;
				2'b10 : Q <= 1'b1;
				2'b11 : Q <= ~Q;
			endcase
		end
	end
	
	assign nQ = ~Q;

endmodule
