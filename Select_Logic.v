
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

   /*always@* begin
    if(!rst_n) begin
        Sel = 2'b10;    
    end
    else if (DIV_N == 0 && DIV_M == 1) begin
        Sel[1] = 1;
    end
    else if (!clk_out && !DIV_N && !DIV_M) begin
        Sel[0] = 1;
    end
    else if(M_counter == 1) begin
        Sel = 2'd0;
    end
    else if(DIV_M == 0 ) begin
        Sel[1] = 0;
    end 

end*/
reg [1:0] Sel_tmp;
always@*
    Sel_tmp=Sel;

 always@* begin
    if(!rst_n) begin 
        Sel = 2'b11; 
    end
    else    
    if((M_counter != M )&&(M_counter != 2'd1)) begin
        if((N_counter == N) && (~DIV_N)) begin
            Sel = 2'b10;
        end else
        begin
            Sel=Sel_tmp;
        end
    end 
    else if(M_counter == 2'd1)
         Sel = 2'b0;
    else  begin
        if((~clk_out) && (~DIV_M) && (~DIV_N)) begin
            Sel = 2'b01;
        end else begin
            Sel=Sel_tmp;
        end
    end
end
endmodule
