module FDE (Q,Qb,connect,feedback);
input connect;
input feedback;
input Q;
input Qb;
wire wire1;
wire wire2;

supply0 gnd;
supply1 vdd;

pmos p1(wire1,vdd,feedback);
pmos p2(connect,wire1,Qb);
nmos n1(wire2,gnd,feedback);
nmos n2(connect,wire2,Q);

endmodule