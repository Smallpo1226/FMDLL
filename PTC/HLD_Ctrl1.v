module HLD_Ctrl1 (
    input clk2,
    input clk4,
    input M,
    input DIV_M,
    output reg Ctrl_HLD1
);
    always @(*) begin
        if (M == 1) begin
            Ctrl_HLD1 = ~(clk2 | (~clk4));
        end else begin
            Ctrl_HLD1 = ~((~(clk2 & clk4)) | DIV_M);
        end
    end
endmodule