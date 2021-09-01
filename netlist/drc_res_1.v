



module drc_res_1 (NEG, POS);
    inout NEG;
    inout POS;
    
    PRES res_1_1 (.PRES(POS));
    PRES res_1_3 (.PRES(NEG));
    PRES2 res_1_2 ();

endmodule 


