`include "FDE.v"
module PFCU (
	input clk_in,
	input clk_fb,
	input [5:0] Q,
	input [5:0] Qb,
	output clk_out
);
	wire [4:0] FDE_Connect;
	FDE E0 (.clk_in(clk_in), .Q_bit(Q[0]), .Qb_bit(Qb[0]), .clk_fb(clk_fb), .clk_out(FDE_Connect[0]));
	FDE E1 (.clk_in(FDE_Connect[0]), .Q_bit(Q[1]), .Qb_bit(Qb[1]), .clk_fb(clk_fb), .clk_out(FDE_Connect[1]));
	FDE E2 (.clk_in(FDE_Connect[1]), .Q_bit(Q[2]), .Qb_bit(Qb[2]), .clk_fb(clk_fb), .clk_out(FDE_Connect[2]));
	FDE E3 (.clk_in(FDE_Connect[2]), .Q_bit(Q[3]), .Qb_bit(Qb[3]), .clk_fb(clk_fb), .clk_out(FDE_Connect[3]));
	FDE E4 (.clk_in(FDE_Connect[3]), .Q_bit(Q[4]), .Qb_bit(Qb[4]), .clk_fb(clk_fb), .clk_out(FDE_Connect[4]));
	FDE E5 (.clk_in(FDE_Connect[4]), .Q_bit(Q[5]), .Qb_bit(Qb[5]), .clk_fb(clk_fb), .clk_out(clk_out));
	
endmodule 