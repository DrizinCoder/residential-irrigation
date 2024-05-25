module UndSec (A, B, C, D, clk, clk_out, Us, alin);

	// Declaraçao de entradas e saídas
	input clk, Us, alin;
	output A, B, C, D, clk_out;
	
	// Declaraçao de fio intermediarios
	wire nor0Wire, play, and1Wire, resetCycle, and2Wire, Q_F0_, Q_F3_;
	wire Q_F0, Q_F1, Q_F2, Q_F3; 
	
	// Lógica de pause do cronômetro
	nor nor0 (nor0Wire, Us, Alin);
	and and0 (play, clk, nor0Wire);
	
	// Lógica do contador da unidade de segundos
	
	tFlipFlop F0(

	.T(1),
	.clear(/*level to pulse*/),
	.CLK(play),
	.Q(D),
	.Q_(Q_F0),

	);
	
	tFlipFlop F1(

	.T(Q_F0),
	.clear(resetCycle),
	.CLK(play),
	.Q(C),
	.Q_(Q_F1),

	);
	
	and and1 (and1Wire, Q_F0, Q_F1);
	
	tFlipFlop F2(

	.T(and1Wire),
	.clear(resetCycle),
	.CLK(play),
	.Q(B),
	.Q_(Q_F2),

	);
	
	and and2 (and2Wire, and1Wire, Q_F2);
	
	tFlipFlop F3(

	.T(and2Wire),
	.clear(/*level to pulse*/),
	.CLK(play),
	.Q(A),
	.Q_(Q_F3),
	
	);
	
	not not0 (Q_F0_, Q_F0);
	not not1 (Q_F3_, Q_F3);
	and and3 (clk_out, Q_F0_, Q_F1, Q_F2, Q_F3_);
	nor nor1 (resetCycle, Q_F0, Q_F1, Q_F2, Q_F3);
	
endmodule
