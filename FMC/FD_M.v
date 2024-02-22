 module FD_M(rst_n, M , DIV_M , CLK_exit );
input [1:0]M;
input CLK_exit;
input rst_n;
output DIV_M;

reg [3:0] cnt_p;
reg [3:0] cnt_n;
reg       clk_p;
reg       clk_n;

 assign DIV_M = (M == 1) ? CLK_exit :
                (M[0])   ? (clk_p | clk_n) : (clk_p);

 always@(posedge CLK_exit or negedge rst_n) begin
   if (!rst_n)
     cnt_p <= 0;
   else if (cnt_p == (M-1))
     cnt_p <= 0;
   else
     cnt_p <= cnt_p + 1;
 end

 always@(posedge CLK_exit or negedge rst_n) begin
   if (!rst_n)
     clk_p <= 1;
   else if (cnt_p < (M>>1))
     clk_p = 1;
   else
     clk_p = 0;
 end

 always@(negedge CLK_exit or negedge rst_n) begin
   if (!rst_n)
     cnt_n <= 0;
   else if (cnt_n == (M-1))
     cnt_n <= 0;
   else
     cnt_n <= cnt_n + 1;
 end

 always@(negedge CLK_exit or negedge rst_n) begin
   if (!rst_n)
     clk_n <= 1;
   else if (cnt_n < (M>>1))
     clk_n = 1;
   else
     clk_n = 0;
 end

 endmodule
