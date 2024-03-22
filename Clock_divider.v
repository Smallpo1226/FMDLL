module Clock_divider( rst_n , M , DIV_M , clk_ext  , clk2 , clk4 );
    reg [1:0]cnt_tmp_2,cnt_tmp_4;
    reg clk_tmp_2,clk_tmp_4;
    reg [1:0]cnt_2,cnt_4;
    reg clk2_tmp,clk4_tmp;
    wire clk_in;
	input [1:0]M;
	input rst_n;
    input DIV_M,clk_ext;
	output reg clk2,clk4;
    assign clk_in = (M != 2'd1) ? DIV_M : clk_ext;
always@*
    if( cnt_2 == 2'd1)
        begin
            cnt_tmp_2 = 2'b1;
            clk_tmp_2 = ~clk2_tmp;
        end
    else
        begin
            cnt_tmp_2 = cnt_2 + 1;
            clk_tmp_2 = clk2_tmp;
        end
always@*
    if( cnt_4 == 2'd2)
        begin
            cnt_tmp_4 = 2'b1;
            clk_tmp_4 = ~clk4_tmp;
        end
    else
        begin
            cnt_tmp_4 = cnt_4 + 1;
            clk_tmp_4 = clk4_tmp;
        end
always@(posedge clk_in or negedge rst_n)
    if(~rst_n)
        begin
            cnt_2 <= 2'b0;
            clk2_tmp <= 1'b1;
            cnt_4 <= 2'b1;
            clk4_tmp <= 1'b0;
        end
    else
        begin
            cnt_2 <= cnt_tmp_2;
            clk2_tmp <= clk_tmp_2;
            cnt_4 <= cnt_tmp_4;
            clk4_tmp <= clk_tmp_4;
        end

always@(negedge clk_in or negedge rst_n)
    if(~rst_n)
        begin
        clk2 <= 1'b0;
        clk4 <= 1'b0;
        end
    else
        begin
            clk2 <= clk2_tmp;
            clk4 <= clk4_tmp;
        end

endmodule