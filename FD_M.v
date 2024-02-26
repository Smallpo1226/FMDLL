 module FD_M(rst_n, M , DIV_M , clk_ext, M_counter);
input [1:0] M;
input clk_ext;
input rst_n;
input [1:0] M_counter;
output reg DIV_M;

 always@(posedge clk_ext or negedge rst_n) begin
   if (!rst_n)
     DIV_M <= 1;
   else if (M_counter == M)
     DIV_M <= 0;
   else if (M_counter == 1)
     DIV_M <= 1;
 end

 endmodule

