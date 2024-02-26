module FDL (
    input [5:0] Q,
    input clk_in,
    output clk_out
);
    wire [5:0] dummy_wire;
    NAND2X8 FDE1 (.A(clk_in), .B(Q[0]), .Y(dummy_wire[0]));
    NAND2X8 FDE2 (.A(clk_in), .B(Q[1]), .Y(dummy_wire[1]));
    NAND2X8 FDE3 (.A(clk_in), .B(Q[2]), .Y(dummy_wire[2]));
    NAND2X8 FDE4 (.A(clk_in), .B(Q[3]), .Y(dummy_wire[3]));
    NAND2X8 FDE5 (.A(clk_in), .B(Q[4]), .Y(dummy_wire[4]));
    NAND2X8 FDE6 (.A(clk_in), .B(Q[5]), .Y(dummy_wire[5]));

    assign clk_out = clk_in;

endmodule
