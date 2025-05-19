`timescale 1ns/1ns

module TBQ1();
   reg ss , rr;
   wire qq1 , qqbar1;
   wire qq2 , qqbar2;
   wire qq3 , qqbar3;
   SR2input my2inp(.s(ss) , .r(rr) , .q(qq1) , .qbar(qqbar1));
   SR3input my3inp(.s0(ss) , .s1(ss) , .r0(rr) , .r1(rr) , .q(qq2) , .qbar(qqbar2));
   SR23input my23inp(.s0(ss) , .s1(ss) , .r0(rr) , .q(qq3) , .qbar(qqbar3));
   initial begin
      ss = 0; rr = 1;
      #100 ss = 0; rr = 0;
      #100 ss = 0; rr = 1;
      #100 ss = 0; rr = 0;
      #100 ss = 1; rr = 0;
      #100 ss = 0; rr = 0;
      #100 ss = 1; rr = 1;
      #100 ss = 0; rr = 0;
      #100 ss = 0; rr = 1;
      #100 ss = 1; rr = 0;
      #100 ss = 0; rr = 1;
      #100 ss = 1; rr = 1;
      #100 ss = 0; rr = 1;
      #100 ss = 1; rr = 0;
      #100 ss = 1; rr = 1;
      #100 ss = 1; rr = 0;
      #100 ss = 1; rr = 1;
      #100 $stop;
    end
endmodule
