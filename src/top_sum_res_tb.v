`timescale 1ns/1ps
`include "src/top_sum_res.v"

module top_sum_res_tb();
    reg [3:0] A;
    reg [3:0] B;
    reg Sel;
    reg clk;
    reg rst;
    
    wire [0:6] SSeg;
    wire [3:0] an;

    top_sum_res TSR (
        .A(A),
        .B(B),
        .Sel(Sel),
        .clk(clk),
        .rst(rst),
        .SSeg(SSeg),
        .an(an)
    );

    always begin
        clk = ~clk;
        #5;
    end

    initial begin

        A = 0;
        B = 0;
        Sel = 0;
        clk = 0;
        rst = 1;
        #100;

        rst = 0;

        A = 4'd3;
        B = 4'd2;
        Sel = 0;
        #200;

        Sel = 1;
        #200;

        A = 4'd2;
        B = 4'd3;
        Sel = 1;
        #200;

        A = 4'd8;
        B = 4'd8;
        Sel = 0;
        #200;
    end

    initial begin
        $dumpfile("top_sum_res_tb.vcd");
        $dumpvars(0, top_sum_res_tb);
        #1000 $finish;
    end

endmodule