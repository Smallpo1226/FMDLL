module ClK_COUNT (CLK_exit,CLK_out,N_counter,M_counter,M,N,rst_n);
input CLK_exit,CLK_out;
input [2:0] N;
input [1:0] M;
input rst_n;
output reg [2:0] N_counter;
output reg [1:0] M_counter;
reg [2:0] cnt_tmp_N;
reg [1:0] cnt_tmp_M;
always@*
    if( M_counter == M)
        begin
            cnt_tmp_M = 2'd1;
        end
    else
        begin
            cnt_tmp_M = M_counter + 2'd1;
        end
always@(posedge CLK_exit or negedge rst_n)
    if(~rst_n)
        begin
            cnt_tmp_M <= 2'd0;
        end
    else
        begin
            M_counter <= cnt_tmp_M;
        end

always@*
    if( N_counter == N)
        begin
            cnt_tmp_N = 3'd1;
        end
    else
        begin
            cnt_tmp_N = N_counter + 3'd1;
        end
always@(posedge CLK_out or negedge rst_n)
    if(~rst_n)
        begin
            cnt_tmp_N <= 3'd0;
        end
    else
        begin
            N_counter <= cnt_tmp_N;
        end

endmodule