`timescale 1ns/1ps

module COMP (
	//inout VDD, VSS 	// Power Supply ports
	input VIP, VIN, 	// Analog Input
	input CLK,		// Digital Enable
	input CALP0,CALN0,CALP1,CALN1,CALP2,CALN2,CALP3,CALN3,  // Offset Calibration Bits 
	output OUTP, OUTN	// Digital Output
);
	wire CTAIL;
	wire OUT1P, OUT1N;
	wire CMPP, CMPN;
	wire NCMPP, NCMPN;
	
	// 1st stage
	
	// P side half input ckt
	VCDC2   comp1_p0 (.CK(CLK), .VIN(VIP), .ZN(OUT1N), .TL(CTAIL));
	VCDC2   comp1_p1 (.CK(CLK), .VIN(VIP), .ZN(OUT1N), .TL(CTAIL));

	PCAP   comp1_p2 (.VIN(OUT1N), .CT(CALP0));
	PCAP   comp1_p3 (.VIN(OUT1N), .CT(CALP1));
	PCAP   comp1_p4 (.VIN(OUT1N), .CT(CALP2));
	PCAP   comp1_p5 (.VIN(OUT1N), .CT(CALP3));

	VCDP2   comp1_p6 (.CK(CLK), .VIN(VIP), .ZN(OUT1N), .TL(CTAIL));

	// N side half input ckt
	VCDC2   comp1_n0 (.CK(CLK), .VIN(VIN), .ZN(OUT1P), .TL(CTAIL));
	VCDC2   comp1_n1 (.CK(CLK), .VIN(VIN), .ZN(OUT1P), .TL(CTAIL));

	PCAP   comp1_n2 (.VIN(OUT1P), .CT(CALN0));
	PCAP   comp1_n3 (.VIN(OUT1P), .CT(CALN1));
	PCAP   comp1_n4 (.VIN(OUT1P), .CT(CALN2));
	PCAP   comp1_n5 (.VIN(OUT1P), .CT(CALN3));

	VCDP2   comp1_n6 (.CK(CLK), .VIN(VIN), .ZN(OUT1P), .TL(CTAIL));

	// 2nd Stg NOR Latch
	MSNR3   comp2_p0 (.AIN(OUT1N), .DIN(CMPN), .ZN(CMPP));
	MSNR3   comp2_n0 (.AIN(OUT1P), .DIN(CMPP), .ZN(CMPN));

	// output
	INVD4   drp0 (.I(CMPN), .ZN(NCMPN));
	INVD8   drp1 (.I(NCMPN), .ZN(OUTN));
	INVD4   drn0 (.I(CMPP), .ZN(NCMPP));
	INVD8   drn1 (.I(NCMPP), .ZN(OUTP));

	// DCAP
	DCAP8  axl0 ();
	DCAP8  axr0 ();
	DCAP4  axl1 ();
	DCAP4  axr1 ();
	DCAP16 axl2 ();
	DCAP16 axr2 ();
	
endmodule
