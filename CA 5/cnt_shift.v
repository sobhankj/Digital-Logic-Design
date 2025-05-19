`timescale 1ns/1ns

module cnt_shift(input clk , rst_sh , en_sh , init_sh , si , rst_cnt , en_cnt , ld , output co , output reg [7:0] PO_sh);
    reg [2:0] PO_cnt;
// shifter  
    always @(posedge clk , posedge rst_sh) begin
	if (rst_sh)
	    PO_sh <= 8'b0;
	else if (init_sh)
	    PO_sh <= 8'b0;
	else if (en_sh)
	    PO_sh <= {si , PO_sh[7:1]};
    end

// counter
    always @(posedge clk , posedge rst_cnt) begin
	if (rst_cnt)
	    PO_cnt <= 3'b0;
	    else begin
		if (ld)
		    PO_cnt <= 3'b000;
			else if (en_cnt)
                           PO_cnt <= PO_cnt + 1;
	    end
    end
    
    assign co = (en_cnt) ? &{PO_cnt} : 1'b0;

endmodule
    
