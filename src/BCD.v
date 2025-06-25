module BCD (
    input [3:0] inp,  
    input clk2,
    input rst,
    output reg [3:0] bcd,
    output reg [3:0] c
  );

  //reg  algo = 0; esto se cambia por el rst
  reg algo;

  always @* begin
      if (algo == 0)
        c = 4'b0001;
      else 
        c = 4'b0010;
  end
  always@(posedge clk2 or posedge rst) begin
    if (rst) begin
      algo <= 0;
      bcd <= 0;
    end else begin
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
  end
endmodule
