

module SAR_ADC_TOP_PAD (PAD_C, PAD_CLK, PAD_VDEL, PAD_VIN, PAD_VIP, PAD_B, PAD_READY);

    input [3:1] PAD_C;
    input PAD_CLK;
    input PAD_VDEL;
    input PAD_VIN;
    input PAD_VIP;
    output [10:0] PAD_B;
    output PAD_READY;

    wire [10:0] CORE_B;
    wire [3:1] CORE_C;
   
    wire hi;
    wire CLK;
 
    wire CORE_READY;
    wire lo;

    wire VDEL;

    wire VIN;
    wire VIP;

    drc_res_1 I0 (.NEG(PAD_CLK), .POS(CLK));
    PDDW08DGZ_G \I_8[1]  (.I(CORE_B[0]), .OEN(lo), .PAD(PAD_B[0]), .REN(lo));
    PDDW08DGZ_G \I_8[3]  (.I(CORE_B[2]), .OEN(lo), .PAD(PAD_B[2]), .REN(lo));
    PDDW08DGZ_G \I_8[2]  (.I(CORE_B[1]), .OEN(lo), .PAD(PAD_B[1]), .REN(lo));
    PDDW08DGZ_G \I_8[0]  (.I(CORE_READY), .OEN(lo), .PAD(PAD_READY), .REN(lo));
    TIEH I_2 (.Z(hi));
    TIEL I_1 (.ZN(lo));
    drc_res_2 I2 (.NEG(PAD_VIP), .POS(VIP));
    drc_res_20 I5 ();
    PDDW08DGZ_G \I_8[4]  (.I(CORE_B[3]), .OEN(lo), .PAD(PAD_B[3]), .REN(lo));
    PDDW08DGZ_G \I_8[5]  (.I(CORE_B[4]), .OEN(lo), .PAD(PAD_B[4]), .REN(lo));
    PDDW08DGZ_G \I_8[9]  (.I(CORE_B[8]), .OEN(lo), .PAD(PAD_B[8]), .REN(lo));
    PDDW08DGZ_G \I_8[8]  (.I(CORE_B[7]), .OEN(lo), .PAD(PAD_B[7]), .REN(lo));
    PDDW08DGZ_G \I_8[7]  (.I(CORE_B[6]), .OEN(lo), .PAD(PAD_B[6]), .REN(lo));
    PDDW08DGZ_G \I_8[6]  (.I(CORE_B[5]), .OEN(lo), .PAD(PAD_B[5]), .REN(lo));
    PDB3AC_G I_18 (.AIO(PAD_VIP));
    PDB3AC_G I_17 (.AIO(PAD_VIN));
    drc_res_20 I4 ();
    PDB3AC_G I_153 (.AIO(PAD_CLK));
    drc_res_2 I3 (.NEG(PAD_VIN), .POS(VIN));
    ADC_LP_01 I_0 (.B0(CORE_B[0]), .B1(CORE_B[1]), .B10(CORE_B[10]), .B2(CORE_B[2]), .B3(CORE_B[3]), .B4(CORE_B[4]), .B5(CORE_B[5]), .B6(CORE_B[6]), .B7(CORE_B[7]), .B8(CORE_B[8]), .B9(CORE_B[9]), .VIN(VIN), .VIP(VIP), .Vdel(VDEL), .C1(CORE_C[1]), .C2(CORE_C[2]), .C3(CORE_C[3]), .CLK(CLK), .READY(CORE_READY));
    PDDW08DGZ_G \I_4[3]  (.C(CORE_C[3]), .I(lo), .OEN(hi), .PAD(PAD_C[3]), .REN(lo));
    PDDW08DGZ_G \I_4[2]  (.C(CORE_C[2]), .I(lo), .OEN(hi), .PAD(PAD_C[2]), .REN(lo));
    PDDW08DGZ_G \I_4[1]  (.C(CORE_C[1]), .I(lo), .OEN(hi), .PAD(PAD_C[1]), .REN(lo));
    PDDW08DGZ_G \I_8[11]  (.I(CORE_B[10]), .OEN(lo), .PAD(PAD_B[10]), .REN(lo));
    PDDW08DGZ_G \I_8[10]  (.I(CORE_B[9]), .OEN(lo), .PAD(PAD_B[9]), .REN(lo));
    PDB3AC_G I_20 (.AIO(PAD_VDEL));
    drc_res_1 I1 (.NEG(PAD_VDEL), .POS(VDEL));
endmodule 



