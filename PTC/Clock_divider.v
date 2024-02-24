module Clock_divider( rst_n , M , DIV_m , CLK_exit  , CLK_2 , CLK_4 );
    reg [6:0]cnt_tmp_2,cnt_tmp_4;
    reg clk_tmp_2,clk_tmp_4;
    reg [1:0]cnt_2,cnt_4;
    wire clk_in;
    reg clk_out_2,clk_out_4;
	input [1:0]M;
	input rst_n;
    input DIV_m,CLK_exit;
	output reg CLK_2,CLK_4;
always@*
    if( cnt_2 == 2'd1)
        begin
            cnt_tmp_2 = 7'b1;
            clk_tmp_2 = ~clk_out_2;
        end
    else
        begin
            cnt_tmp_2 = cnt_2 + 1;
            clk_tmp_2 = clk_out_2;
        end
always@*
    if( cnt_4 == 2'd2)
        begin
            cnt_tmp_4 = 7'b1;
            clk_tmp_4 = ~clk_out_4;
        end
    else
        begin
            cnt_tmp_4 = cnt_4 + 1;
            clk_tmp_4 = clk_out_4;
        end
always@(posedge clk_in or negedge rst_n)
    if(~rst_n)
        begin
            cnt_2 <= 7'b0;
            clk_out_2 <= 1'b0;
            cnt_4 <= 7'b0;
            clk_out_4 <= 1'b0;
        end
    else
        begin
            cnt_2 <= cnt_tmp_2;
            clk_out_2 <= clk_tmp_2;
            cnt_4 <= cnt_tmp_4;
            clk_out_4 <= clk_tmp_4;
        end

endmodule