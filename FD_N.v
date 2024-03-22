 module FD_N(rst_n, N , DIV_N , clk_out, N_counter);
input [3:0] N;
input clk_out;
input rst_n;
input [3:0] N_counter;
output reg DIV_N;
reg DIV_N_tmp;

 always@(posedge clk_out or negedge rst_n)begin
      if (!rst_n) begin
          DIV_N <= 0;
      end else begin
          DIV_N <= DIV_N_tmp;
      end 
 end

 always @* begin
    if (N_counter == N || N_counter == 3'd0)
      DIV_N_tmp = 1;
    else if (N_counter == N-1)
      DIV_N_tmp = 0;
    else
      DIV_N_tmp = 1;
  end 

endmodule