module DzMin (A, B, C, D, clk, SETf0, SETf1, Clearf0, Clearf1);
	
	// Declaração de entradas e saídas
	input clk, SETf0, SETf1, Clearf0, Clearf1;
	output A, B, C, D;
	
	// Declaração de fio intermediários
	wire Q_F0, Q_F1, Q_F2;
	
	not (A, 1);
	not (B, 1);
	
	// Lógica do contador da Dezenas de segundos
	
	tFlipFlop F0(

	.T(1),
	.clear(Clearf0),
	.CLK(clk),
	.Q(D),
	.Q_(Q_F0),
	.SET(SETf0),

	);
	
	tFlipFlop F1(

	.T(Q_F0),
	.clear(Clearf1),
	.CLK(clk),
	.Q(C),
	.Q_(Q_F1),
	.SET(SETf1),

	);
	
endmodule
