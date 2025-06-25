
`include "src/BCD.v"
`include "src/BCDtoSSeg.v"

module top (
    input [3:0] inp,  
    input clk2,
    input rst,
    output [0:6] SSeg, 
    output [3:0] an

);
    wire [3:0]bcdsseg;
    wire [3:0]c;

    BCD BCD(
    .bcd(bcdsseg),
    .inp(inp),
    .rst(rst),
    .c(c),
    .clk2(clk2)
    );

    BCDtoSSeg BCDtoSSeg(
    .SSeg(SSeg),
    .c(c),
    .BCD(bcdsseg),
    .an(an)
    );

endmodule