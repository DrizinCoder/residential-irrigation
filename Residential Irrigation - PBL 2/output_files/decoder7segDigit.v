module decoder7segDigit(A, B, C, D, a, b, c, d, e, f, g);

	// Declaraçao de entradas e saidas
	input A, B, C, D;
	output a, b, c, d, e, f, g;
	
	// Declaraçao de fios intermediarios
	wire A_, B_, C_, D_;
	wire and0Wire, and1Wire, and2Wire, and3Wire, and5Wire, and6Wire, and7Wire, and8Wire, and9Wire, and10Wire;
	
	// Logica do digito
	not not0 (A_, A);
	not not1 (B_, B);
	not not2 (C_, C);
	not not3 (D_, D);
	
	// Led a
	and and0 (and0Wire, A_, B_, C_, D);
	and and1 (and1Wire, B, C_, D_);
	or or0 (a, and0Wire, and1Wire);
	
	// Led b
	and and2 (and2Wire, B, C_, D);
	and and3 (and3Wire, B, C, D_);
	or or1 (b, and2Wire, and3Wire);
	
	// Led c
	and and4 (c, B_, C, D_);
	
	// Led d
	and and5 (and5Wire, B, C, D);
	or or2 (d, and5Wire, and0Wire, and1Wire);
	
	// Led e
	and and6 (and6Wire, B, C_);
	or or3 (e, D, and6Wire);
	
	// Led f
	and and7 (and7Wire, A_, B_, D);
	and and8 (and8Wire, B_, C);
	and and9 (and9Wire, C, D);
	or or4 (f, and7Wire, and8Wire, and9Wire);
	
	// Led g
	and and10 (and10Wire, A_, B_, C_);
	or or5 (g, and10Wire, and5wire);
	
endmodule
