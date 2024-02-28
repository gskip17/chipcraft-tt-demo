\m5_TLV_version 1d: tl-x.org
\m5
   
   // =================================================
   // Welcome!  New to Makerchip? Try the "Learn" menu.
   // =================================================
   
   //use(m5-1.0)   /// uncomment to use M5 macro library.
\SV
	`include "sqrt32.v";
   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
   m5_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   $reset = *reset;
   
   $a[7:0] = $rand1[3:0];
   $b[7:0] = $rand2[3:0];
   
   |calc
      @0
         $aa[7:0] = $a[7:0] * $a[7:0];
         $bb[7:0] = $b[7:0] * $b[7:0];
      @1
         $c[7:0] = $aa + $bb;
      @2
         $out[7:0] = sqrt($c);
   
   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule
