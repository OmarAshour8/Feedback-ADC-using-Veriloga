// VerilogA for GradProject, feedback_ADC, veriloga

`include "constants.vams"
`include "disciplines.vams"

module feedback_ADC (Vp,Vn,vdd,gnd,itv,Eu0,Eu1,Eu2,Eu3,Eu4,Eu5,Ed0,Ed1,Ed2,Ed3,Ed4,Ed5,Ed6,Ed7);

input Vp,Vn,itv;
output Eu0,Eu1,Eu2,Eu3,Eu4,Eu5,Ed0,Ed1,Ed2,Ed3,Ed4,Ed5,Ed6,Ed7;
inout vdd,gnd;
electrical Vp,Vn,vdd,gnd,itv,Eu0,Eu1,Eu2,Eu3,Eu4,Eu5,Ed0,Ed1,Ed2,Ed3,Ed4,Ed5,Ed6,Ed7;
//parameter real trise = 0;
//parameter real tfall = 0;
parameter real td = 0;
parameter real period = 100p;
real Vdiff,Vu[0:5],Vd[0:7],vp,vn,i,vs,gs;
analog begin
	@(initial_step) begin
		Vu[0]=V(vdd);
		Vu[1]=V(vdd);
		Vu[2]=V(vdd);
		Vu[3]=V(gnd);
		Vu[4]=V(gnd);
		Vu[5]=V(gnd);
		Vd[0]=V(gnd);
		Vd[1]=V(gnd);
		Vd[2]=V(gnd);
		Vd[3]=V(vdd);
		Vd[4]=V(vdd);
		Vd[5]=V(vdd);
		Vd[6]=V(vdd);
		Vd[7]=V(vdd);
	end
	@(timer(td,period)) begin
		Vdiff = V(Vp)-V(Vn);
		vp = V(Vp);
		vn = V(Vn);
		i = V(itv);
		vs = V(vdd);
		gs = V(gnd);
		if(Vdiff >= 0) begin
			if(Vu[0] == gs && Vu[1] == gs && Vu[2] == gs && Vu[3] == gs && Vu[4] == gs && Vu[5] == gs) begin
				if((vs-vp)/i >= 52.3) begin
					Vu[0] = vs;
					Vu[1] = gs;
					Vu[2] = gs;
					Vu[3] = gs;
					Vu[4] = gs;
					Vu[5] = gs;
				end
				else begin
					Vu[0] = gs;
					Vu[1] = gs;
					Vu[2] = gs;
					Vu[3] = gs;
					Vu[4] = gs;
					Vu[5] = gs;
				end
			end
			else if(Vu[0] == vs && Vu[1] == gs && Vu[2] == gs && Vu[3] == gs && Vu[4] == gs && Vu[5] == gs) begin
				if((vs-vp)/i > 52.0909) begin
					Vu[0] = vs;
					Vu[1] = vs;
					Vu[2] = gs;
					Vu[3] = gs;
					Vu[4] = gs;
					Vu[5] = gs;
				end
				else if((vs-vp)/i <= 47.6363) begin
					Vu[0] = gs;
					Vu[1] = gs;
					Vu[2] = gs;
					Vu[3] = gs;
					Vu[4] = gs;
					Vu[5] = gs;
				end
				else begin
					Vu[0] = vs;
					Vu[1] = gs;
					Vu[2] = gs;
					Vu[3] = gs;
					Vu[4] = gs;
					Vu[5] = gs;
				end
			end
			else if(Vu[0] == vs && Vu[1] == vs && Vu[2] == gs && Vu[3] == gs && Vu[4] == gs && Vu[5] == gs) begin
				if((vs-vp)/i > 52) begin
					Vu[0] = vs;
					Vu[1] = vs;
					Vu[2] = vs;
					Vu[3] = gs;
					Vu[4] = gs;
					Vu[5] = gs;
				end
				else if((vs-vp)/i <= 47.833) begin
					Vu[0] = vs;
					Vu[1] = gs;
					Vu[2] = gs;
					Vu[3] = gs;
					Vu[4] = gs;
					Vu[5] = gs;
				end
				else begin
					Vu[0] = vs;
					Vu[1] = vs;
					Vu[2] = gs;
					Vu[3] = gs;
					Vu[4] = gs;
					Vu[5] = gs;
				end
			end
			else if(Vu[0] == vs && Vu[1] == vs && Vu[2] == vs && Vu[3] == gs && Vu[4] == gs && Vu[5] == gs) begin
				if((vs-vp)/i > 51.846) begin
					Vu[0] = vs;
					Vu[1] = vs;
					Vu[2] = vs;
					Vu[3] = vs;
					Vu[4] = gs;
					Vu[5] = gs;
				end
				else if((vs-vp)/i <= 48.077) begin
					Vu[0] = vs;
					Vu[1] = vs;
					Vu[2] = gs;
					Vu[3] = gs;
					Vu[4] = gs;
					Vu[5] = gs;
				end
				else begin
					Vu[0] = vs;
					Vu[1] = vs;
					Vu[2] = vs;
					Vu[3] = gs;
					Vu[4] = gs;
					Vu[5] = gs;
				end
			end
			else if(Vu[0] == vs && Vu[1] == vs && Vu[2] == vs && Vu[3] == vs && Vu[4] == gs && Vu[5] == gs) begin
				if((vs-vp)/i > 51.714) begin
					Vu[0] = vs;
					Vu[1] = vs;
					Vu[2] = vs;
					Vu[3] = vs;
					Vu[4] = vs;
					Vu[5] = gs;
				end
				else if((vs-vp)/i <= 48.214) begin
					Vu[0] = vs;
					Vu[1] = vs;
					Vu[2] = vs;
					Vu[3] = gs;
					Vu[4] = gs;
					Vu[5] = gs;
				end
				else begin
					Vu[0] = vs;
					Vu[1] = vs;
					Vu[2] = vs;
					Vu[3] = vs;
					Vu[4] = gs;
					Vu[5] = gs;
				end
			end
			else if(Vu[0] == vs && Vu[1] == vs && Vu[2] == vs && Vu[3] == vs && Vu[4] == vs && Vu[5] == gs) begin
				if((vs-vp)/i > 51.6) begin
					Vu[0] = vs;
					Vu[1] = vs;
					Vu[2] = vs;
					Vu[3] = vs;
					Vu[4] = vs;
					Vu[5] = vs;
				end
				else if((vs-vp)/i <= 48.333) begin
					Vu[0] = vs;
					Vu[1] = vs;
					Vu[2] = vs;
					Vu[3] = vs;
					Vu[4] = gs;
					Vu[5] = gs;
				end
				else begin
					Vu[0] = vs;
					Vu[1] = vs;
					Vu[2] = vs;
					Vu[3] = vs;
					Vu[4] = vs;
					Vu[5] = gs;
				end
			end
			else if(Vu[0] == vs && Vu[1] == vs && Vu[2] == vs && Vu[3] == vs && Vu[4] == vs && Vu[5] == vs) begin
				if((vs-vp)/i <= 48.4375) begin
					Vu[0] = vs;
					Vu[1] = vs;
					Vu[2] = vs;
					Vu[3] = vs;
					Vu[4] = vs;
					Vu[5] = gs;
				end
				else begin
					Vu[0] = vs;
					Vu[1] = vs;
					Vu[2] = vs;
					Vu[3] = vs;
					Vu[4] = vs;
					Vu[5] = vs;
				end
			end				// end of pull up network calibration in case of 1 is being sent
			if(Vd[0] == vs && Vd[1] == vs && Vd[2] == vs && Vd[3] == vs && Vd[4] == vs && Vd[5] == vs && Vd[6] == vs && Vd[7] == vs) begin
				if(vn/i >= 52.3) begin
					Vd[0] = gs;
					Vd[1] = vs;
					Vd[2] = vs;
					Vd[3] = vs;
					Vd[4] = vs;
					Vd[5] = vs;
					Vd[6] = vs;
					Vd[7] = vs;
				end
				else begin
					Vd[0] = vs;
					Vd[1] = vs;
					Vd[2] = vs;
					Vd[3] = vs;
					Vd[4] = vs;
					Vd[5] = vs;
					Vd[6] = vs;
					Vd[7] = vs;
				end
			end
			else if(Vd[0] == gs && Vd[1] == vs && Vd[2] == vs && Vd[3] == vs && Vd[4] == vs && Vd[5] == vs && Vd[6] == vs && Vd[7] == vs) begin
				if(vn/i > 52.0909) begin
					Vd[0] = gs;
					Vd[1] = gs;
					Vd[2] = vs;
					Vd[3] = vs;
					Vd[4] = vs;
					Vd[5] = vs;
					Vd[6] = vs;
					Vd[7] = vs;
				end
				else if(vn/i <= 47.6363) begin
					Vd[0] = vs;
					Vd[1] = vs;
					Vd[2] = vs;
					Vd[3] = vs;
					Vd[4] = vs;
					Vd[5] = vs;
					Vd[6] = vs;
					Vd[7] = vs;
				end
				else begin
					Vd[0] = gs;
					Vd[1] = vs;
					Vd[2] = vs;
					Vd[3] = vs;
					Vd[4] = vs;
					Vd[5] = vs;
					Vd[6] = vs;
					Vd[7] = vs;
				end
			end
			else if(Vd[0] == gs && Vd[1] == gs && Vd[2] == vs && Vd[3] == vs && Vd[4] == vs && Vd[5] == vs && Vd[6] == vs && Vd[7] == vs) begin
				if(vn/i > 52) begin
					Vd[0] = gs;
					Vd[1] = gs;
					Vd[2] = gs;
					Vd[3] = vs;
					Vd[4] = vs;
					Vd[5] = vs;
					Vd[6] = vs;
					Vd[7] = vs;
				end
				else if(vn/i <= 47.833) begin
					Vd[0] = gs;
					Vd[1] = vs;
					Vd[2] = vs;
					Vd[3] = vs;
					Vd[4] = vs;
					Vd[5] = vs;
					Vd[6] = vs;
					Vd[7] = vs;
				end
				else begin
					Vd[0] = gs;
					Vd[1] = gs;
					Vd[2] = vs;
					Vd[3] = vs;
					Vd[4] = vs;
					Vd[5] = vs;
					Vd[6] = vs;
					Vd[7] = vs;
				end
			end
			else if(Vd[0] == gs && Vd[1] == gs && Vd[2] == gs && Vd[3] == vs && Vd[4] == vs && Vd[5] == vs && Vd[6] == vs && Vd[7] == vs) begin
				if(vn/i > 51.846) begin
					Vd[0] = gs;
					Vd[1] = gs;
					Vd[2] = gs;
					Vd[3] = gs;
					Vd[4] = vs;
					Vd[5] = vs;
					Vd[6] = vs;
					Vd[7] = vs;
				end
				else if(vn/i < 48.077) begin
					Vd[0] = gs;
					Vd[1] = gs;
					Vd[2] = vs;
					Vd[3] = vs;
					Vd[4] = vs;
					Vd[5] = vs;
					Vd[6] = vs;
					Vd[7] = vs;
				end
				else begin
					Vd[0] = gs;
					Vd[1] = gs;
					Vd[2] = gs;
					Vd[3] = vs;
					Vd[4] = vs;
					Vd[5] = vs;
					Vd[6] = vs;
					Vd[7] = vs;
				end
			end
			else if(Vd[0] == gs && Vd[1] == gs && Vd[2] == gs && Vd[3] == gs && Vd[4] == vs && Vd[5] == vs && Vd[6] == vs && Vd[7] == vs) begin
				if(vn/i > 51.714) begin
					Vd[0] = gs;
					Vd[1] = gs;
					Vd[2] = gs;
					Vd[3] = gs;
					Vd[4] = gs;
					Vd[5] = vs;
					Vd[6] = vs;
					Vd[7] = vs;
				end
				else if(vn/i < 48.214) begin
					Vd[0] = gs;
					Vd[1] = gs;
					Vd[2] = gs;
					Vd[3] = vs;
					Vd[4] = vs;
					Vd[5] = vs;
					Vd[6] = vs;
					Vd[7] = vs;
				end
				else begin
					Vd[0] = gs;
					Vd[1] = gs;
					Vd[2] = gs;
					Vd[3] = gs;
					Vd[4] = vs;
					Vd[5] = vs;
					Vd[6] = vs;
					Vd[7] = vs;
				end
			end
			else if(Vd[0] == gs && Vd[1] == gs && Vd[2] == gs && Vd[3] == gs && Vd[4] == gs && Vd[5] == vs && Vd[6] == vs && Vd[7] == vs) begin
				if(vn/i > 51.6) begin
					Vd[0] = gs;
					Vd[1] = gs;
					Vd[2] = gs;
					Vd[3] = gs;
					Vd[4] = gs;
					Vd[5] = gs;
					Vd[6] = vs;
					Vd[7] = vs;
				end
				else if(vn/i < 48.333) begin
					Vd[0] = gs;
					Vd[1] = gs;
					Vd[2] = gs;
					Vd[3] = gs;
					Vd[4] = vs;
					Vd[5] = vs;
					Vd[6] = vs;
					Vd[7] = vs;
				end
				else begin
					Vd[0] = gs;
					Vd[1] = gs;
					Vd[2] = gs;
					Vd[3] = gs;
					Vd[4] = gs;
					Vd[5] = vs;
					Vd[6] = vs;
					Vd[7] = vs;
				end
			end
			else if(Vd[0] == gs && Vd[1] == gs && Vd[2] == gs && Vd[3] == gs && Vd[4] == gs && Vd[5] == gs && Vd[6] == vs && Vd[7] == vs) begin
				if(vn/i > 51.5) begin
					Vd[0] = gs;
					Vd[1] = gs;
					Vd[2] = gs;
					Vd[3] = gs;
					Vd[4] = gs;
					Vd[5] = gs;
					Vd[6] = gs;
					Vd[7] = vs;
				end
				else if(vn/i < 48.4375) begin
					Vd[0] = gs;
					Vd[1] = gs;
					Vd[2] = gs;
					Vd[3] = gs;
					Vd[4] = gs;
					Vd[5] = vs;
					Vd[6] = vs;
					Vd[7] = vs;
				end
				else begin
					Vd[0] = gs;
					Vd[1] = gs;
					Vd[2] = gs;
					Vd[3] = gs;
					Vd[4] = gs;
					Vd[5] = gs;
					Vd[6] = vs;
					Vd[7] = vs;
				end
			end
			else if(Vd[0] == gs && Vd[1] == gs && Vd[2] == gs && Vd[3] == gs && Vd[4] == gs && Vd[5] == gs && Vd[6] == gs && Vd[7] == vs) begin
				if(vn/i > 51.411) begin
					Vd[0] = gs;
					Vd[1] = gs;
					Vd[2] = gs;
					Vd[3] = gs;
					Vd[4] = gs;
					Vd[5] = gs;
					Vd[6] = gs;
					Vd[7] = gs;
				end
				else if(vn/i < 48.529) begin
					Vd[0] = gs;
					Vd[1] = gs;
					Vd[2] = gs;
					Vd[3] = gs;
					Vd[4] = gs;
					Vd[5] = gs;
					Vd[6] = vs;
					Vd[7] = vs;
				end
				else begin
					Vd[0] = gs;
					Vd[1] = gs;
					Vd[2] = gs;
					Vd[3] = gs;
					Vd[4] = gs;
					Vd[5] = gs;
					Vd[6] = gs;
					Vd[7] = vs;
				end
			end
			else if(Vd[0] == gs && Vd[1] == gs && Vd[2] == gs && Vd[3] == gs && Vd[4] == gs && Vd[5] == gs && Vd[6] == gs && Vd[7] == gs) begin
				if(vn/i < 48.611) begin
					Vd[0] = gs;
					Vd[1] = gs;
					Vd[2] = gs;
					Vd[3] = gs;
					Vd[4] = gs;
					Vd[5] = gs;
					Vd[6] = gs;
					Vd[7] = vs;
				end
				else begin
					Vd[0] = gs;
					Vd[1] = gs;
					Vd[2] = gs;
					Vd[3] = gs;
					Vd[4] = gs;
					Vd[5] = gs;
					Vd[6] = gs;
					Vd[7] = gs;
				end
			end
		end

