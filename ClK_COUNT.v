module ClK_COUNT (clk_ext,clk_out,N_counter,M_counter,M,N,rst_n,Sel);
input clk_ext,clk_out;
input [3:0] N;
input [1:0] M;
input Sel;
input rst_n;
output reg [3:0] N_counter;
output reg [1:0] M_counter;
reg [3:0] cnt_tmp_N;
reg [1:0] cnt_tmp_M;
reg clk_out_one,clk_ext_one;
reg count_false;
always@*
    if( M_counter == M)
        begin
            cnt_tmp_M = 2'd1;
        end
    else
        begin
            cnt_tmp_M = M_counter + 2'd1;
        end
always@(posedge clk_ext or negedge rst_n) begin
    if(~rst_n)
        begin
            if(clk_ext_one)
            M_counter <= 2'd1;
            else
            M_counter <= 2'd0;
        end
    else
        begin
            M_counter <= cnt_tmp_M;
        end
end
always@*
    if( N_counter == N )
        begin
            
            cnt_tmp_N = 4'd1;
        end
    else
        begin
            if(count_false)
            cnt_tmp_N = N_counter;
            else
            cnt_tmp_N = N_counter + 4'd1;
        end
always@(posedge clk_out or negedge rst_n) begin
    if(~rst_n)
        begin
            if(clk_out_one) begin
            N_counter <= 4'd1;
            end
            else begin
            N_counter <= 4'd0;
            end
        end
    else 
    begin
            N_counter <= cnt_tmp_N;
    end
end

always @* begin

    clk_out_one = clk_out;
    clk_ext_one = clk_ext;

end

always@(negedge clk_out)begin
    if(~rst_n)
    count_false <= 0;
    else
    if(Sel == 1)
    count_false <= 1;
    else 
    count_false <= 0;
end

endmodule