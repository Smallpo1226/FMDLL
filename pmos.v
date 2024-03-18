
module PMOS(d,g,s,rst_n);
input g,s,rst_n;
output d;
assign d = (rst_n==0)? 0:(g==0) ? s:d;
endmodule