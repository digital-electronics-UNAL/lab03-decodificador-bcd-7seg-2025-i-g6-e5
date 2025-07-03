`include "src/sum1b_estruc.v"

module sum4b_estruc(

    input [3:0] A,s
    input [3:0] B,
    input Ci, 
    output Cout,
    output [3:0] S

    );

    wire c0; wire c1; wire c2;

    sum1b_estruc S0 (.A(A[0]),
                     .B(B[0]),
                     .Ci(Ci),
                     .Cout(c0),
                     .S(S[0]));

    sum1b_estruc S1 (.A(A[1]),
                     .B(B[1]),
                     .Ci(c0),
                     .Cout(c1),
                     .S(S[1]));
    
    sum1b_estruc S2 (.A(A[2]),
                     .B(B[2]),
                     .Ci(c1),
                     .Cout(c2),
                     .S(S[2]));
    
    sum1b_estruc S3 (.A(A[3]),
                     .B(B[3]),
                     .Ci(c2),
                     .Cout(Cout),
                     .S(S[3]));
endmodule