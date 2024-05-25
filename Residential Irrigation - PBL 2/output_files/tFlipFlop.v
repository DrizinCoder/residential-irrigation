module tFlipFlop(clear, CLK, T, Q, Q_);
	
	input clear, CLK, T;
	output reg Q;
	output Q_;
	
	assign Q_ = !Q;
	
	always @(posedge CLK) begin
	
		if (clear) begin
			Q <= 0;
			
		end else if (T) begin
			Q <= ~Q;
		end
		
	end

endmodule
