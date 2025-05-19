`timescale 1ns/1ns
module my_oc_as(input a , b , c , output s , co);
	assign #20 s = (~a & ~b & c) | (~a & b & ~c) | (a & b & c) | (a & ~b & ~c);
	assign #30 co = ((a & b) | (a & c) | (b & c));
endmodule
