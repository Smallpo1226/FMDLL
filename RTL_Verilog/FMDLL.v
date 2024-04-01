`include "PTC.v"
`include "FMC.v"
`include "DCDL.v"
`include "Clock_counter.v"

module FMDLL (
	input [1:0] M,
	input [3:0] N,
	input rst_n,
	input clk_ext,
	output clk_out,
	output reg [1:0] Sel
);
	wire [1:0]M_counter;
	wire [3:0]N_counter;
	wire DIV_M, DIV_N;
	reg clk_mid;
	wire [9:0] Q, Q_next;
	wire [15:0] T,Tb;
	wire [7:0] T_f1, Tb_f1;
	wire [7:0] T_f2, Tb_f2;
	wire clk_out_tmp;

	PTC U0(
		.Sel(Sel),
		.N(N), 
		.M(M),
		.DIV_M(DIV_M),
		.DIV_N(DIV_N),
		.clk_ext(clk_ext),
		.clk_out(clk_out),
		.Q(Q),
		.Q_next(Q_next),
		.T(T),
		.Tb(Tb),
		.T_f1(T_f1),
		.Tb_f1(Tb_f1),
		.T_f2(T_f2),
		.Tb_f2(Tb_f2),
		.N_counter(N_counter),
		.M_counter(M_counter),
		.rst_n(rst_n)
	);

	FMC U1(
		.clk_ext(clk_ext),
		.clk_out(clk_out),
		.rst_n(rst_n),
		.Sel(Sel),
		.DIV_M(DIV_M),
		.DIV_N(DIV_N),
		.M_counter(M_counter),
		.N_counter(N_counter),
		.M(M),
		.N(N)
	);

	DCDL U2(
		.clk_mid(clk_mid),
		.Q(Q),
		.T(T),
		.Tb(Tb),
		.T_f1(T_f1),
		.Tb_f1(Tb_f1),
		.T_f2(T_f2),
		.Tb_f2(Tb_f2),
		.clk_out(clk_out_tmp),
		.Sel(Sel),
		.clk_ext(clk_ext),
		.clk_out_out(clk_out)
	);
	
	Clock_counter U3(
		.clk_ext(clk_ext),
		.clk_out(clk_out),
		.N_counter(N_counter),
		.M_counter(M_counter),
		.M(M),
		.N(N),
		.rst_n(rst_n),
		.Sel(Sel[0])
	);

	always @(*) begin
		case (Sel) 
			2'b00: clk_mid = clk_out;
			2'b01: clk_mid = clk_ext;
			2'b10: clk_mid = 1;
			default: clk_mid = clk_ext;
		endcase
	end 

	wire t;
	assign t = (Sel == 2'b10||(Sel == 2'b01 && clk_ext == 1'b1 && clk_out==1'b0)) ? 0:clk_out_tmp;

	//added block to eliminate glitch
	parameter bit = 35;
	wire [bit:0] glitch_free, glitch_free_next;
	assign glitch_free[0] = t;
	genvar i;
	generate
		for (i = 0; i < bit; i = i + 1) begin:glitch_eliminate
			CLKBUFX2 G0( .A (glitch_free[i]), .Y (glitch_free[i+1]) );
		end
	endgenerate

	assign glitch_free_next[1] = glitch_free[0] & glitch_free[1];
	generate 
		for (i = 1; i < bit; i = i + 1) begin:glitch_eliminate2
			assign glitch_free_next[i+1] = glitch_free[i+1] | glitch_free_next[i];
		end
	endgenerate
	assign clk_out = glitch_free_next[bit];

endmodule
