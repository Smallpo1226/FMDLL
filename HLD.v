//`include "HLD_Ctrl1.v"
//`include "HLD_Ctrl2.v"
//`include "D_latch.v"
module HLD (
    input clk2,
    input clk4,
    input DIV_M,
    input DIV_N,
    input M,
    input Sel, //sel[0]
    input clk_ext, 
    input rst_n,
    output  Reset_PD,
    output  HLD1,
    output  HLD2
);
    
    wire Ctrl_HLD1;
    wire Ctrl_HLD2;
    wire DFF_to_latch_1;
    wire DFF_to_latch_2;
	supply0 gnd;
    
    HLD_Ctrl1 Controller1 (.clk2(clk2), .clk4(clk4), .M(M), .DIV_M(DIV_M), .rst_n(rst_n), .Ctrl_HLD1(Ctrl_HLD1));
    HLD_Ctrl2 Controller2 (.clk2(clk2), .clk4(clk4), .M(M), .DIV_M(DIV_M), .rst_n(rst_n), .Ctrl_HLD2(Ctrl_HLD2));
    DFFSHQX1 DFF1 (.D(gnd), .CK(Sel), .SN(Ctrl_HLD1), .Q(DFF_to_latch_1));
    DFFSHQX1 DFF2 (.D(gnd), .CK(Sel), .SN(Ctrl_HLD2), .Q(DFF_to_latch_2));
    D_latch DL1(.en(Ctrl_HLD1),.d(DFF_to_latch_1),.q(HLD1),.rst_n(rst_n));
    D_latch DL2(.en(Ctrl_HLD2),.d(DFF_to_latch_2),.q(HLD2),.rst_n(rst_n));
    
    assign Reset_PD = (HLD1 | HLD2);
    /*
    reg harmonic_comp;
    /*always @(negedge DIV_N or negedge rst_n) begin
        if (~rst_n) begin
            harmonic_comp = 0;
        end else if (DIV_M == 1) begin
            harmonic_comp = 1;
        end else if (DIV_M == 0) begin
            harmonic_comp = 0;
        end
    end

    always @(posedge DIV_N or negedge rst_n) begin
        if (~rst_n) begin
            Reset_PD <= 0;
        end else if (DIV_M == 1 /*| harmonic_comp == 1) begin
            Reset_PD <= 1;
        end else if (DIV_M == 0) begin
            Reset_PD <= 0;
        end
    end*/
    
endmodule 