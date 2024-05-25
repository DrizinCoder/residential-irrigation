// Declaraçao do modulo 
module aspersao(us, Vg, alin, Va);

	// Declaraçao das portas
	input us, Vg, alin;
	output Va;

	// Logica do circuito
	nor nor0 (Va, us, Vg, alin);

endmodule