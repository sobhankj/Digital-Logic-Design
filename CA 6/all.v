`timescale 1ns/1ns

module all(input clk, rst, input [15:0] x, input[7:0] y, output [15:0] out);
    wire co_cnt_lut , comp_res_y , addORsub , ld_xORx2 , init_temp_reg , ld_temp_reg , init_res_reg , ld_res_reg , ld_y , selx , selx2 , sel_temp_M1 , sel_x_M1 , sel_table_M2 , sel_x_M2 , init_cnt_lut , inc_cnt_lut;
    
    cosx data(.clk(clk) , .rst(rst) , .init_cnt_lut(init_cnt_lut) , .inc_cnt_lut(inc_cnt_lut) , .ld_xORx2(ld_xORx2) , .sel_x(selx) ,
             .sel_x2(selx2) , .sel_temp_inpM1(sel_temp_M1) , .sel_x_inpM1(sel_x_M1) , .sel_lut_inpM2(sel_table_M2) , .sel_x_inpM2(sel_x_M2) ,
             .init_temp_reg(init_temp_reg) , .ld_temp_reg(ld_temp_reg) , .ld_y(ld_y) , .init_res_reg(init_res_reg) , .ld_res_reg(ld_res_reg) ,
             .add_or_sub(addORsub) , .x(x) , .y(y) , .out(out) , .comp_res_y(comp_res_y) , .co_cnt_lut(co_cnt_lut));

    controller control(.clk(clk) , .rst(rst) , .comp_res_y(comp_res_y) , .co_cnt_lut(co_cnt_lut) , .init_cnt_lut(init_cnt_lut), .inc_cnt_lut(inc_cnt_lut) , .ld_xORx2(ld_xORx2) , .sel_x(selx) ,
                       .sel_x2(selx2) , .sel_temp_inpM1(sel_temp_M1) , .sel_x_inpM1(sel_x_M1) , .sel_lut_inpM2(sel_table_M2) , .sel_x_inpM2(sel_x_M2) ,
                       .init_temp_reg(init_temp_reg) , .ld_temp_reg(ld_temp_reg) , .ld_y(ld_y) , .init_res_reg(init_res_reg) , .ld_res_reg(ld_res_reg) ,.add_or_sub(addORsub)); 
endmodule
