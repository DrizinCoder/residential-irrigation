module UndMin (A, B, C, D, clk, clk_out);

	// Declaraçao de entradas e saídas
	input clk;
	output A, B, C, D, clk_out;
	
	// Declaraçao de fio intermediarios
	wire Q_F0, Q_F1, Q_F2, Q_F3, and1Wire, and2Wire, resetCycle;
	
	// Lógica do contador da unidade de segundos
	
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
	.clear(resetCycle),
	.CLK(clk),
	.Q(B),
	.Q_(Q_F2),

	);
	
	and and2 (and2Wire, and1Wire, Q_F2);
	
	tFlipFlop F3(

	.T(and2Wire),
	.clear(/*level to pulse*/),
	.CLK(clk),
	.Q(A),
	.Q_(Q_F3),
	
	);
	
	and and3 (clk_out, Q_F0, Q_F3);
	nor nor1 (resetCycle, Q_F0, Q_F1, Q_F2, Q_F3);
	
endmodule
