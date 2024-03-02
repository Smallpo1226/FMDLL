module PD(
    output reg COMP,
    input clk_ext, clk_out,
    input Reset_PD,
    input [1:0] M_counter,
    input [3:0] N_counter,
	input [1:0] M,
	input [3:0] N,
    input [9:0] Q,
    input [9:0] Q_next
);
    always @(posedge clk_ext or posedge Reset_PD)
    begin
        if (Reset_PD) begin  
            COMP <= 0;
        end else if((M_counter == 2'd1) && (N_counter == 3'd1)) begin 
            if (Q != Q_next) begin
                COMP <= 0;
            end
		end else if((M_counter == M) && (N_counter == 3'd1)) begin 
            if (Q != Q_next) begin
                COMP <= 0;
            end
        end else if ((M_counter == M) && (N_counter == N)) begin
			if (Q != Q_next) begin
                COMP <= 1;
            end
		end
    end
 
endmodule