// Declaraçao do modulo

module decoderNivelDagua(h, m, l, C0, C1, C2, C3, C4, l0, l1, l2, l3, l4, l5, l6);

	// Declaraçao das portas
	input h, m, l, C0, C1, C2, C3, C4;
	output l0, l1, l2, l3, l4, l5, l6;
	
	// Declaraçao de fios intermediarios
	wire and1wire, and2wire, and3wire, and4wire, and5wire, and6wire, and7wire; 
	wire or0wire, or1wire;
	wire H_, M_, L_;
	
	
	// Logica do circuito
	
	// Entradas "H", "M", "L" barradas
	not not0 (H_, H);
	not not1 (M_, M);
	not not2 (L_, L);
	
	// Linha 0
	and and0 (l0, H_, L);
	
	// Linha 1
	or or0 (or0wire, M_, L_);
	and and1 (and1wire, or0wire, H);
	and and2 (and2wire, H_, M, L_);
	or or1 (or1wire, and1wire, and2wire);
	and and3 (and3wire, or1wire, C2);
	and and4 (and4wire, or1wire, C3);
	and and5 (and5wire, or1wire, C4);
	or or2 (l1, l0, and3wire, and4wire, and5wire);
	
	// Linha 2
	or or3 (l2, l0, and3wire, and4wire, and5wire);
	
	// Linha 3
	and and6 (and6wire, H_, M_);
	or or4 (l3, and6wire, and5wire);
	
	// Linha 4
	or or5 (l4, and6wire, and3wire, and4wire, and5wire);
	
	// Linha 5
	and and7 (and7wire, H_, M_, L_);
	or or6 (l5, and7wire, and3wire, and4wire, and5wire);
	
	// Linha 6
	or or7(l6, and7wire);
	
endmodule
