`timescale 1ns / 1ns
module adder (input signed [15:0]A , B , input carry , output [15:0]w);
	assign w = A + B + carry;
endmodule