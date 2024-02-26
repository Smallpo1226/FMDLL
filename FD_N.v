 module FD_N(rst_n, N , DIV_N , clk_out, N_counter);
input [3:0] N;
input clk_out;
input rst_n;
input [3:0] N_counter;
output reg DIV_N;

 always@(posedge clk_out or negedge rst_n) begin
   if (!rst_n)
     DIV_N <= 1;
   else if (N_counter == N)
     DIV_N <= 0;
   else if (N_counter == 1)
     DIV_N <= 1;
 end

 endmodule
