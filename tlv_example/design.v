`line 2 "design.tlv" 0 //_\TLV_version 1d: tl-x.org, generated by SandPiper(TM) 1.14-2022/10/10-beta-Pro
`line 9 "design.tlv" 1
//_\SV
	`include "sqrt32.v";
   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
   module top(input wire clk, input wire reset, input wire [31:0] cyc_cnt, output wire passed, output wire failed);    /* verilator lint_save */ /* verilator lint_off UNOPTFLAT */  bit [256:0] RW_rand_raw; bit [256+63:0] RW_rand_vect; pseudo_rand #(.WIDTH(257)) pseudo_rand (clk, reset, RW_rand_raw[256:0]); assign RW_rand_vect[256+63:0] = {RW_rand_raw[62:0], RW_rand_raw};  /* verilator lint_restore */  /* verilator lint_off WIDTH */ /* verilator lint_off UNOPTFLAT */   // (Expanded in Nav-TLV pane.)
`include "design_gen.v" //_\TLV
   assign L0_reset_a0 = reset;

   assign L0_a_a0[7:0] = L0_rand1_a0[3:0];
   assign L0_b_a0[7:0] = L0_rand2_a0[3:0];

   //_|calc
      //_@0
         assign CALC_aa_a0[7:0] = CALC_a_a0[7:0] * CALC_a_a0[7:0];
         assign CALC_bb_a0[7:0] = CALC_b_a0[7:0] * CALC_b_a0[7:0];
      //_@1
         assign CALC_c_a1[7:0] = CALC_aa_a1 + CALC_bb_a1;
      //_@2
         assign CALC_out_a2[7:0] = sqrt(CALC_c_a2);

   // Assert these to end simulation (before Makerchip cycle limit).
   assign passed = cyc_cnt > 40;
   assign failed = 1'b0;
//_\SV
   endmodule


// Undefine macros defined by SandPiper (in "design_gen.v").
`undef BOGUS_USE