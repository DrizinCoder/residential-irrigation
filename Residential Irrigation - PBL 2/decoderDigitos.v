module decoderDigitos(h, m, l, As, Gt, _C_, pulse, wireAnd11, wireAnd12, wireAnd13, wireAnd14, wireAnd15, wireAnd16, wireAnd17, wireAnd18, wireAnd19, wireAnd20, wireAnd21, wireAnd22);
	
	// Declaraçao de entradas e saidas
	input h, m, l, As, Gt, pulse, _C_;
	output wireAnd11, wireAnd12, wireAnd13, wireAnd14, wireAnd15, wireAnd16, wireAnd17, wireAnd18, wireAnd19, wireAnd20, wireAnd21, wireAnd22;
	
	// Declaraçao de fios intermediarios
	wire h_, m_, l_, As_, Gt_, Cbar;
	wire wireAnd0, wireAnd1, wireAnd2, wireAnd3, wireAnd4, wireAnd5, wireAnd6, wireAnd7, wireAnd8, wireAnd9, wireAnd10;
	wire wireOr0, wireOr1, wireOr2, wireOr3, wireOr4, wireOr5, wireOr6;
	
	// Logica do decoder
	not not0 (h_, h);
	not not1 (m_, m);
	not not2 (l_, l);
	not not3 (As_, As);
	not not4 (Gt_, Gt);
	not not5 (Cbar, _C_);
	
	and and0 (wireAnd0, m, As_);
	and and1 (wireAnd1, m_, As_);
	and and2 (wireAnd2, m, Gt_);
	and and3 (wireAnd3, m_, Gt_);
	and and4 (wireAnd4, h_, m, As_);
	and and5 (wireAnd5, m_, Gt_);
	and and6 (wireAnd6, h, Gt_);
	and and7 (wireAnd7, h_, m);
	and and8 (wireAnd8, m_, Gt_);
	and and9 (wireAnd9, h, Gt_);
	and and10 (wireAnd10, h_, m);
	
	or or0 (wireOr0, m_, Gt_);
	or or1 (wireOr1, wireAnd1, wireAnd2, h);
	or or2 (wireOr2, wireAnd3, wireAnd4);
	or or3 (wireOr3, wireAnd5, wireAnd6);
	or or4 (wireOr4, As_, wireAnd7);
	or or5 (wireOr5, wireAnd8, wireAnd9);
	or or6 (wireOr6, wireAnd10, As_);
	
	// Saida do set e reset
	and and11(wireAnd11, pulse, wireAnd0);
	and and12(wireAnd12, pulse, wireOr0);
	and and13(wireAnd13, pulse, wireOr1);
	and and14(wireAnd14, pulse, wireOr2);
	and and15(wireAnd15, pulse, Cbar);
	and and16(wireAnd16, pulse, _C_);
	and and17(wireAnd17, pulse, wireOr3);
	and and18(wireAnd18, pulse, wireOr4);
	and and19(wireAnd19, pulse, Cbar);
	and and20(wireAnd20, pulse, _C_);
	and and21(wireAnd21, pulse, wireOr5);
	and and22(wireAnd22, pulse, wireOr6);
	
	
endmodule
