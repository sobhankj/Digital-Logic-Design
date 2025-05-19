`timescale 1ns/1ns

module bufcntQ(input clk , rst , ld , en_cnt , en_tri , SI , input [7:0] PI , output co , output reg SO);
    reg [7:0] PO;
    wire [7:0] TP;
	 assign TP = ~PI;
    always @(posedge clk , posedge rst) begin
	if (rst)
	    PO <= 8'b0;
	    else begin
		if (ld)
		    PO <= TP;
			else if (en_cnt)
			    PO <= PO + 1;
	    end
    end

    assign co = (en_cnt) ? &{PO} : 1'b0;

    always @(posedge clk) begin
	if (en_tri)
	    SO <= SI;
   else
		 SO <= 1'bz;
    end

endmodule
