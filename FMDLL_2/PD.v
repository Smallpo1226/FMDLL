module PD(CLK_exit,CLK_out,Reset_PD,COMP,N_counter,M_counter);

output reg COMP;
input CLK_exit,CLK_out;
input Reset_PD;
input [1:0] M_counter;
input [3:0] N_counter;


always @(posedge CLK_exit or negedge Reset_PD)
begin
    if (~Reset_PD) begin 
        COMP<=1'b0;
    end else if((M_counter ==2'd1)&&(N_counter ==3'd1)) begin 
        COMP <= CLK_out;//1 lead
    end
end

endmodule