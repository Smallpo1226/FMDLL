module NMOS (
	input gate,
	input drain,
    output source
);

	assign source = gate ? drain : 0;
	
endmodule