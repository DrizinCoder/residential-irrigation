module decoderNivelDagua(h, m, l, C0, C1, C2, C3, C4, l0, l1, l2, l3, l4, l5, l6);

// Declaraçao das portas
	input h, m, l, C0, C1, C2, C3, C4;
	output l0, l1, l2, l3, l4, l5, l6;

	// Declaraçao de fios intermediarios
	wire and1wire, and2wire, and3wire, and4wire, and5wire, and6wire, and9wire, and10wire, and11wire, and12wire, and13wire, and15wire;
	wire or0wire, or1wire, or2wire, or3wire, or6wire, or7wire, or10wire;
	wire H_, M_, L_;


	// Logica do circuito

	// Entradas "H", "M", "L" barradas
	not not0 (H_, h);
	not not1 (M_, m);
	not not2 (L_, l);

	// Linha 0
	or or0 (or0wire, M_, l);
	and and0 (l0, H_, or0wire);

	// Linha 1
	or or1 (or1wire, C0, C1);
	and and1 (and1wire, or1wire, l0);
	or or2 (or2wire, C2, C3, C4);
	and and2 (and2wire, H_, l);
	or or3 (or3wire, and2wire, M_, L_);
	and and3 (and3wire, or3wire, or2wire);
	or or4 (l1, and1wire, and3wire);

	// Linha 2
	or or5 (l2, and1wire, and3wire);

	// Linha 3
	and and4 (and4wire, H_, M_);
	or or6 (or6wire, C0, C1, C2, C3);
	and and5 (and5wire, and4wire, or6wire);
	or or7 (or7wire, M_, L_);
	and and6 (and6wire, or7wire, C4);
	or or8 (l3, and5wire, and6wire);

	// Linha 4
	and and9 (and9wire, or1wire, and4wire);
	and and10 (and10wire, or7wire, or2wire);
	or or9 (l4, and9wire, and10wire);

	// Linha 5
	and and11 (and11wire, H_, M_, L_);
	and and12 (and12wire, and11wire, or1wire);
	and and13 (and13wire, h, M_);
	or or10 (or10wire, and13wire, L_);
	and and15 (and15wire, or10wire, or2wire);
	or or11 (l5, and12wire, and15wire);

	// Linha 6
	and and16 (l6, H_, M_, L_);

endmodule
