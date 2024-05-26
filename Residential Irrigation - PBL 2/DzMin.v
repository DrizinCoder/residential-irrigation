module DzMin (A, B, C, D, clk);
	
	// Declaração de entradas e saídas
	input clk;
	output A, B, C, D;
	
	// Declaração de fio intermediários
	wire Q_F0, Q_F1, Q_F2;
	
	not (A, 1'b0);
	not (B, 1'b0);
	
	// Lógica do contador da Dezenas de segundos
	
	tFlipFlop F0(

	.T(1),
	.clear(),
	.CLK(clk),
	.Q(D),
	.Q_(Q_F0),

	);
	
	tFlipFlop F1(

	.T(Q_F0),
	.clear(),
	.CLK(clk),
	.Q(C),
	.Q_(Q_F1),

	);
	
endmodule
