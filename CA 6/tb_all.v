`timescale 1ns/1ns

module Ca6TB();
    reg CLK = 0;
    reg RST = 0;
    reg[15:0] XIN = 16'b0000000100001100;
    reg[7:0] YIN = 8'b0000001;
    wire [15:0] COSX;
    all UUT1(.clk(CLK), .rst(RST), .x(XIN), .y(YIN), .out(COSX));
    initial repeat(100) #1000 CLK = ~CLK;
endmodule//0000000110010010
