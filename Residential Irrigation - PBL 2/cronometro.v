module cronometro(h, m, l, As, Gt, d0, d1, d2, d3, clk_counter, clk_mux, us, alin, a, b, c, d, e, f, g, pulse, A3,B3,C3,D3);

	// Declaração de Entradas e Saídas
	input clk_counter, clk_mux, us, alin, pulse, h, m, l, As, Gt, d0,d1,d2,d3;
	output  a,b,c,d,e,f,g;
	inout A3,B3,C3,D3;
	
	// Declaração fios intermédiários
	wire clk_undsec, clk_dzsec, clk_undmin;
	
	wire clkOutDelay;
	
	wire A0, B0, C0, D0, A1,B1,C1,D1, A2,B2,C2,D2;
	
	wire A0SET, B0SET, A1SET, B1SET, C1SET, D1SET;
	wire A0Clear, B0Clear, A1Clear, B1Clear, C1Clear, D1Clear;
	
	
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
	.SETf0(D1SET),
	.SETf1(C1SET),
	.SETf2(B1SET),
	.SETf3(A1SET),
	.Clearf0 (D1Clear), 
	.Clearf1 (C1Clear),
	.Clearf2 (B1Clear),
	.Clearf3 (A1Clear),
	
	);
	
	DzMin DzM(
	
	.A (A0),
	.B (B0),
	.C (C0),
	.D (D0),
	.Clearf0 (B0Clear),
	.Clearf1 (A0Clear),
	.clk (clk_undmin),
	.SETf0(B0SET),
	.SETf1(A0SET),
	);
	
	wire Af, Bf, Cf, Df;
	
	// instanciaçao do Decorder dos Digitos da Matriz de 7 segmentos
	decoderDigitos(
	.h(h),
	.m(m),
	.l(l),
	.As(As),
	.Gt(Gt),
	.pulse(pulse),
	.A0SET(A0SET),
	.A0Clear(A0Clear),
	.B0SET(B0SET),
	.B0Clear(B0Clear),
	.A1SET(A1SET),
	.A1Clear(A1Clear),
	.B1SET(B1SET),
	.B1Clear(B1Clear),
	.C1SET(C1SET),
	.C1Clear(C1Clear),
	.D1SET(D1SET),
	.D1Clear(D1Clear),
	);
	
	muxCountCronometro MCC ( 
		.clk(clk_mux),
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
