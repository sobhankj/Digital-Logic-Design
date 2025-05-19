`timescale 1ns / 1ns
module tb_adder();
	reg signed [15:0]a , b;
	reg car;
	wire [15:0]w;
	adder my_add(a , b , car , w);
	initial begin
	a = $random;
      	b = $random;
      	car = $random;
	#500;
	end
endmodule
