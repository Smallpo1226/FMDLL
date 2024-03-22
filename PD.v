module PD(
    output reg COMP,
    //output reg lead,
    //output reg lag,
    //input clk_ext, 
	input clk_out,
    input Reset_PD,
    //input [1:0] M_counter,
    //input [3:0] N_counter,
	//input [1:0] M,
	//input [3:0] N,
    //input [9:0] Q,
    //input [9:0] Q_next,
	input DIV_M
);  
	always @(posedge DIV_M or posedge Reset_PD) begin
		if (Reset_PD) begin  
            COMP = 0;
		end else if (clk_out == 0) begin
			COMP = 0;
		end else begin
			COMP = 1;
		end
	end
    /*
    wire ff_rst;
    assign ff_rst = ~(lag & lead); 

    always @(posedge clk_ext or negedge ff_rst or negedge rst_n)
    begin
        if (~rst_n) begin 
            lag<=1'b0;
        end else if (~ff_rst) begin 
            lag <= 1'b0;
        end else if (M_counter == M-1 || M_counter == M) begin 
            lag <= 1'b1;
        end else begin
			lag <= 1'b0;
		end
    end

    always @(posedge clk_out or negedge ff_rst or negedge rst_n )
    begin
        if (~rst_n) begin 
            lead<=1'b0;
        end else if (~ff_rst) begin 
            lead <= 1'b0;
        end else if (M_counter == M && clk_ext == 0) begin 
            lead <= 1'b1;
        end else if (lag) begin
			lead <= 1'b1;
		end else begin
			lead <= 1'b0;
		end
    end 
    */
endmodule
    