`timescale 1ns/1ns
module my_oc (input a , b , c , output s , co);
	wire out1 , out2 , out3 , out4 , w1 , w2 , w3 , w4 , w5 , w6 , w7 , w8 , w9 , w10 , w11;
	supply1 vdd1 , vdd2 , vdd3 , vdd4 , vdd5 , vdd6;
	supply0 gnd1 , gnd2 , gnd3 , gnd4 , gnd5 , gnd6;

	nmos #(3 , 4 , 5) n1(out1 , w1 , ~a),
			  n2(out1 , w1 , b),
			  n3(w1 , gnd1 , a),
			  n4(w1 , gnd1 , ~b);
	pmos #(5 , 6 , 7) p1(out1 , w2 , a),
			  p2(out1 , w3 , ~a),
			  p3(w2 , vdd1 , ~b),
			  p4(w3 , vdd1 , b);

	nmos #(3 , 4 , 5) n5(s , w4 , ~out1),
			  n6(s , w4 , c),
			  n7(w4 , gnd2 , out1),
			  n8(w4 , gnd2 , ~c);
	pmos #(5 , 6 , 7) p5(s , w5 , out1),
			  p6(w5 , vdd2 , ~c),
			  p7(s , w6 , ~out1),
			  p8(w6 , vdd2 , c);
	

	nmos #(3 , 4 , 5) n9(out2 , w7 , a),
			  n10(w7 , gnd3 , b);
	pmos #(5 , 6 , 7) p9(out2 , vdd3 , a),
			  p10(out2 , vdd3 , b);
	nmos #(3 , 4 , 5) n11(out3 , w8 , a),
			  n12(w8 , gnd4 , c);
	pmos #(5 , 6 , 7) p11(out3 , vdd4 , a),
			  p12(out3 , vdd4 , c);
	nmos #(3 , 4 , 5) n13(out4 , w9 , b),
			  n14(w9 , gnd5 , c);
	pmos #(5 , 6 , 7) p13(out4 , vdd5 , b),
			  p14(out4 , vdd5 , c);
	nmos #(3 , 4 , 5) n15(co , w10 , out2),
			  n16(w10 , w11 , out3),
			  n17(w11 , gnd6 , out4);
	pmos #(5 , 6 , 7) p15(co , vdd6 , out2),
			  p16(co , vdd6 , out3),
			  p17(co , vdd6 , out4);

endmodule
