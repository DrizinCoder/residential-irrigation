// Declaraçao do modulo 
module aspersao(us, gotejamento, alin, aspersao);

	// Declaraçao das portas
	input us, gotejamento, alin;
	output aspersao;

	// Logica do circuito
	nor nor0 (aspersao, us, gotejamento, alin);

endmodule