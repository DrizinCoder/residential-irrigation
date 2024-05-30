module binaryToDigit (d0, d1, d2, d3, clk);
	
	// Declaraçao de entradas e saidas
	input clk;
	output d0, d1, d2, d3;
	
	// Declaraçao Fios intermediarios
	wire A_bar, B_bar, A, B, d0wire, d1wire, d2wire, d3wire;
	
	//Logica dos digitos
	not not0 (A_bar, A);
	not not1 (B_bar, B);
	and and1 (d0wire, A_bar, B_bar);
	and and2 (d1wire, A_bar, B);
	and and3 (d2wire, A, B_bar);
	and and4 (d3wire, A, B);
	not (d0, d0wire);
	not (d1, d1wire);
	not (d2, d2wire);
	not (d3, d3wire);
	
	twoBitCounter tbc(
	
	.clk(clk),
	.A (A),
	.B (B)

);

endmodule
