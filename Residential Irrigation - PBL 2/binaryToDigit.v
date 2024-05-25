module binaryToDigit (d0, d1, d2, d3, clk);
	
	// Declaraçao de entradas e saidas
	input clk;
	output d0, d1, d2, d3;
	
	// Declaraçao Fios intermediarios
	wire Q_F0, Q_F1, A_bar, B_bar, A, B;
	
	//Logica dos digitos
	not not0 (A_bar, A);
	not not1 (B_bar, B);
	and and1 (d0, A_bar, B_bar);
	and and2 (d1, A_bar, B);
	and and3 (d2, A, B_bar);
	and and4 (d3, A, B);
	
	twoBitCounter tbc(
	
	.clk(clk),
	.A (A),
	.B (B)

);

endmodule
