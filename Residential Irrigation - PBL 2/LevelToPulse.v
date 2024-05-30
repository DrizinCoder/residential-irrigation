module LevelToPulse (h, m, l, As, Gt, clk, pulse);
	
	// Declaraçao de entradas e saidas
	input h, m, l, As, Gt, clk;
	output pulse;
	
	// Declaraçao de fios intermediarios
	wire h_, m_, wireAnd0, wireAnd1, wireAnd2, wireAnd3, wireAnd4, wireAnd5, wireAnd6, wireAnd7, wireAnd8, wireAnd9, wireAnd10, wireAnd11, wireAnd12, wireAnd13, wireAnd14, wireAnd15, wireAnd16, wireOr0, wireOr1;
	wire QF0, Q_F1, QF2, Q_F3, QF4, Q_F5, QF6, Q_F7, QF8, Q_F9, QF10, Q_F11, QF12, Q_F13;

	
	// Logica do nivel
	not not0 (h_, h);
	not not1 (m_, m);

	and and0 (wireAnd0, h_, m, l);
	and and1 (wireAnd1, h_, m_, l);	
	and and2 (wireAnd2, h, m, l);
	
	//FF0 e FF1
	and and3 (wireAnd3, wireAnd0, QF0);
	and and4 (wireAnd4, QF0, Q_F1);
	
	//FF2 e FF3
	and and5 (wireAnd5, wireAnd1, QF2);
	and and6 (wireAnd6, QF2, Q_F3);
	
	//FF4 e FF5
	and and7 (wireAnd7, wireAnd2, QF4);
	and and8 (wireAnd8, QF4, Q_F5);
	
	or or0 (wireOr0, wireAnd4, wireAnd6, wireAnd8);
	
	//FF6 e FF7
	and and9 (wireAnd9, wireOr0, QF6);
	and and10 (wireAnd10, QF6, Q_F7);
	
	
	// Logica da rega
	//FF8 e FF9
	and and11 (wireAnd11, As, QF8);
	and and12 (wireAnd12, QF8, Q_F9);
	
	//FF10 e FF11
	and and13 (wireAnd13, Gt, QF10);
	and and14 (wireAnd14, QF10, Q_F11);
	
	or or1 (wireOr1, wireAnd12, wireAnd14);
	
	//FF12 e FF13
	and and15 (wireAnd15, wireOr1, QF12);
	and and16 (wireAnd16, QF12, Q_F13);
	
	or or2 (pulse, wireAnd10, wireAnd16);
	
	// FlipFlops nivel
	dFlipFlop F0(

	.d(wireAnd0),
	.rstn(),
	.clk(clk),
	.q(QF0),
	.q_(),

	);
	
	dFlipFlop F1(

	.d(wireAnd3),
	.rstn(),
	.clk(clk),
	.q(),
	.q_(Q_F1),

	);
	
	dFlipFlop F2(

	.d(wireAnd1),
	.rstn(),
	.clk(clk),
	.q(QF2),
	.q_(),

	);
	
	dFlipFlop F3(

	.d(wireAnd5),
	.rstn(),
	.clk(clk),
	.q(),
	.q_(Q_F3),

	);
	
	dFlipFlop F4(

	.d(wireAnd2),
	.rstn(),
	.clk(clk),
	.q(QF4),
	.q_(),

	);
	
	dFlipFlop F5(

	.d(wireAnd7),
	.rstn(),
	.clk(clk),
	.q(),
	.q_(Q_F5),

	);
	
	dFlipFlop F6(

	.d(wireOr0),
	.rstn(),
	.clk(clk),
	.q(QF6),
	.q_(),

	);
	
	dFlipFlop F7(

	.d(wireAnd9),
	.rstn(),
	.clk(clk),
	.q(),
	.q_(Q_F7),

	);
	
	//FlipFlops rega
	dFlipFlop F8(

	.d(As),
	.rstn(),
	.clk(clk),
	.q(QF8),
	.q_(),

	);
	
	dFlipFlop F9(

	.d(wireAnd11),
	.rstn(),
	.clk(clk),
	.q(),
	.q_(Q_F9),

	);
	
	dFlipFlop F10(

	.d(Gt),
	.rstn(),
	.clk(clk),
	.q(QF10),
	.q_(),

	);
	
	dFlipFlop F11(

	.d(wireAnd13),
	.rstn(),
	.clk(clk),
	.q(),
	.q_(Q_F11),

	);
	
	dFlipFlop F12(

	.d(wireOr1),
	.rstn(),
	.clk(clk),
	.q(QF12),
	.q_(),

	);
	
	dFlipFlop F13(

	.d(wireAnd15),
	.rstn(),
	.clk(clk),
	.q(),
	.q_(Q_F13),

	);
	

endmodule
