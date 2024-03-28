module PD(
    output reg COMP,
    //output reg lead,
    //output reg lag,
    //input clk_ext, 
	input clk_out,
    input Reset_PD,
    input [1:0] M_counter,
    input [3:0] N_counter,
	//input [1:0] M,
	input [3:0] N,
    //input [9:0] Q,
    //input [9:0] Q_next,
	input DIV_M
);  
    reg COMP_tmp;
	/*always @(posedge DIV_M or posedge Reset_PD) begin
		if (Reset_PD) begin  
            COMP = 0;
		end else if (clk_out == 0) begin
			COMP = 0;
		end else begin
			COMP = 1;
		end
	end*/
    always@*begin
        if(Reset_PD)
            COMP = 0;
        else if(M_counter == 1 && N_counter == N)
            COMP = 0;
        else if(M_counter ==1 && N_counter == 1)
            COMP = 1;
        else
            COMP = COMP_tmp;
    end
    always@*begin
            COMP_tmp = COMP;
    end

endmodule
    