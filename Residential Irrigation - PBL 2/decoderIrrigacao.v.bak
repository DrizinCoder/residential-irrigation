// Declaraçao do modulo

module decoderIrrigacao(as, gt, a, b, c, d, e, f, g);

	// Declaraçao das portas
	input as, gt;
	output a, b, c, d, e, f, g;
	
	// Declaraçao dos fios intermediarios
	wire w1, w2;
	
	// Logica do Circuito
		not not0 (w1, as);
		not not1 (w2, gt);
		not not2 (b, as);
		not not3 (g, as);
		not not4 (d, gt);
		and and0 (a, w1, w2);
		and and1 (c, w1, w2);
		and and2 (e, w1, w2);
		and and3 (f, w1, w2);
		
endmodule
