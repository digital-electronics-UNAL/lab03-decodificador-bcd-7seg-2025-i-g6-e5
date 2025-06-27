module CF_Div(

    input clk,
    output reg fdiv
);

// 8000000 para quartus aprox, en testbench toca poner como 10

reg [$clog2(8000000):0] counter;

    initial begin
        fdiv = 1'b0;
		  counter = 'b0;
    end

always@(posedge clk) begin
    if (counter == 8000000) begin
        counter <= 0;
        fdiv <= ~fdiv;
    end else begin
        counter <= counter +1;
    end
end


endmodule