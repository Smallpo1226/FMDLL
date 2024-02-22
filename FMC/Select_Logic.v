module Select_Logic (
    input DIV_N,
    input clk_out,
    input clk_ext,
    input DIV_M,
    input rst_n,
    input [2:0] N, 
    input [1:0] M, 
    output reg [1:0] Sel
);
    reg [2:0] count_N;
    reg [1:0] count_M;

    always @(negedge rst_n or posedge clk_out or posedge clk_ext) begin
        if (~rst_n) begin
            Sel = 2'b00;
        end else if (count_N == N) begin
            if ((DIV_M == 1) && (count_M != M)) begin
                Sel[1] = 1;
            end else begin
                Sel[1] = 0;
            end
        end else if (count_M == M) begin
            Sel[0] = 1;
            Sel[1] = 0;
        end
    end

    always @(negedge rst_n or posedge clk_out) begin
        if (~rst_n) begin
            count_N = 3'b0;
        end else if (count_N == N) begin
            count_N = 3'b0;
        end else begin
            count_N = count_N + 1;
        end
    end

    always @(negedge rst_n or posedge clk_ext) begin
        if (~rst_n) begin
            count_M = 2'b0;
        end else if (count_M == M) begin
            count_M = 2'b0;
        end else begin
            count_M = count_M + 1;
        end
    end
endmodule