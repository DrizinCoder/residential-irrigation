// Declaração do módulo
module alarm(h, m, l, al);
	
	// Declaração das portas
	input h, m, l;
	output al;
	
	// Declaração de fios intermediários
	wire w1, w2, w3, w4;
	
	// Lógica do circuito
	nand nand0 (w1, m, l);
	and and0 (w4, w1, h);
	nor nor0 (w2, h, l);
	or or1 (al, w2, w4);
	
endmodule