//End of case of 1 is being sent

		if(Vdiff < 0) begin
			if(Vu[0] == gs && Vu[1] == gs && Vu[2] == gs && Vu[3] == gs && Vu[4] == gs && Vu[5] == gs) begin
				if((vs-vn)/i > 52.3) begin
					Vu[0] = vs;
					Vu[1] = gs;
					Vu[2] = gs;
					Vu[3] = gs;
					Vu[4] = gs;
					Vu[5] = gs;
				end
				else begin
					Vu[0] = gs;
					Vu[1] = gs;
					Vu[2] = gs;
					Vu[3] = gs;
					Vu[4] = gs;
					Vu[5] = gs;
				end
			end
			else if(Vu[0] == vs && Vu[1] == gs && Vu[2] == gs && Vu[3] == gs && Vu[4] == gs && Vu[5] == gs) begin
				if((vs-vn)/i > 52.0909) begin
					Vu[0] = vs;
					Vu[1] = vs;
					Vu[2] = gs;
					Vu[3] = gs;
					Vu[4] = gs;
					Vu[5] = gs;
				end
				else if((vs-vn)/i < 47.6363) begin
					Vu[0] = gs;
					Vu[1] = gs;
					Vu[2] = gs;
					Vu[3] = gs;
					Vu[4] = gs;
					Vu[5] = gs;
				end
				else begin
					Vu[0] = vs;
					Vu[1] = gs;
					Vu[2] = gs;
					Vu[3] = gs;
					Vu[4] = gs;
					Vu[5] = gs;
				end
			end
			else if(Vu[0] == vs && Vu[1] == vs && Vu[2] == gs && Vu[3] == gs && Vu[4] == gs && Vu[5] == gs) begin
				if((vs-vn)/i > 52) begin
					Vu[0] = vs;
					Vu[1] = vs;
					Vu[2] = vs;
					Vu[3] = gs;
					Vu[4] = gs;
					Vu[5] = gs;
				end
				else if((vs-vn)/i < 47.833) begin
					Vu[0] = vs;
					Vu[1] = gs;
					Vu[2] = gs;
					Vu[3] = gs;
					Vu[4] = gs;
					Vu[5] = gs;
				end
				else begin
					Vu[0] = vs;
					Vu[1] = vs;
					Vu[2] = gs;
					Vu[3] = gs;
					Vu[4] = gs;
					Vu[5] = gs;
				end
			end
			else if(Vu[0] == vs && Vu[1] == vs && Vu[2] == vs && Vu[3] == gs && Vu[4] == gs && Vu[5] == gs) begin
				if((vs-vn)/i > 51.846) begin
					Vu[0] = vs;
					Vu[1] = vs;
					Vu[2] = vs;
					Vu[3] = vs;
					Vu[4] = gs;
					Vu[5] = gs;
				end
				else if((vs-vn)/i < 48.077) begin
					Vu[0] = vs;
					Vu[1] = vs;
					Vu[2] = gs;
					Vu[3] = gs;
					Vu[4] = gs;
					Vu[5] = gs;
				end
				else begin
					Vu[0] = vs;
					Vu[1] = vs;
					Vu[2] = vs;
					Vu[3] = gs;
					Vu[4] = gs;
					Vu[5] = gs;
				end
			end
			else if(Vu[0] == vs && Vu[1] == vs && Vu[2] == vs && Vu[3] == vs && Vu[4] == gs && Vu[5] == gs) begin
				if((vs-vn)/i > 51.714) begin
					Vu[0] = vs;
					Vu[1] = vs;
					Vu[2] = vs;
					Vu[3] = vs;
					Vu[4] = vs;
					Vu[5] = gs;
				end
				else if((vs-vn)/i < 48.214) begin
					Vu[0] = vs;
					Vu[1] = vs;
					Vu[2] = vs;
					Vu[3] = gs;
					Vu[4] = gs;
					Vu[5] = gs;
				end
				else begin
					Vu[0] = vs;
					Vu[1] = vs;
					Vu[2] = vs;
					Vu[3] = vs;
					Vu[4] = gs;
					Vu[5] = gs;
				end
			end
			else if(Vu[0] == vs && Vu[1] == vs && Vu[2] == vs && Vu[3] == vs && Vu[4] == vs && Vu[5] == gs) begin
				if((vs-vn)/i > 51.6) begin
					Vu[0] = vs;
					Vu[1] = vs;
					Vu[2] = vs;
					Vu[3] = vs;
					Vu[4] = vs;
					Vu[5] = vs;
				end
				else if((vs-vn)/i < 48.333) begin
					Vu[0] = vs;
					Vu[1] = vs;
					Vu[2] = vs;
					Vu[3] = vs;
					Vu[4] = gs;
					Vu[5] = gs;
				end
				else begin
					Vu[0] = vs;
					Vu[1] = vs;
					Vu[2] = vs;
					Vu[3] = vs;
					Vu[4] = vs;
					Vu[5] = gs;
				end
			end
			else if(Vu[0] == vs && Vu[1] == vs && Vu[2] == vs && Vu[3] == vs && Vu[4] == vs && Vu[5] == vs) begin
				if((vs-vn)/i < 48.4375) begin
					Vu[0] = vs;
					Vu[1] = vs;
					Vu[2] = vs;
					Vu[3] = vs;
					Vu[4] = vs;
					Vu[5] = gs;
				end
				else begin
					Vu[0] = vs;
					Vu[1] = vs;
					Vu[2] = vs;
					Vu[3] = vs;
					Vu[4] = vs;
					Vu[5] = vs;
				end
			end				// end of pull up network calibration in case of 0 is being sent
			if(Vd[0] == vs && Vd[1] == vs && Vd[2] == vs && Vd[3] == vs && Vd[4] == vs && Vd[5] == vs && Vd[6] == vs && Vd[7] == vs) begin
				if(vp/i > 52.3) begin
					Vd[0] = gs;
					Vd[1] = vs;
					Vd[2] = vs;
					Vd[3] = vs;
					Vd[4] = vs;
					Vd[5] = vs;
					Vd[6] = vs;
					Vd[7] = vs;
				end
				else begin
					Vd[0] = vs;
					Vd[1] = vs;
					Vd[2] = vs;
					Vd[3] = vs;
					Vd[4] = vs;
					Vd[5] = vs;
					Vd[6] = vs;
					Vd[7] = vs;
				end
			end
			else if(Vd[0] == gs && Vd[1] == vs && Vd[2] == vs && Vd[3] == vs && Vd[4] == vs && Vd[5] == vs && Vd[6] == vs && Vd[7] == vs) begin
				if(vp/i > 52.0909) begin
					Vd[0] = gs;
					Vd[1] = gs;
					Vd[2] = vs;
					Vd[3] = vs;
					Vd[4] = vs;
					Vd[5] = vs;
					Vd[6] = vs;
					Vd[7] = vs;
				end
				else if(vp/i < 47.6363) begin
					Vd[0] = vs;
					Vd[1] = vs;
					Vd[2] = vs;
					Vd[3] = vs;
					Vd[4] = vs;
					Vd[5] = vs;
					Vd[6] = vs;
					Vd[7] = vs;
				end
				else begin
					Vd[0] = gs;
					Vd[1] = vs;
					Vd[2] = vs;
					Vd[3] = vs;
					Vd[4] = vs;
					Vd[5] = vs;
					Vd[6] = vs;
					Vd[7] = vs;
				end
			end
			else if(Vd[0] == gs && Vd[1] == gs && Vd[2] == vs && Vd[3] == vs && Vd[4] == vs && Vd[5] == vs && Vd[6] == vs && Vd[7] == vs) begin
				if(vp/i > 52) begin
					Vd[0] = gs;
					Vd[1] = gs;
					Vd[2] = gs;
					Vd[3] = vs;
					Vd[4] = vs;
					Vd[5] = vs;
					Vd[6] = vs;
					Vd[7] = vs;
				end
				else if(vp/i < 47.833) begin
					Vd[0] = gs;
					Vd[1] = vs;
					Vd[2] = vs;
					Vd[3] = vs;
					Vd[4] = vs;
					Vd[5] = vs;
					Vd[6] = vs;
					Vd[7] = vs;
				end
				else begin
					Vd[0] = gs;
					Vd[1] = gs;
					Vd[2] = vs;
					Vd[3] = vs;
					Vd[4] = vs;
					Vd[5] = vs;
					Vd[6] = vs;
					Vd[7] = vs;
				end
			end
			else if(Vd[0] == gs && Vd[1] == gs && Vd[2] == gs && Vd[3] == vs && Vd[4] == vs && Vd[5] == vs && Vd[6] == vs && Vd[7] == vs) begin
				if(vp/i > 51.846) begin
					Vd[0] = gs;
					Vd[1] = gs;
					Vd[2] = gs;
					Vd[3] = gs;
					Vd[4] = vs;
					Vd[5] = vs;
					Vd[6] = vs;
					Vd[7] = vs;
				end
				else if(vp/i < 48.077) begin
					Vd[0] = gs;
					Vd[1] = gs;
					Vd[2] = vs;
					Vd[3] = vs;
					Vd[4] = vs;
					Vd[5] = vs;
					Vd[6] = vs;
					Vd[7] = vs;
				end
				else begin
					Vd[0] = gs;
					Vd[1] = gs;
					Vd[2] = gs;
					Vd[3] = vs;
					Vd[4] = vs;
					Vd[5] = vs;
					Vd[6] = vs;
					Vd[7] = vs;
				end
			end
			else if(Vd[0] == gs && Vd[1] == gs && Vd[2] == gs && Vd[3] == gs && Vd[4] == vs && Vd[5] == vs && Vd[6] == vs && Vd[7] == vs) begin
				if(vp/i > 51.714) begin
					Vd[0] = gs;
					Vd[1] = gs;
					Vd[2] = gs;
					Vd[3] = gs;
					Vd[4] = gs;
					Vd[5] = vs;
					Vd[6] = vs;
					Vd[7] = vs;
				end
				else if(vp/i < 48.214) begin
					Vd[0] = gs;
					Vd[1] = gs;
					Vd[2] = gs;
					Vd[3] = vs;
					Vd[4] = vs;
					Vd[5] = vs;
					Vd[6] = vs;
					Vd[7] = vs;
				end
				else begin
					Vd[0] = gs;
					Vd[1] = gs;
					Vd[2] = gs;
					Vd[3] = gs;
					Vd[4] = vs;
					Vd[5] = vs;
					Vd[6] = vs;
					Vd[7] = vs;
				end
			end
			else if(Vd[0] == gs && Vd[1] == gs && Vd[2] == gs && Vd[3] == gs && Vd[4] == gs && Vd[5] == vs && Vd[6] == vs && Vd[7] == vs) begin
				if(vp/i > 51.6) begin
					Vd[0] = gs;
					Vd[1] = gs;
					Vd[2] = gs;
					Vd[3] = gs;
					Vd[4] = gs;
					Vd[5] = gs;
					Vd[6] = vs;
					Vd[7] = vs;
				end
				else if(vp/i < 48.333) begin
					Vd[0] = gs;
					Vd[1] = gs;
					Vd[2] = gs;
					Vd[3] = gs;
					Vd[4] = vs;
					Vd[5] = vs;
					Vd[6] = vs;
					Vd[7] = vs;
				end
				else begin
					Vd[0] = gs;
					Vd[1] = gs;
					Vd[2] = gs;
					Vd[3] = gs;
					Vd[4] = gs;
					Vd[5] = vs;
					Vd[6] = vs;
					Vd[7] = vs;
				end
			end
			else if(Vd[0] == gs && Vd[1] == gs && Vd[2] == gs && Vd[3] == gs && Vd[4] == gs && Vd[5] == gs && Vd[6] == vs && Vd[7] == vs) begin
				if(vp/i > 51.5) begin
					Vd[0] = gs;
					Vd[1] = gs;
					Vd[2] = gs;
					Vd[3] = gs;
					Vd[4] = gs;
					Vd[5] = gs;
					Vd[6] = gs;
					Vd[7] = vs;
				end
				else if(vp/i < 48.4375) begin
					Vd[0] = gs;
					Vd[1] = gs;
					Vd[2] = gs;
					Vd[3] = gs;
					Vd[4] = gs;
					Vd[5] = vs;
					Vd[6] = vs;
					Vd[7] = vs;
				end
				else begin
					Vd[0] = gs;
					Vd[1] = gs;
					Vd[2] = gs;
					Vd[3] = gs;
					Vd[4] = gs;
					Vd[5] = gs;
					Vd[6] = vs;
					Vd[7] = vs;
				end
			end
			else if(Vd[0] == gs && Vd[1] == gs && Vd[2] == gs && Vd[3] == gs && Vd[4] == gs && Vd[5] == gs && Vd[6] == gs && Vd[7] == vs) begin
				if(vp/i > 51.411) begin
					Vd[0] = gs;
					Vd[1] = gs;
					Vd[2] = gs;
					Vd[3] = gs;
					Vd[4] = gs;
					Vd[5] = gs;
					Vd[6] = gs;
					Vd[7] = gs;
				end
				else if(vp/i < 48.529) begin
					Vd[0] = gs;
					Vd[1] = gs;
					Vd[2] = gs;
					Vd[3] = gs;
					Vd[4] = gs;
					Vd[5] = gs;
					Vd[6] = vs;
					Vd[7] = vs;
				end
				else begin
					Vd[0] = gs;
					Vd[1] = gs;
					Vd[2] = gs;
					Vd[3] = gs;
					Vd[4] = gs;
					Vd[5] = gs;
					Vd[6] = gs;
					Vd[7] = vs;
				end
			end
			else if(Vd[0] == gs && Vd[1] == gs && Vd[2] == gs && Vd[3] == gs && Vd[4] == gs && Vd[5] == gs && Vd[6] == gs && Vd[7] == gs) begin
				if(vp/i < 48.611) begin
					Vd[0] = gs;
					Vd[1] = gs;
					Vd[2] = gs;
					Vd[3] = gs;
					Vd[4] = gs;
					Vd[5] = gs;
					Vd[6] = gs;
					Vd[7] = vs;
				end
				else begin
					Vd[0] = gs;
					Vd[1] = gs;
					Vd[2] = gs;
					Vd[3] = gs;
					Vd[4] = gs;
					Vd[5] = gs;
					Vd[6] = gs;
					Vd[7] = gs;
				end
			end
		end
	end
	V(Eu0) <+ Vu[0];
	V(Eu1) <+ Vu[1];
	V(Eu2) <+ Vu[2];
	V(Eu3) <+ Vu[3];
	V(Eu4) <+ Vu[4];
	V(Eu5) <+ Vu[5];
	V(Ed0) <+ Vd[0];
	V(Ed1) <+ Vd[1];
	V(Ed2) <+ Vd[2];
	V(Ed3) <+ Vd[3];
	V(Ed4) <+ Vd[4];
	V(Ed5) <+ Vd[5];
	V(Ed6) <+ Vd[6];
	V(Ed7) <+ Vd[7];
end

endmodule
		