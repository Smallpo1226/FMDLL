
module NMOS(d,g,s,rst_n);
input g,s,rst_n;
output d;
assign d = (rst_n==0)? 0:(g==1) ? s:d;
endmodule