module PD(
    output reg COMP,
    input clk_ext, clk_out,
    input Reset_PD,
    input [1:0] M_counter,
    input [3:0] N_counter
);
    always @(posedge clk_ext or posedge Reset_PD)
    begin
        if (Reset_PD) begin 
            COMP<=1'b0;
        end else if((M_counter ==2'd1)&&(N_counter ==3'd1)) begin 
            COMP <= clk_out;//1 lead
        end
    end

endmodule