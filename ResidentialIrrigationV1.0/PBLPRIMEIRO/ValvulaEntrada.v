// Declaração do modulo
module ValvulaEntrada(h, m, l, alin, ve);

	// Declaração de portas
	input h, m, l, alin;
	output ve;
	
	// Declaração de fios intermediários
	wire w1, w2;
	
	// Lógica do Circuito
	nor nor0 (w1, alin, h);
	nor nor1 (w2, h, m, l);
	or or0 (ve, w1, w2);
	
endmodule