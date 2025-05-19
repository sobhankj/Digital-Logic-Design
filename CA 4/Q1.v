`timescale 1ns/1ns

module SR2input(input s , r , output q , qbar);
   nand #(8) n1(q , s , qbar);
   nand #(8) n2(qbar , q , r);
endmodule


module SR3input(input s0 , s1 , r0 , r1 , output q , qbar);
   nand #(12) n1(q , s0 , s1 , qbar);
   nand #(12) n2(qbar , q , r0 , r1);
endmodule


module SR23input(input s0 , s1 , r0 , output q , qbar);
   nand #(12) n1(q , s0 , s1 , qbar);
   nand #(8) n2(qbar , q , r0);
endmodule
