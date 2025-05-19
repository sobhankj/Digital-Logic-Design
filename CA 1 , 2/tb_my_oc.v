`timescale 1ns/1ns
module octb ();
	reg aa = 0 , bb = 0 , cc = 0;
	wire ss , ccoo , ss1 , ccoo1 , ss2 , ccoo2;
	my_oc OC(aa , bb , cc , ss , ccoo);
	my_oc_per OC_PER(aa , bb , cc , ss1 , ccoo1);
	my_oc_as OC_AS(aa , bb , cc , ss2 , ccoo2);
	initial begin
	#140 aa = 1;
	#130 bb = 1;
	#120 cc = 1;
	#150 bb = 0;
	#100 aa = 0;
	#200 $stop;
	end
endmodule