`timescale 1ns/1ns
module my_oc_per(input a , b , c , output s , co);
	wire out1 , out2 , out3 , out4;
	xor #(10 , 14) x1(out1 , a , b),
		       x2(s , out1 , c);

	nand #(10 , 8) n1(out2 , a , b),
		       n2(out3 , a , c),
		       n3(out4 , b , c);
	nand #(15 , 12) n4(co , out2 , out3 , out4);
endmodule
