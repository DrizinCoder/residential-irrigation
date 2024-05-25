module twoBitCounter (clk, A, B);

	input clk;
	output A, B;
	
	wire Q_F0, Q_F1;
	 
	dFlipFlop F0(

	.d(Q_F0),
	.rstn(),
	.clk(clk),
	.q(B),
	.q_(Q_F0),

);

	dFlipFlop F1(

	.d(Q_F1),
	.rstn(),
	.clk(Q_F0),
	.q(A),
	.q_(Q_F1),

);

endmodule
