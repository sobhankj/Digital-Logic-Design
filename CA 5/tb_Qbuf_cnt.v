`timescale 1ns/1ns

module tb_bufcnt();
    reg clk = 0 , rst = 0 , ld = 1 , ci = 1 , en_cnt = 1 , en_tri = 1 , SI = 0;
    reg [7:0] PI = 8'b00001010;
    wire co , SO;

    buf_cnt uu2(.clk(clk) , .rst(rst) , .ld(ld) , .ci(ci) , .en_cnt(en_cnt) , .en_tri(en_tri) , .SI(SI) , .PI(PI) , .co(co) , .SO(SO));
    initial repeat(80) #500 clk = ~clk;
    initial begin
	#600 ld = 0 ;
             SI = 1;
	#1020 SI = 0;
	#1000 SI = 0;
	#500 SI = 1;
    end
endmodule
	
