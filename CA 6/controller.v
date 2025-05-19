`timescale 1ns/1ns

module controller(input clk , rst , comp_res_y , co_cnt_lut , output reg init_cnt_lut , inc_cnt_lut , ld_xORx2 , sel_x , sel_x2 , sel_temp_inpM1 , sel_x_inpM1 , sel_lut_inpM2 , sel_x_inpM2 , init_temp_reg , ld_temp_reg , ld_y , init_res_reg , ld_res_reg , add_or_sub);
    reg [2:0] pstate = 0 , nstate;
    parameter[0:2]
    Init = 0 , Wait = 1 , Calculate_x2 = 2 , Multiply1 = 3 , Multiply2 = 4 , AddORsub = 5;
    
    reg count_en_toggle = 0;
    reg count_out = 1'b0;
    reg ready = 1'b0;
    always @(pstate , co_cnt_lut , comp_res_y) begin
	nstate = 0;
	{init_cnt_lut , inc_cnt_lut , ld_xORx2 , sel_x , sel_x2 , sel_temp_inpM1 , sel_x_inpM1 , sel_lut_inpM2 , sel_x_inpM2 , init_temp_reg , ld_temp_reg , ld_y , init_res_reg , ld_res_reg} = 14'b0;
	case(pstate)
	    Init: begin nstate = Wait; {init_cnt_lut , init_temp_reg , init_res_reg , sel_x , ld_xORx2 , ld_y} = 6'b111111; end
	    Wait: nstate = Calculate_x2;
	    Calculate_x2: begin nstate = Multiply1; {sel_x_inpM1 , sel_x_inpM2 , sel_x2 , ld_xORx2} = 4'b1111; end
	    Multiply1: begin nstate = Multiply2; {sel_x_inpM2 , sel_temp_inpM1 , ld_temp_reg} = 3'b111; end
	    Multiply2: begin nstate = comp_res_y ? AddORsub : Init; {sel_lut_inpM2 , sel_temp_inpM1 , ld_temp_reg , count_en_toggle} = 4'b1111; end
	    AddORsub: begin nstate = (co_cnt_lut | ~comp_res_y) ? Init : Multiply1; {ld_res_reg , inc_cnt_lut} = 2'b11; ready = (co_cnt_lut | ~comp_res_y) ? 1'b1 : 1'b0; end
	endcase
    end

    always @(posedge clk , posedge rst) begin
	if(rst) pstate <= Init;
	else
	    pstate <= nstate;
    end



    assign add_or_sub = (count_out) ? 1'b0 : 1'b1;
    always @(posedge clk , posedge rst) begin
	if(count_en_toggle)
	    count_out <= count_out + 1;
    end
endmodule
    