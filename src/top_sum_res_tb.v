`timescale 1ns/1ps
`include "src/top_sum_res.v"
`include "src/sum_res_4b.v"
`include "src/top.v"
`include "src/BCD.v"
`include "src/CF_Div.v"
`include "src/BCDtoSSeg.v"
`include "src/sum4b_estruc.v"
`include "src/sum1b_estruc.v"

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

        A = 4'd2;
        B = 4'd3;
        Sel = 1;
        #500;

    end

    initial begin
        $dumpfile("top_sum_res_tb.vcd");
        $dumpvars(0, top_sum_res_tb);
        #10000 $finish;
    end

endmodule