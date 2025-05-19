`timescale 1ns/1ns

module tb_Qca5();
    reg CLK = 0;
    reg RST = 0;
    reg SERIN = 0;
    wire SEROUT;

    ca5Q UUT(.clock(CLK), .reset(RST), .serin(SERIN), .sout(SEROUT));
    initial repeat(150) #500 CLK = ~CLK;
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
