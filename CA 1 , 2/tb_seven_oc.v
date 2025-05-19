`timescale 1ns/1ns
module octb_seven ();
	reg aa0 = 0 , aa1 = 0 , aa2 = 0 , aa3 = 0 , aa4 = 0 , aa5 = 0 , aa6 = 0;
	wire ss11 , ss12 , ss13 , ss21 , ss22 , ss23;
	seven_oc OC(aa0 , aa1 , aa2 , aa3 , aa4 , aa5 , aa6 , ss11 , ss12 , ss13);
	seven_oc_as OC_as(aa0 , aa1 , aa2 , aa3 , aa4 , aa5 , aa6 , ss21 , ss22 , ss23);
	initial begin
	#240 aa0 = 1;
	#230 aa3 = 1;
	#220 aa4 = 1;
	#250 aa5 = 1;
	#280 aa0 = 0;
	#270 aa2 = 1;
	#285 aa6 = 1;
	#290 aa2 = 0;
	#295 aa3 = 0;
	#275 aa4 = 0;
	#300 aa5 = 0;
	#295 aa2 = 1;
	#400 $stop;
	end
endmodule