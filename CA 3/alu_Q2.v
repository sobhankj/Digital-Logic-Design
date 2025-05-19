`timescale 1ns / 1ns

module adder (input signed [15:0]A , B , input carry , output [15:0]w);
	assign w = A + B + carry;
endmodule

module ALU_Q2 (input signed[15:0]A , B , input signed[2:0]opcode , input carry , output reg signed[15:0] w , output reg neg , zer);
	
	wire [15:0]resault_adder;
	reg signed [15:0]A_adder , B_adder;
	reg carry_adder;

	assign A_adder = (opcode == 3'b000) ? ~A : A;
	assign B_adder = (opcode == 3'b000 | opcode == 3'b001) ? 16'b0 :
		   	 (opcode == 3'b011) ? (B >> 1) : B;
	assign carry_adder = (opcode == 3'b000 | opcode == 3'b001) ? 1'b1 :
			     (opcode == 3'b010) ? carry : 1'b0;

	adder my_adder(A_adder , B_adder , carry_adder , resault_adder);


	always @(A , B , opcode , carry , resault_adder) begin
	w = 16'b0;
	neg = 1'b0;
	zer = 1'b0;
	case(opcode)
		3'b000 : w = resault_adder;
		3'b001 : w = resault_adder;
		3'b010 : w = resault_adder;
		3'b011 : w = resault_adder;
		3'b100 : w = A & B;
		3'b101 : w = A | B;
		3'b110 : w = {A[7:0] , B[7:0]};
		default : w = 16'b0;
	endcase
	zer = (w == 16'b0) ? 1'b1 : 1'b0;
	neg = (w[15] == 1'b1) ? 1'b1 : 1'b0;
	end
	

endmodule
