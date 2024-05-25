module DzSec (A, B, C, D, clk, clk_out);
	
	// Declaração de entradas e saídas
	input clk;
	output A, B, C, D, clk_out;
	
	// Declaração de fio intermediários
	wire Q_F0, Q_F1, Q_F2, resetCycle;
	
	not (A, 1'b0);
	
	// Lógica do contador da Dezenas de segundos
	
	tFlipFlop F0(

	.T(1),
	.clear(/*level to pulse*/),
	.CLK(clk),
	.Q(D),
	.Q_(Q_F0),

	);
	
	tFlipFlop F1(

	.T(Q_F0),
	.clear(resetCycle),
	.CLK(clk),
	.Q(C),
	.Q_(Q_F1),

	);
	
	and and1 (and1Wire, Q_F0, Q_F1);
	
	tFlipFlop F2(

	.T(and1Wire),
	.clear(/*level to pulse*/),
	.CLK(clk),
	.Q(B),
	.Q_(Q_F2),

	);
	
	and and0 (resetCycle, B, D);
	and and2 (clk_out, B, D);
	
endmodule
