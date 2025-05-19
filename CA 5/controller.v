`timescale 1ns/1ns

module controller(input clk , rst , w_seq , co_cnt1 , co_cnt2 , output reg init_sh , en_sh , ld_cnt1 , en_cnt1 , ld_cnt2 , en_cnt2 , en_buff);
    reg[1:0] pstate , nstate;
    reg serOutValid;
    parameter[0:1] seq = 0 , nt = 1 , tr = 2;
    always @(pstate , w_seq , co_cnt1 , co_cnt2) begin
	nstate = 0;
	{init_sh , en_sh , ld_cnt1 , en_cnt1 , ld_cnt2 , en_cnt2 , en_buff} = 7'b0;
	case(pstate)
	    seq: begin nstate = w_seq ? nt : seq; {init_sh , ld_cnt1} = 2'b11; serOutValid = 1'b0; end
	    nt: begin nstate = co_cnt1 ? tr : nt; {ld_cnt1 , init_sh} = 2'b0; {en_sh , en_cnt1 , ld_cnt2} = 3'b111; end
	    tr: begin nstate = co_cnt2 ? seq : tr; {en_cnt2 , en_buff} = 2'b11; ld_cnt2 = 1'b0; serOutValid = 1'b1; end
	    default : nstate = seq;
	endcase
    end

    always @(posedge clk , posedge rst) begin
	if(rst) pstate <= seq;
	else
	    pstate <= nstate;
    end
endmodule