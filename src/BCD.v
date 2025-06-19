module BCD (
    input [3:0] inp,  
    input clk2,
    output reg [3:0] bcd
  );

  reg  algo = 0;

  always@(posedge clk2) begin
    case(algo)
      0:begin
        bcd<=inp%10;
        algo <= 1;
        end
      1:begin
        bcd<=(inp-inp%10)/10;
        algo <= 0;
        end
    endcase
  end
endmodule
