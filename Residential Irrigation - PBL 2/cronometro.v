module cronometro(d0, d1, d2, d3, clk_counter, clk_mux, us, alin, a, b, c, d, e, f, g, pulse);

	// Declaração de Entradas e Saídas
	input clk_counter, clk_mux, us, alin, pulse;
	output d0,d1,d2,d3, a,b,c,d,e,f,g;
	
	// Declaração fios intermédiários
	wire clk_undsec, clk_dzsec, clk_undmin;
	
	wire clkOutDelay;
	
	wire A0, B0, C0, D0, A1,B1,C1,D1, A2,B2,C2,D2, A3,B3,C3,D3;
	
	binaryToDigit btd (
		.clk(clk_mux),
		.d0(d0),
		.d1(d1),
		.d2(d2),
		.d3(d3)
	);
	
	
	// Cascateamento dos contadores para formar o cronômetro
	UndSec UndS(
	
	.A (A3),
	.B (B3),
	.C (C3),
	.D (D3),
	.pulse (pulse),
	.clk (clk_counter),
	.clk_out (clk_undsec),
	.Us (us),
	.alin (alin)
	
	);

	DzSec DzS(
	
	.A (A2),
	.B (B2),
	.C (C2),
	.D (D2),
	.pulse (pulse),
	.clk (clk_undsec),
	.clk_out (clk_dzsec),
	
	);
	
	UndMin UndM(
	
	.A (A1),
	.B (B1),
	.C (C1),
	.D (D1),
	.clk (clk_dzsec),
	.clk_out (clk_undmin),
	
	);
	
	DzMin DzM(
	
	.A (A0),
	.B (B0),
	.C (C0),
	.D (D0),
	.clk (clk_undmin)
	
	);
	
	wire Af, Bf, Cf, Df;
	
	muxCountCronometro MCC ( 
		.clk (clk_mux),
		.A0(A0),
		.B0(B0), 
		.C0(C0), 
		.D0(D0), 
		.A1(A1),
		.B1(B1),
		.C1(C1),
		.D1(D1), 
		.A2(A2),
		.B2(B2),
		.C2(C2),
		.D2(D2), 
		.A3(A3),
		.B3(B3),
		.C3(C3),
		.D3(D3), 
		.A(Af),
		.B(Bf),
		.C(Cf),
		.D(Df)
	);
	
	
	decoder7segDigit d7s (
		.A(Af),
		.B(Bf), 
		.C(Cf),
		.D(Df),
		.a(a), 
		.b(b), 
		.c(c), 
		.d(d), 
		.e(e), 
		.f(f), 
		.g(g)
	);
	
endmodule
