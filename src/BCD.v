module BCD (
    input [4:0] inp,  
    input clk2,
    input rst,
    input Sel,
    output reg [3:0] bcd,
    output reg [3:0] c
  );

  //reg  algo = 0; esto se cambia por el rst
  reg [1:0]algo;
    
  initial begin
		algo = 2'b00;
		c = 'b0;
  end
  

  always@(posedge clk2) begin
      case(algo)
        0:begin
          bcd<=inp%10;
          algo <= 1;
			 c <= 4'b1110;
          end
        1:begin
          bcd<=(inp-inp%10)/10;
          if (Sel ==1 && inp[4]==0) begin
            algo <= 2'b10;
          end else begin
            algo <= 0;
          end
			 c <= 4'b1101;
          end
        2: begin
          bcd <= 4'b1100;
          algo <= 0;
          c <= 4'b1011;
        end
      endcase
  end
endmodule
