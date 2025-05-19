`timescale 1ns/1ns
module seven_oc_as (input a0 , a1 , a2 , a3 , a4 , a5 , a6 , output s0 , s1 , s2);
	wire w11 , w12 , w21 , w22 , w32;
	my_oc_as OC0(a0 , a1 , a2 , w11 , w12);
	my_oc_as OC1(a3 , a4 , a5 , w21 , w22);
	my_oc_as OC2(a6 , w11 , w21 , s0 , w32);
	my_oc_as OC3(w12 , w22 , w32 , s1 , s2);
endmodule
