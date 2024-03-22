module PD_MDLL (clk_in,clk_out,rst_n,lead,lag,counter);
    output reg lead,lag;
    input clk_in,clk_out;
    input rst_n;
	input [3:0] counter;
    wire ff_rst;

    assign ff_rst = ~(lag & lead); 

    always @(posedge clk_in or negedge ff_rst or negedge rst_n)
    begin
        if (~rst_n) begin 
            lag<=1'b0;
        end else if (~ff_rst) begin 
            lag <= 1'b0;
        end else if (counter == 4'd9 || counter == 4'd10) begin 
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
        end else if (counter == 4'd10 && clk_in == 0) begin 
            lead <= 1'b1;
        end else if (lag) begin
			lead <= 1'b1;
		end else begin
			lead <= 1'b0;
		end
    end 

endmodule
