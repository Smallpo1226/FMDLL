 module FD_N(rst_n, N , DIV_N , CLK_out, N_counter);
input [3:0]N;
input CLK_out;
input rst_n;
input N_counter;
output reg DIV_N;

 always@(posedge CLK_out or negedge rst_n) begin
   if (!rst_n)
     DIV_N <= 1;
   else if (N_counter == N)
     DIV_N <= 0;
   else if (N_counter == 1)
     DIV_N <= 1;
 end

 endmodule
