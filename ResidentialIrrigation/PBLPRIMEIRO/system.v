// Declaração do modulo
module system(h, m, l, us, ua, t, ValvulaEntrada, alarme, l0, l1, l2, l3, l4, l5, l6, selector, d1, d2, d3, d4, clk);

	// Declaração as portas
	input h, m, l, us, ua, t, selector, clk;
	output alarme, ValvulaEntrada, l0, l1, l2, l3, l4, l5, l6, d1, d2, d3, d4;
	
	// Fios intermediarios entre módulos
	wire gotejamentoWire, aspersaoWire;
	wire l0RegaMultiplex, l1RegaMultiplex, l2RegaMultiplex, l3RegaMultiplex, l4RegaMultiplex, l5RegaMultiplex, l6RegaMultiplex;
	wire l0NivelMultiplex, l1NivelMultiplex, l2NivelMultiplex, l3NivelMultiplex, l4NivelMultiplex, l5NivelMultiplex, l6NivelMultiplex;
	wire C0Wire, C1Wire, C2Wire, C3Wire, C4Wire;
	
	// Logica do circuito
	not (d1, 1'b0); 
	not (d2, 1'b0);
	not (d3, 1'b0);
	
	// Instanciação do módulo Alarm
	alarm alarm(
		.h (h),
		.m (m),
		.l (l),
		.al (alarme)
	);
	
	// Instanciação do módulo ValvulaEntrada
	ValvulaEntrada ve(
		.h (h),
		.m (m),
		.l (l),
		.alin (alarme),
		.ve (ValvulaEntrada)
	);
	
	// Instanciação do módulo Gotejamento
	gotejamento gt(
		.us(us),
		.ua(ua),
		.t (t),
		.m (m),
		.gotejamento (gotejamentoWire),
		.alin (alarme)
	);

	// Instanciação do módulo Aspersão	
	aspersao as(
		.us (us),
		.alin (alarme),
		.gotejamento(gotejamentoWire),
		.aspersao (aspersaoWire)
	);
	
	// Instanciação do decorderColunas
	decoderColuna dC(
	
	.clk(clk),
	.C0(C0Wire),
	.C1(C1Wire),
	.C2(C2Wire),
	.C3(C3Wire),
	.C4(C4Wire)
	
	); 
	
	// Instanciação do módulo decoderNivelDagua
	decoderNivelDagua dnd(
		.h (h),
		.m (m),
		.l (l),
		.C0 (C0Wire),
		.C1 (C1Wire),
		.C2 (C2Wire),
		.C3 (C3Wire),
		.C4 (C4Wire),
		.l0 (l0NivelMultiplex),
		.l1 (l1NivelMultiplex),
		.l2 (l2NivelMultiplex),
		.l3 (l3NivelMultiplex),
		.l4 (l4NivelMultiplex),
		.l5 (l5NivelMultiplex),
		.l6 (l6NivelMultiplex)
	); 
	
	// Instanciação do módulo decoderIrrigacao
	decoderIrrigacao di(
		.as (aspersaoWire),
		.gt (gotejamentoWire),
		.C0 (C0Wire),
		.C1 (C1Wire),
		.C2 (C2Wire),
		.C3 (C3Wire),
		.C4 (C4Wire),
		.l0 (l0RegaMultiplex),
		.l1 (l1RegaMultiplex),
		.l2 (l2RegaMultiplex),
		.l3 (l3RegaMultiplex),
		.l4 (l4RegaMultiplex),
		.l5 (l5RegaMultiplex),
		.l6 (l6RegaMultiplex)
	);
	
	// Instaciação do módulo multiplexador
	multiplexador mux(
	.selector(selector),
	.l0r (l0RegaMultiplex),
	.l1r (l1RegaMultiplex),
	.l2r (l2RegaMultiplex),
	.l3r (l3RegaMultiplex),
	.l4r (l4RegaMultiplex),
	.l5r (l5RegaMultiplex),
	.l6r (l6RegaMultiplex),
	.l0n (l0NivelMultiplex),
	.l1n (l1NivelMultiplex),
	.l2n (l2NivelMultiplex),
	.l3n (l3NivelMultiplex),
	.l4n (l4NivelMultiplex),
	.l5n (l5NivelMultiplex),
	.l6n (l6NivelMultiplex),
	.l0 (l0),
	.l1 (l1),
	.l2 (l2),
	.l3 (l3),
	.l4 (l4),
	.l5 (l5),
	.l6 (l6)
	);
	
endmodule
