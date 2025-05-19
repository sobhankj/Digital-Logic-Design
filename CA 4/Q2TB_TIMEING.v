`timescale 1ns/1ns

module TBQ2_TIMING();
   reg clkk = 0 , dd = 0;
   wire qq , qqbar;
   D_flipflop2 my_D(.clk(clkk) , .d(dd) , .q(qq) , .qbar(qqbar));
   initial repeat(40) #100 clkk = ~clkk;
   initial begin
      #75;
      dd = 1;
      #75;
      dd = 1;
      #138;////////////////////// time setup 1->0 10 ok, 15 false , 13 false , 11 ok , 12 ok 
      dd = 0;
      #100;
      dd = 0;
      #100;
      #70;
      dd = 0;
      #135;
      dd = 1;
      #65;
      #100;
      dd = 0;
      #100;
      dd = 0;
      #140;
      dd = 1;
      #60;
      #100;
      dd = 0;
      #100;
      dd = 0;
      #137;/////////// time setup 0->1 , 0 false;
      dd = 1;
      #55;
      #100;
      dd = 0;
      #100;
      dd = 0;
      #150;
      dd = 1;
      #50;
      #100;
      dd = 0;
      #100;
      #155;
      dd = 1;
      #45;
      #100;
      dd = 1;
      #50;//////// time hold 1->0 0;
      dd = 0;
      #100;
      #100;
      dd = 1;/////// time hold 0->1 glitch
      #100;
      #75;
      dd = 0;
      #100;
      dd = 1;
      #90;
      dd = 0;
      #100;
   end
endmodule
 