`timescale 1ns/1ns
module my_oc_fifteen(input a0 , a1 , a2 , a3 , a4 , a5 , a6 , a7 , a8 , a9 , a10 , a11 , a12 , a13 , a14 , output s0 , s1 , s2 , s3);
	wire w11 , w12 , w13 , w21 , w22 , w23 , w32;
	seven_oc OC0(a0 , a1 , a2 , a3 , a4 , a5 , a6 , w11 , w12 , w13);
	seven_oc OC1(a7 , a8 , a9 , a10 , a11 , a12 , a13 , w21 , w22 , w23);
	my_oc OC2(a14 , w11 , w21 , s0 , w32);
	my_oc OC3(w12 , w22 , w32 , s1 , w43);
	my_oc OC4(w13 , w23 , w43 , s2 , s3);
endmodule
