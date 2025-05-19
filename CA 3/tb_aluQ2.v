`timescale 1ns / 1ns;
module tb_alu_yosys_Q2();
//Inputs
	reg signed[15:0] AA,BB;
 	reg[2:0] opcodee;
 	reg carryy;

//Outputs
 	wire signed[15:0] ww , wwYO , wwQ2;
 	wire zerr , zerrYO , zerrQ2;
 	wire negg , neggYO , neggQ2;
 // Verilog code for ALU
 	ALU my_alu(AA , BB , opcodee , carryy , ww , negg , zerr);
	ALU_YOSYS_FINALL my_alu_yo(AA , BB , opcodee , carryy , wwYO , neggYO , zerrYO);
	ALU_Q2 my_alu_q2(AA , BB , opcodee , carryy , wwQ2 , neggQ2 , zerrQ2);
    	initial begin
 	repeat (3) begin
      	AA = $random;
      	BB = $random;
      	carryy = $random;

	opcodee = 3'b0;
      	#1000;
	opcodee = 3'd1;
	#1000;
	opcodee = 3'd2;
	#1000;
	opcodee = 3'd3;
	#1000;
	opcodee = 3'd4;
	#1000;
	opcodee = 3'd5;
	#1000;
	opcodee = 3'd6;
	#1000;
	opcodee = 3'd7;
	#1000;
	end
    	end
endmodule
