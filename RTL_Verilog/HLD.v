`include "HLD_Ctrl1.v"
`include "HLD_Ctrl2.v"
`include "D_latch.v"
module HLD (
    input clk2,
    input clk4,
    input DIV_M,
    input M,
    input Sel, //sel[0]
    input rst_n,
    output Reset_PD,
    output  HLD1,
    output  HLD2
);
    wire Ctrl_HLD1;
    wire Ctrl_HLD2;
    wire DFF_to_latch_1, dummy1;
    wire DFF_to_latch_2, dummy2;
    
    HLD_Ctrl1 Controller1 (.clk2(clk2), .clk4(clk4), .M(M), .DIV_M(DIV_M), .rst_n(rst_n), .Ctrl_HLD1(Ctrl_HLD1));
    HLD_Ctrl2 Controller2 (.clk2(clk2), .clk4(clk4), .M(M), .DIV_M(DIV_M), .rst_n(rst_n), .Ctrl_HLD2(Ctrl_HLD2));
    DFFSHQX8 DFF1 (.D(1'b0), .CK(Sel), .SN(Ctrl_HLD1), .Q(DFF_to_latch_1));
    DFFSHQX8 DFF2 (.D(1'b0), .CK(Sel), .SN(Ctrl_HLD2), .Q(DFF_to_latch_2));
    BUFX20 BUF1 (.A(DFF_to_latch_1), .Y(dummy1));
    BUFX20 BUF2 (.A(DFF_to_latch_2), .Y(dummy2));
    D_latch DL1(.en(Ctrl_HLD1),.d(dummy1),.q(HLD1),.rst_n(rst_n));
    D_latch DL2(.en(Ctrl_HLD2),.d(dummy2),.q(HLD2),.rst_n(rst_n));
    
    assign Reset_PD = (HLD1 | HLD2);
endmodule 