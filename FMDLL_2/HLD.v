`include "HLD_Ctrl1.v"
`include "HLD_Ctrl2.v"
module HLD (
    input clk2,
    input clk4,
    input DIV_M,
    input M,
    input Sel,
    input CLK_exit,
    output reg Reset_PD
);
    reg Ctrl_HLD1;
    reg Ctrl_HLD2;
    reg HLD1;
    reg HLD2;
    HLD_Ctrl1 Controller1 (.clk2(clk2), .clk4(clk4), .M(M), .DIV_M(DIV_M), .Ctrl_HLD1(Ctrl_HLD1));
    HLD_Ctrl2 Controller2 (.clk2(clk2), .clk4(clk4), .M(M), .DIV_M(DIV_M), .rst_n(rst_n), .Ctrl_HLD2(Ctrl_HLD2));
    DFFSHQX8 DFF1 (.D(), .CK(), .SN(), .Q());
endmodule