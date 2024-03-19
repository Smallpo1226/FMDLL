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
);  reg COMP_tmp;
    always @*//(posedge clk_ext /*or posedge Reset_PD*/)
    begin
        if (Reset_PD) begin  
            COMP_tmp = 0;
        end else if((M_counter == 2'd1) && (N_counter == 3'd1)) begin 
            if (Q != Q_next) begin
                COMP_tmp = 1;
            end
		end else if((M_counter == M) && (N_counter == 3'd1)) begin 
            if (Q != Q_next) begin
                COMP_tmp = 1;
            end
        end else if ((M_counter == M) && (N_counter == N)) begin
			if (Q != Q_next) begin
                COMP_tmp = 0;
            end
        end else begin
            COMP_tmp = 1;
        end
    end
    always @ (posedge clk_ext)
    begin
        COMP <= COMP_tmp;
    end
 
endmodule
    /*always @(posedge clk_ext or posedge Reset_PD)
    begin
        if (Reset_PD) begin 
            COMP<=1'b0;
        end else if((M_counter ==2'd3)&&(N_counter ==3'd1)) begin 
            COMP <= clk_out;//1 lead
        end
    end*/