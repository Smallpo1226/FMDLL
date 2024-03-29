 module FD_M(rst_n, M , DIV_M , clk_ext, M_counter);
input [1:0] M;
input clk_ext;
input rst_n;
input [1:0] M_counter;
output reg DIV_M;
reg DIV_M_tmp;
 always@(posedge clk_ext /*or negedge rst_n*/)begin
      /*if (!rst_n) begin
          DIV_M <= 0;
      end else */begin
          DIV_M <= DIV_M_tmp;
      end 
 end
 always @* begin
    if (M_counter == M || M_counter == 2'd0)
      DIV_M_tmp = 1;
    else if (M_counter == M-1)
      DIV_M_tmp = 0;
    else
      DIV_M_tmp = 1;
 end

 endmodule

