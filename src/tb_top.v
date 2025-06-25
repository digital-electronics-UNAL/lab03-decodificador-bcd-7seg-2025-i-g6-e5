`timescale 1ns/1ps //(unidad de tiempo)/(resolución)
`include "src/top.v"

module tb_top ();
    reg [3:0] inp;
    reg clk2;
    reg rst;
    wire [0:6] SSeg;
    wire [3:0] an;

    top uut(
    .inp(inp),
    .clk2(clk2),
    .rst(rst),
    .SSeg(SSeg),
    .an(an)
    );

    initial begin 
        inp = 4'b1111;
        clk2 = 0;
        rst = 1;
        #3 rst = 0;  // libera el reset  
    end
    always #5 clk2 = ~clk2;
    
    initial begin
      $dumpfile("tb_top.vcd");
      $dumpvars(-1,uut);
      #80 $finish;
    end

endmodule