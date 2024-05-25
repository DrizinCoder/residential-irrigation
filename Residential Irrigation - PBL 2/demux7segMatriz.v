module demux7segMatriz(D0, D1, D2, D3, clk, A, B);
	
	// Declaraçao de entradas e saidas
	input clk;
	output D0, D1, D2, D3;
	inout A, B;
	
	// Declaraçao Fios intermediarios
	wire Q_F0, Q_F1, A_bar, B_bar;
	
	//Logica dos digitos
	not not0 (A_bar, A);
	not not1 (B_bar, B);
	and and1 (D0, A_bar, B_bar);
	and and2 (D1, A_bar, B);
	and and3 (D2, A, B_bar);
	and and4 (D3, A, B);
	
	twoBitCounter tbc(
	
	.clk(clk),
	.A (A),
	.B (B)

);

endmodule
