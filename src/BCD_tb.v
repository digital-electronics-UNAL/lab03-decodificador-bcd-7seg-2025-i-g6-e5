`timescale 1ns/1ps //(unidad de tiempo)/(resolución)
`include "src/BCD.v"

module BCD_tb();
    reg [3:0] inp; 
    wire [3:0] bcdw_tb;
    reg  clk2;
    
    BCD uut (
        .inp(inp), 
        .bcd(bcdw_tb),
        .clk2(clk2)        
    );
   

    initial begin 
        inp = 4'b1111;
        clk2 = 0;  
    end
    always #5 clk2 =~clk2;
    
    initial begin
      $dumpfile("BCD_tb.vcd");
      $dumpvars(-1,uut);
      #80 $finish;
    end

endmodule