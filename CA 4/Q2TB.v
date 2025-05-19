`timescale 1ns/1ns

module TBQ2();
   reg clkk = 0 , dd;
   wire qq , qqbar;
   D_flipflop2 myD(.clk(clkk) , .d(dd) , .q(qq) , .qbar(qqbar));
   initial repeat(25) #100 clkk = ~clkk;
   initial repeat(15) #150 dd = $random;
endmodule
