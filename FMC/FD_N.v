 module FD_N(rst_n, N , DIV_N , CLK_out );
input [2:0]N;
input CLK_out;
input rst_n;
output DIV_N;

reg [3:0] cnt_p;
reg [3:0] cnt_n;
reg       clk_p;
reg       clk_n;

 assign DIV_N = (N == 1) ? CLK_out :
                (N[0])   ? (clk_p | clk_n) : (clk_p);

 always@(posedge CLK_out or negedge rst_n) begin
   if (!rst_n)
     cnt_p <= 0;
   else if (cnt_p == (N-1))
     cnt_p <= 0;
   else
     cnt_p <= cnt_p + 1;
 end

 always@(posedge CLK_out or negedge rst_n) begin
   if (!rst_n)
     clk_p <= 1;
   else if (cnt_p < (N>>1))
     clk_p = 1;
   else
     clk_p = 0;
 end

 always@(negedge CLK_out or negedge rst_n) begin
   if (!rst_n)
     cnt_n <= 0;
   else if (cnt_n == (N-1))
     cnt_n <= 0;
   else
     cnt_n <= cnt_n + 1;
 end

 always@(negedge CLK_out or negedge rst_n) begin
   if (!rst_n)
     clk_n <= 1;
   else if (cnt_n < (N>>1))
     clk_n = 1;
   else
     clk_n = 0;
 end

 endmodule
