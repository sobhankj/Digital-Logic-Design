`timescale 1ns/1ns

module D_flipflop_reset_preset(input pre , clr , clk , d , output q , qbar);
   wire w1 , w2 , w3 , w4;
   SR3input my3inp1(.s0(pre) , .s1(w4) , .r0(clr) , .r1(clk) , .q(w1) , .qbar(w2));
   SR3input my3inp2(.s0(w2) , .s1(clk) , .r0(clr) , .r1(d) , .q(w3) , .qbar(w4));
   SR3input my3inp3(.s0(pre) , .s1(w2) , .r0(clr) , .r1(w3) , .q(q) , .qbar(qbar));
endmodule
