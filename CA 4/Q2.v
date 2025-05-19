`timescale 1ns/1ns

module D_flipflop(input clk , d , output q , qbar);
   wire w1 , w2 , w3 , w4;
   SR2input my2inp(.s(w4) , .r(clk) , .q(w1) , .qbar(w2));
   SR23input my23inp(.s0(w2) , .s1(clk) , .r0(d) , .q(w3) , .qbar(w4));
   SR2input myinp2(.s(w2) , .r(w3) , .q(q) , .qbar(qbar));
endmodule

module D_flipflop2(input clk , d , output q , qbar);
   wire w1 , w2 , w3 , w4;
   SR2input my2inp(.s(w4) , .r(clk) , .q(w1) , .qbar(w2));
   SR3input my3inp(.s0(w2) , .s1(clk) , .r0(d) , .r1(d) , .q(w3) , .qbar(w4));
   SR2input myinp2(.s(w2) , .r(w3) , .q(q) , .qbar(qbar));
endmodule