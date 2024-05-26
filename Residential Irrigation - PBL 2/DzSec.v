module DzSec (A, B, C, D, clk, pulse, clk_out);
	
	// Declaração de entradas e saídas
	input clk, pulse;
	output A, B, C, D, clk_out;
	
	// Declaração de fio intermediários
	wire Q_F0, Q_F1, Q_F2, resetCycle, and0Wire, and1wire;
	
	not (A, 1'b0);
	
	// Lógica do contador da Dezenas de segundos
	
	tFlipFlop F0(

	.T(1),
	.clear(pulse),
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
	.clear(pulse),
	.CLK(clk),
	.Q(B),
	.Q_(Q_F2),

	);
	
	and and0 (and0wire, B, D);
	or or0 (resetCycle, and0Wire, pulse);
	and and2 (clk_out, B, D);
	
endmodule
