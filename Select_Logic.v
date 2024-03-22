module Select_Logic (
    input DIV_N,
    input clk_out,
    input clk_ext,
    input DIV_M,
    input [3:0] N, 
    input [1:0] M, 
    input [3:0] N_counter,
    input [1:0] M_counter,
    output reg [1:0] Sel,
    input rst_n
);
	reg [1:0] Sel_tmp;
    always @(*) begin
		if (~rst_n) begin
			Sel_tmp = 2'b10;
		end else if (M_counter == 1) begin
			Sel_tmp = 2'b00;
		end else if (N_counter == N && DIV_M == 1 ) begin
			Sel_tmp = 2'b10;
		end else if (N_counter == N && M_counter == M && (~clk_out)) begin
			Sel_tmp = 2'b01;
		end else begin 
			Sel_tmp = Sel; 
		end
    end
	
	always @(*) begin
		Sel = Sel_tmp;
	end
endmodule