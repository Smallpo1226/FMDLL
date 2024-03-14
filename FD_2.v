module FD_2( clk, rst_n, DIV_2 );
    reg [1:0]cnt_tmp_2;
    reg clk_tmp_2;
    reg [1:0]cnt_2;
	input rst_n;
    input clk;
	output reg DIV_2;
always@*
    if( cnt_2 == 2'd1)
        begin
            cnt_tmp_2 = 2'b0;
            clk_tmp_2 = ~DIV_2;
        end
    else
        begin
            cnt_tmp_2 = cnt_2 + 1;
            clk_tmp_2 = DIV_2;
        end
always@(posedge clk or negedge rst_n)
    if(~rst_n)
        begin
            cnt_2 <= 2'b0;
            DIV_2 <= 1'b1;
        end
    else
        begin
            cnt_2 <= cnt_tmp_2;
            DIV_2 <= clk_tmp_2;
        end

endmodule