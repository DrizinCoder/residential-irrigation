// Declaraçao do modulo

module decoderIrrigacao(as, gt, C0, C1,C2, C3, C4, l0, l1, l2, l3, l4, l5, l6);

	// Declaraçao das portas
	input as, gt, C0, C1, C2, C3, C4;
	output l0, l1, l2, l3, l4, l5, l6;
	
	// Declaraçao dos fios intermediarios
	wire as_, gt_, or0wire, and1wire, and4wire, and5wire, and6wire, or4wire, as_gt, asgt_;
	
	// Logica do Circuito
	
	// Entradas "as" e "gt" barradas
	not not0 (as_, as);
	not not1	(gt_, gt);
	
	// Lógicas de entrada
	and and0 (as_gt, as_, gt);
	and and1 (asgt_, as, gt_);

	// Linha 0
	and and2 (l0, as_, gt_);
	
	// Linha 1
	or or0 (or0wire, C1, C2, C3, C4);
	and and3 (and1wire, or0wire, as_gt);
	and and4 (and4wire, asgt_, C2);
	or or1 (l1, l0, and1wire, and4wire);
	
	// Linha 2
	or or2 (l2, l0, and1wire);
	
	// Linha 3
	and and5 (and5wire, as_gt, C1);
	or or3 (l3, l0, and5wire);
	
	// Linha 4 
	or or4 (or4wire, C1, C2);
	and and6 (and6wire, or4wire, as_gt);
	and and7 (and7wire, asgt_, C2);
	or or5 (l4, l0, and6wire, and7wire);
	
	// Linha 5
	or or6 (l5, l0, and6wire, and7wire);
	
	// Linha 6
	or or7 (l6, l0, and7wire);
	
endmodule
