// Declaração do módulo
module gotejamento (us, ua, t, m, alin, Vg);

	// Declaração das portas
	input us, ua, t, alin, m;
	output Vg;
	
	// Declaração dos fios intermediários
	wire w1, w2, w3, w4, w5, w6;
	
	// Lógica do circuito
	nand nand0 (w1, ua, t);
	nor nor0 (w2, w1, us);
	nor nor1 (w3, us, t, m);
	and and0 (w4, w3, ua);
	or or0 (w5, w2, w4);
	not not0 (w6, alin);
	and and1 (Vg, w5, w6);
	
endmodule