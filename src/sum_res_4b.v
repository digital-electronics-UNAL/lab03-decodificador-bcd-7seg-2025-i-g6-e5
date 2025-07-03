`include "src/sum4b_estruc.v"

module sum_res_4b(

    input [3:0] A,
    input [3:0] B,
    input Sel, 
    output Cout,
    output [3:0] S

    );

    wire [3:0] B_c;
    assign B_c = B^{4{Sel}};
    wire c0, c1, c2;

    sum4b_estruc UUT (
        .A(A),
        .B(B_c),
        .Ci(Sel),
        .S(S),
        .Cout(Cout)
    );

endmodule
