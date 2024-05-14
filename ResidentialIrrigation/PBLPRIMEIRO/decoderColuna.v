module decoderColuna(C0, C1, C2, C3, C4, clk);

	// Declaraçao de entradas e saidas
	input clk;
	output C0, C1, C2, C3, C4;

	// Declaraçao Fios intermediarios
	wire Q_F0, Q_F1, Q_F2, wireReset, A_bar, B_bar, C_bar, As_bar, Gt_bar, clk_delay;
	wire w1, w2, w3, w4, w5, w6, w7, w8, w9;
	wire A, B, C;

	// logica de colunas
	and and0 (wireReset, A, B);
	not not0 (A_bar, A);
	not not1 (B_bar, B);
	not not2 (C_bar, C);
	and and1 (C0, A_bar, B_bar, C_bar);
	and and2 (C1, A_bar, B_bar, C);
	and and3 (C2, A_bar, C_bar, B);
	and and4 (C3, A_bar, B, C);
	and and5 (C4, A, B_bar, C_bar);

	delay dl(
	
	.clk(clk),
	.Q_out(clk_delay),

);

	dFlipFlop F0(

	.d(Q_F0),
	.rstn(wireReset),
	.clk(clk_delay),
	.q(C),
	.q_(Q_F0),

);

	dFlipFlop F1(

	.d(Q_F1),
	.rstn(wireReset),
	.clk(Q_F0),
	.q(B),
	.q_(Q_F1),

);

	dFlipFlop F2(

	.d(Q_F2),
	.rstn(wireReset),
	.clk(Q_F1),
	.q(A),
	.q_(Q_F2),

);

endmodule
