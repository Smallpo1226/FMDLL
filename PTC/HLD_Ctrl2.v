module HLD_Ctrl2 (
    input clk2,
    input clk4,
    input M,
    input DIV_M,
    input rst_n,
    output reg Ctrl_HLD2
);
    wire clk2b;
    wire clk2b_div2;

    assign clk2b = ~clk2;
    FD_2 F0 (.clk(clk2b), .rst_n(rst_n), .DIV_2(clk2b_div2));
    //456
    // 123
    always @(*) begin
        if (M == 1) begin
            Ctrl_HLD2 = ~((~clk2b_div2) | clk2b);
        end else begin
            Ctrl_HLD2 = ~((~(~((~clk4) | clk2))) | DIV_M);
        end
    end
endmodule