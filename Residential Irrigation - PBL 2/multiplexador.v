// Instanciação do módulo
module multiplexador(l0, l1, l2, l3, l4, l5, l6, l0r, l1r, l2r, l3r, l4r, l5r, l6r, l0n, l1n, l2n, l3n, l4n, l5n, l6n, selector);

	// Declaração de portas 
	input l0r, l1r, l2r, l3r, l4r, l5r, l6r, l0n, l1n, l2n, l3n, l4n, l5n, l6n, selector;
	output l0, l1, l2, l3, l4, l5, l6;
	
	// Declaração de fios intermediários
	wire selector_, w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13;
	
	// Logica do circuito
	not not0 (selector_, selector);
	
	// Linha 0
	and and0 (w0, l0r, selector);
	and and1 (w1, l0n, selector_);
	or or0 (l0, w0, w1);
	
	// Linha 1
	and and2 (w2, l1r, selector);
	and and3 (w3, l1n, selector_);
	or or1 (l1, w2, w3,);
	
	// Linha 2
	and and4 (w4, l2r, selector);
	and and5 (w5, l2n, selector_);
	or or2 (l2, w4, w5,);
	
	// Linha 3
	and and6 (w6, l3r, selector);
	and and7 (w7, l3n, selector_);
	or or3 (l3, w6, w7);
	
	// Linha 4
	and and8 (w8, l4r, selector);
	and and9 (w9, l4n, selector_);
	or or4 (l4, w8, w9);
	
	// Linha 5
	and and10 (w10, l5r, selector);
	and and11 (w11, l5n, selector_);
	or or5 (l5, w10, w11);
	
	// Linha 6	
	and and12 (w12, l6r, selector);
	and and13 (w13,l6n, selector_);
	or or6 (l6, w12, w13);
	
endmodule
