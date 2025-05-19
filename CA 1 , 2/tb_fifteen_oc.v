`timescale 1ns/1ns
module octb_fiftheen ();
	reg aa0 = 0 , aa1 = 0 , aa2 = 0 , aa3 = 0 , aa4 = 0 , aa5 = 0 , aa6 = 0 , aa7 = 0 , aa8 = 0 , aa9 = 0 , aa10 = 0 , aa11 = 0 , aa12 = 0 , aa13 = 0 , aa14 = 0;
	wire so0 , so1 , so2 , so3;
	my_oc_fifteen OC(aa0 , aa1 , aa2 , aa3 , aa4 , aa5 , aa6 , aa7 , aa8 , aa9 , aa10 , aa11 , aa12 , aa13 , aa14, so0 , so1 , so2 , so3);
	initial repeat(5) #400 aa0 = ~aa0;
	initial repeat(6) #445 aa1 = ~aa1;
	initial repeat(3) #556 aa2 = ~aa2;
	initial repeat(6) #445 aa3 = ~aa3;
	initial repeat(8) #389 aa4 = ~aa4;
	initial repeat(2) #550 aa5 = ~aa5;
	initial repeat(4) #450 aa6 = ~aa6;
	initial repeat(5) #349 aa7 = ~aa7;
	initial repeat(9) #290 aa8 = ~aa8;
	initial repeat(2) #367 aa9 = ~aa9;
	initial repeat(4) #500 aa10 = ~aa10;
	initial repeat(6) #400 aa11 = ~aa11;
	initial repeat(10) #350 aa12 = ~aa12;
	initial repeat(7) #390 aa13 = ~aa13;
	initial repeat(4) #500 aa14 = ~aa14;
endmodule
