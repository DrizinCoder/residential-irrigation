module UndMin (A, B, C, D, clk, clk_out, SETf0, SETf1, SETf2, SETf3, Clearf0, Clearf1, Clearf2, Clearf3);

	// Declaraçao de entradas e saídas
	input clk, SETf0, SETf1, SETf2, SETf3, Clearf0, Clearf1, Clearf2, Clearf3;
	output A, B, C, D, clk_out;
	
	// Declaraçao de fio intermediarios
	wire Q_F0, Q_F1, Q_F2, Q_F3, and1Wire, and2Wire, resetCycle;
	
	// Lógica do contador da unidade de segundos
	
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
	.clear(clearFF1),
	.CLK(clk),
	.Q(C),
	.Q_(Q_F1),
	.SET(SETf1),

	);
	
	and and1 (and1Wire, Q_F0, Q_F1);
	
	tFlipFlop F2(

	.T(and1Wire),
	.clear(clearFF2),
	.CLK(clk),
	.Q(B),
	.Q_(Q_F2),
	.SET(SETf2),

	);
	
	and and2 (and2Wire, and1Wire, Q_F2);
	
	tFlipFlop F3(

	.T(and2Wire),
	.clear(Clearf3),
	.CLK(clk),
	.Q(A),
	.Q_(Q_F3),
	.SET(SETf3),
	
	);
	
	and and3 (clk_out, Q_F0, Q_F3);
	nor nor1 (resetCycle, Q_F0, Q_F1, Q_F2, Q_F3);
	or or0 (clearFF1, resetCycle, Clearf1);
	or or1 (clearFF2, resetCycle, Clearf2);
	
endmodule
