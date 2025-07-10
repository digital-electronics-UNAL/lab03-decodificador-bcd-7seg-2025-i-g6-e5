//`include "src/BCD.v"
//`include "src/CF_Div.v"
//`include "src/BCDtoSSeg.v"

module top (
    input [4:0] inp,  
    input clk,
    input rst,
    input Sel,
    output [0:6] SSeg, 
    output [3:0] an

);
    wire [3:0]bcdsseg;
    wire [3:0]c;
    wire fdividier;

    BCD BCD(
    .bcd(bcdsseg),
    .inp(inp),
    .rst(rst),
    .c(c),
    .Sel(Sel),
    .clk2(fdivider)
    );

    CF_Div fdiv(
    .clk(clk),
    .fdiv(fdivider)
    );

    BCDtoSSeg BCDtoSSeg(
    .SSeg(SSeg),
    .c(c),
    .BCD(bcdsseg),
    .an(an)
    );

endmodule