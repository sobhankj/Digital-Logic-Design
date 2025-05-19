`timescale 1ns/1ns

module TBQ3();
   reg clkk = 0 , dd = 0 , pree = 1 , clrr = 1;
   wire qq , qqbar;
   D_flipflop_reset_preset my_D(.pre(pree) , .clr(clrr) , .clk(clkk) , .d(dd) , .q(qq) , .qbar(qqbar));
   initial repeat (25) #100 clkk = ~clkk;
   initial repeat (20) #124 dd = ~dd;
   initial begin
      #250;
      clrr = 0;
      #250;
      clrr = 1;
      #100;
      pree = 0;
      #300;
      pree = 1;
      #500;
      pree = 0;
      clrr = 0;
      #500;
      pree = 1;
      clrr = 1;
   end
endmodule