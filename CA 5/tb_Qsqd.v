`timescale 1ns/1ns

module tb_sq();
    reg clkk = 0 , rstt = 0 , inpp = 0;
    wire ww;

    sqd my_sq(.clk(clkk) , .rst(rstt) , .inp(inpp) , .w(ww));
    initial repeat(40) #100 clkk = ~clkk;
    initial begin
	#90 inpp = 1;
	#200 inpp = 0;
	#200 inpp = 1;
	#200 inpp = 0;
	#200 inpp = 1;
	#200 inpp = 1;
	#200 inpp = 1;
	#200 inpp = 1;
	#200 inpp = 1;
	#200 inpp = 0;
	#200 inpp = 1;
	#200 inpp = 0;
	#200 inpp = 1;
    end
endmodule