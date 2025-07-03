//`include "src/sum_res_4b.v"
//`include "src/top.v"

module top_sum_res(
    input [3:0] A,
    input [3:0] B,
    input Sel,
    input clk,
    input rst,
    output [0:6] SSeg,
    output [3:0] an
    );

    wire Cout;
    wire [3:0] S;
    wire [4:0] inp_top;

    assign inp_top = {Cout, S};

    sum_res_4b sr (
        .A(A),
        .B(B),
        .Sel(Sel),
        .Cout(Cout),
        .S(S)
    );

    top u_top (
        .inp(inp_top),
        .clk(clk),
        .rst(rst),
        .SSeg(SSeg),
        .an(an)
    );

endmodule