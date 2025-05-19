`timescale 1ns/1ns

module cosx(input clk , rst , init_cnt_lut , inc_cnt_lut , ld_xORx2 , sel_x , sel_x2 , sel_temp_inpM1 , sel_x_inpM1 , sel_lut_inpM2 , sel_x_inpM2 , init_temp_reg , ld_temp_reg , ld_y , init_res_reg , ld_res_reg , add_or_sub , input[15:0] x , input[7:0] y , output[15:0] out , output comp_res_y , co_cnt_lut);
    reg[2:0] addres_cnt;
    reg[15:0] out_xORx2_reg , out_temp_reg , out_res_reg;
    reg[7:0] out_y_reg;

    wire[15:0] out_mux1 , out_mux_M1 , out_mux_M2 , out_lut;
    wire[16:0] out_addORsub;
    wire[31:0] out_multiply;
    
    // lut
    reg [15:0] lut [7:0];
    assign lut[0] = 16'b0000000010000000;
    assign lut[1] = 16'b0000000000010101;
    assign lut[2] = 16'b0000000000001000;
    assign lut[3] = 16'b0000000000000100;
    assign lut[4] = 16'b0000000000000010;
    assign lut[5] = 16'b0000000000000001;
    assign lut[6] = 16'b0000000000000001;
    assign lut[7] = 16'b0000000000000001;
    assign out_lut = lut[addres_cnt];

    // counter for lut
    always@(posedge clk , posedge rst) begin
	if(rst)
	    addres_cnt <= 3'b0;
	else 
	    if(init_cnt_lut)
		addres_cnt <= 3'b0;
	    else
		if(inc_cnt_lut)
		    addres_cnt <= addres_cnt + 1;
    end
    assign co_cnt_lut = &{addres_cnt};


    // mux xORx2
    assign out_mux1 = sel_x ? x : 
		      sel_x2 ? out_multiply[23:8] : 16'b0;


    // x or x2 register
    always@(posedge clk , posedge rst) begin
	if(rst)
	    out_xORx2_reg <= 16'b0;
	else
	    if(ld_xORx2)
		out_xORx2_reg <= out_mux1;
    end


    // y register
    always@(posedge clk , posedge rst) begin
	if(rst)
	    out_y_reg <= 8'b0;
	else
	    if(ld_y)
		out_y_reg <= y;
    end


    // temp register
    always@(posedge clk , posedge rst) begin
	if(rst)
	    out_temp_reg <= 16'b0;
	else
	    if(init_temp_reg)
		out_temp_reg <= 16'b0000000100000000;
	    else
		if(ld_temp_reg)
		    out_temp_reg <= out_multiply[23:8];
    end


    // resault register
    always@(posedge clk , posedge rst) begin
	if(rst)
	    out_res_reg <= 16'b0;
	else
	    if(init_res_reg)
		out_res_reg <= 16'b0000000100000000;
	    else
		if(ld_res_reg)
		    out_res_reg <= out_addORsub[15:0];
    end


    // mux M1
    assign out_mux_M1 = sel_temp_inpM1 ? out_temp_reg :
			sel_x_inpM1 ? out_xORx2_reg : 16'b0;

    // mux M2
    assign out_mux_M2 = sel_lut_inpM2 ? out_lut :
			sel_x_inpM2 ? out_xORx2_reg : 16'b0;

    
    // multiply
    assign out_multiply = out_mux_M1 * out_mux_M2;


    // add or sub
    assign out_addORsub = add_or_sub ? (out_res_reg + out_temp_reg) :
				       (out_res_reg - out_temp_reg);


    // compretor
    assign comp_res_y = (out_addORsub >= {8'b0, out_y_reg}) ? 1'b1 : 1'b0;


    // resualt
    assign out = out_res_reg;




endmodule