`timescale 1ns/1ns

module tb_Qcnt_shift();
    reg clk = 0 , rst_sh = 0 , en_sh = 1 , si = 0 , rst_cnt = 0 , en_cnt = 1 , ld = 1 , init_sh = 1;
    wire co ;
    wire [7:0] PO_sh;
    
    cntshiftQ UUT(.clk(clk) , .rst_sh(rst_sh) , .en_sh(en_sh) , .init_sh(init_sh) , .si(si) , .rst_cnt(rst_cnt) , .en_cnt(en_cnt) , .ld(ld) , .co(co) , .PO_sh(PO_sh));
    initial repeat(40) #500 clk = ~clk;
    initial begin
	#600 ld = 0;
	     init_sh = 0;
	#520 si = 1;
	#500 si = 0;
	#700 si = 1;
	#500 si = 0;
	#700 si = 1;
	#700 si = 0;
    end
endmodule
    
