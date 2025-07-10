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
  
 wire [4:0] new_in = (Sel ==1)? ((inp[4]==0)? {1'b0, ~inp[3:0]+4'b0001} : {1'b0, inp[3:0]}) : inp;
  

  always@(posedge clk2) begin
      case(algo)
        0:begin
			 	 bcd<=(new_in)%10;
				 algo <= 1;
				 c <= 4'b1110;
          end
        1:begin
            bcd<=(new_in-new_in%10)/10;
				algo <= (Sel ==1 & inp[4]==0)? 2 :0;
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
