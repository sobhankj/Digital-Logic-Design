`timescale 1ns/1ns
module tb_ca5();
    logic CLK = 0;
    logic RST = 0;
    logic SERIN = 0;
    wire SEROUT;
    wire A, B, C;

    Ca4Top UUT1(.clk(CLK), .rst(RST), .SerIn(SERIN), .SerOut(SEROUT), .a(A), .b(B), .c(C));
    initial repeat(1000) #500 CLK = ~CLK;
    initial begin
    #80 SERIN = 0;
    #1150 SERIN = 1;
    //from here sequence starts
    #1000 SERIN = 0;
    #1000 SERIN = 1;
    #1000 SERIN = 1;
    #1000 SERIN = 1;
    #1000 SERIN = 1;
    #1000 SERIN = 1;
    #1000 SERIN = 0;
    #1000 SERIN = 1;
    #1000 SERIN = 1;
    #1000 SERIN = 1;
    #1000 SERIN = 0;
    #1000 SERIN = 0;
    #1000 SERIN = 0;
    #1000 SERIN = 0;
    #1000 SERIN = 0;
    #1000 SERIN = 1;
    #1000 SERIN = 0;
    #1000 SERIN = 1;
    #1000 SERIN = 0;
    #1000 SERIN = 1;
    #1000 SERIN = 0;
    #1000 SERIN = 1;
    #1000 SERIN = 0;
    #1000 SERIN = 1;
    #1000 SERIN = 0;
    #1000 SERIN = 0;
    #1000 SERIN = 0;
    #1000 SERIN = 0;
    #1000 SERIN = 1;
    #1000 SERIN = 1;
    #1000 SERIN = 1;
    #1000 SERIN = 1;
    #1000 SERIN = 1;
    #1000 SERIN = 0;
    #1000 SERIN = 1;
    #1000 SERIN = 1;
    #1000 SERIN = 1;
    #1000 SERIN = 0;
    #1000 SERIN = 0;
    #1000 SERIN = 0;
    #1000 SERIN = 0;
    #1000 SERIN = 0;
    #1000 SERIN = 1;
    #1000 SERIN = 0;
    #1000 SERIN = 1;
    #1000 SERIN = 0;
    #1000 SERIN = 1;
    #1000 SERIN = 0;
    #1000 SERIN = 1;
    #1000 SERIN = 0;
    end
endmodule
