`timescale 1ns / 1ns
module ALU (input signed[15:0]A , B , input signed[2:0]opcode , input carry , output reg signed[15:0] w , output reg neg , zer);
	
	always @(A , B , opcode , carry) begin
	w = 16'b0;
	neg = 1'b0;
	zer = 1'b0;
	case(opcode)
		3'b000 : w = ~A + 1;
		3'b001 : w = A + 1;
		3'b010 : w = A + B + carry;
		3'b011 : w = A + (B >> 1);
		3'b100 : w = A & B;
		3'b101 : w = A | B;
		3'b110 : w = {A[7:0] , B[7:0]};
		default : w = 16'b0;
	endcase
	zer = (w == 16'b0) ? 1'b1 : 1'b0;
	neg = (w[15] == 1'b1) ? 1'b1 : 1'b0;
	end
	

endmodule
