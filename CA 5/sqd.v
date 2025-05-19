`timescale 1ns/1ns

module sqd(input clk , rst , inp , output w);
    reg [2:0] ns , ps;

    always@(ps , inp) begin
        ns = 3'b000;
	case(ps)
	    3'b000: ns = inp ? 3'b000 : 3'b001;
	    3'b001: ns = inp ? 3'b010 : 3'b001;
	    3'b010: ns = inp ? 3'b011 : 3'b001;
	    3'b011: ns = inp ? 3'b100 : 3'b001;
	    3'b100: ns = inp ? 3'b101 : 3'b001;
	    3'b101: ns = inp ? 3'b110 : 3'b001;
	    3'b110: ns = inp ? 3'b000 : 3'b111;
	    3'b111: ns = inp ? 3'b010 : 3'b001;
	endcase
    end

    assign w = (ps == 3'b111) ? 1'b1 : 1'b0;

    always@(posedge clk , posedge rst) begin
	if(rst)
	    ps <= 3'b000;
	else
	    ps <= ns;
    end

endmodule