// Instanciação do módulo
module multiplexador(a, b, c, d, e, f, g, aR, bR, cR, dR, eR, fR, gR, aN, bN, cN, dN, eN, fN, gN, selector);

	// Declaração de portas 
	input selector, aR, bR, cR, dR, eR, fR, gR, aN, bN, cN, dN, eN, fN, gN;
	output a, b, c, d, e, f, g;
	
	// Declaração de fios intermediários
	wire w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16;
	
	// Logica do circuito
	not not0 (w15, selector);
	
	and and0 (w1, aR, selector);
	and and1 (w2, aN, w15);
	or or0 (a, w1, w2);
	
	and and2 (w3, bR, selector);
	and and3 (w4, bN, w15);
	or or1 (b, w3, w4);
	
	and and4 (w5, cR, selector);
	and and5 (w6, cN, w15);
	or or2 (c, w5, w6);
	
	and and6 (w7, dR, selector);
	and and7 (w8, dN, w15);
	or or3 (d, w7, w8);
	
	and and8 (w9, eR, selector);
	and and9 (w10, eN, w15);
	or or4 (e, w9, w10);
	
	and and10 (w11, fR, selector);
	and and11 (w12, fN, w15);
	or or5 (f, w11, w12); 
	
	and and12 (w13, gR, selector);
	and and13 (w14, gN, w15);
	or or6 (g, w13, w14);
	
endmodule
