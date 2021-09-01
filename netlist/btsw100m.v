module BTSW100 (
	//inout VDD, VSS // Power Supply
	input  CK,
	input  VIN,
	// inout  CAPP,CAPN,
	output VOUT

);

	wire VBST, UPIN;
	wire CAPP, CAPN;
	wire CKN, CKD;


	NSW0 smp_sw0 (.GT(VBST), .POS(VOUT), .NEG(VIN));
	NSW05 inp_sw0 (.GT(VBST), .NEG(VIN), .POS(CAPN));
	
	CKND1 ck_drv (.I(CK), .ZN(CKN));
	CKND0 ck_del (.I(CKN), .ZN(CKD));
        
	NSW05 pdn_sw0 (.GT(CKN), .NEG(XVSS), .POS(CAPN));
	
	CDC1 chinv0  (.CAP(CAPP), .A1(UPIN), .A2(CKN), .VO(VBST));
	
	PSW05 pup_sw0 (.GT(CKD), .POS(UPIN), .NEG(XVDD));
	NSW05 tin_sw0 (.GT(CKD), .NEG(UPIN), .POS(CAPN));
	
	TIEH bvdd0 (.Z(XVDD));
	TIEL bvss0 (.ZN(XVSS));

	DCAP4 axl0 ();
	DCAP4 axl1 ();
	DCAP4 axl2 ();
	DCAP4 axl3 ();
	DCAP4 axl4 ();
	DCAP4 axl5 ();
	DCAP4 axl6 ();
	DCAP4 axl7 ();
	DCAP16 axl8 ();
	DCAP16 axl9 ();
	DCAP16 axl10 ();

endmodule 
