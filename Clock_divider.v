module Clock_divider( rst_n , M , DIV_M , CLK_exit  , clk2 , clk4 );
    reg [6:0]cnt_tmp_2,cnt_tmp_4;
    reg clk_tmp_2,clk_tmp_4;
    reg [1:0]cnt_2,cnt_4;
    wire clk_in;
	input [1:0]M;
	input rst_n;
    input DIV_M,CLK_exit;
	output reg clk2,clk4;
    assign clk_in = (M>2'd1) ? DIV_M : CLK_exit;
always@*
    if( cnt_2 == 2'd1)
        begin
            cnt_tmp_2 = 7'b1;
            clk_tmp_2 = ~clk2;
        end
    else
        begin
            cnt_tmp_2 = cnt_2 + 1;
            clk_tmp_2 = clk2;
        end
always@*
    if( cnt_4 == 2'd2)
        begin
            cnt_tmp_4 = 7'b1;
            clk_tmp_4 = ~clk4;
        end
    else
        begin
            cnt_tmp_4 = cnt_4 + 1;
            clk_tmp_4 = clk4;
        end
always@(posedge clk_in or negedge rst_n)
    if(~rst_n)
        begin
            cnt_2 <= 7'b0;
            clk2 <= 1'b0;
            cnt_4 <= 7'b0;
            clk4 <= 1'b0;
        end
    else
        begin
            cnt_2 <= cnt_tmp_2;
            clk2 <= clk_tmp_2;
            cnt_4 <= cnt_tmp_4;
            clk4 <= clk_tmp_4;
        end

endmodule