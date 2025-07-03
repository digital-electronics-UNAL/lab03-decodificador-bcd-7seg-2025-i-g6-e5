`timescale 1ns/1ps //(unidad de tiempo)/(resolución)
`include "src/top.v"

module tb_top ();
    reg [4:0] inp;
    reg clk2;
    reg rst;
    wire [0:6] SSeg;
    wire [3:0] an;

    top uut(
      .inp(inp),
      .clk(clk2),
      .rst(rst),
      .SSeg(SSeg),
      .an(an)
    );

    initial begin 
        inp = 5'b11111;
        clk2 = 0;
        rst = 0;
        #10 rst = 0;  // libera el reset  

    end
    always #5 clk2 = ~clk2;
    
    initial begin
      $dumpfile("tb_top.vcd");
      $dumpvars(-1,uut);
      #800 $finish;
    end

endmodule