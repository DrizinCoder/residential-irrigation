// Declaração do modulo
module system(h, m, l, us, ua, t, ValvulaEntrada, alarme, a, b, c, d, e, f, g, selector, d1, d2, d3, d4);

	// Declaração as portas
	input h, m, l, us, ua, t, selector;
	output alarme, ValvulaEntrada, a, b, c, d, e, f, g, d1, d2, d3, d4;
	
	// Fios intermediarios entre módulos
	wire gotejamentoWire, aspersaoWire;
	wire aRegaMultiplex, bRegaMultiplex, cRegaMultiplex, dRegaMultiplex, eRegaMultiplex, fRegaMultiplex, gRegaMultiplex;
	wire aNivelMultiplex, bNivelMultiplex, cNivelMultiplex, dNivelMultiplex, eNivelMultiplex, fNivelMultiplex, gNivelMultiplex;
	
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
	
	// Instanciação do módulo decoderNivelDagua
	decoderNivelDagua dnd(
		.h (h),
		.m (m),
		.l (l),
		.a (aNivelMultiplex),
		.b (bNivelMultiplex),
		.c (cNivelMultiplex),
		.d (dNivelMultiplex),
		.e (eNivelMultiplex),
		.f (fNivelMultiplex),
		.g (gNivelMultiplex)
	); 
	
	// Instanciação do módulo decoderIrrigacao
	decoderIrrigacao di(
		.as (aspersaoWire),
		.gt (gotejamentoWire),
		.a (aRegaMultiplex),
		.b (bRegaMultiplex),
		.c (cRegaMultiplex),
		.d (dRegaMultiplex),
		.e (eRegaMultiplex),
		.f (fRegaMultiplex),
		.g (gRegaMultiplex)
	);
	
	// Instaciação do módulo multiplexador
	multiplexador mux(
	.selector(selector),
	.aR (aRegaMultiplex),
	.bR (bRegaMultiplex),
	.cR (cRegaMultiplex),
	.dR (dRegaMultiplex),
	.eR (eRegaMultiplex),
	.fR (fRegaMultiplex),
	.gR (gRegaMultiplex),
	.aN (aNivelMultiplex),
	.bN (bNivelMultiplex),
	.cN (cNivelMultiplex),
	.dN (dNivelMultiplex),
	.eN (eNivelMultiplex),
	.fN (fNivelMultiplex),
	.gN (gNivelMultiplex),
	.a (a),
	.b (b),
	.c (c),
	.d (d),
	.e (e),
	.f (f),
	.g (g)
	);
	
endmodule
