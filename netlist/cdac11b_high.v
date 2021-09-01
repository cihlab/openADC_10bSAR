module CDAC11b_H (
	input  SW0, SW1, SW2, SW3, SW4, SW5, SW6, SW7, SW8, SW9, SW10, SW11,
	output CTOP
);
	SWCPDM row40     ();	
	// cap 8
	SWCP08 row22	(.SW(SW3), .VTOP0(CTOP));
	// cap 4
	SWCP04 row19	(.SW(SW2), .VTOP0(CTOP));
	// cap 2
	SWCP02 row21	(.SW(SW1), .VTOP0(CTOP));
	// cap 1
	SWCP01 row20	(.SW(SW0), .VTOP0(CTOP));
	// cap 16
	SWCP16 row18     (.SW(SW4), .VTOP0(CTOP));
	// cap 32
	SWCP16 row17    (.SW(SW5), .VTOP0(CTOP));
	SWCP16 row23    (.SW(SW5), .VTOP0(CTOP));
	// cap 64
	SWCP16 row15     (.SW(SW6), .VTOP0(CTOP));
	SWCP16 row16    (.SW(SW6), .VTOP0(CTOP));
	SWCP16 row24     (.SW(SW6), .VTOP0(CTOP));
	SWCP16 row25    (.SW(SW6), .VTOP0(CTOP));
	// cap 64
	SWCP16 row13     (.SW(SW7), .VTOP0(CTOP));
	SWCP16 row14    (.SW(SW7), .VTOP0(CTOP));
	SWCP16 row26     (.SW(SW7), .VTOP0(CTOP));
	SWCP16 row27    (.SW(SW7), .VTOP0(CTOP));
	// cap 128
	SWCP16_1 row11     (.SW(SW8), .VTOP0(CTOP));
	SWCP16_1 row12    (.SW(SW8), .VTOP0(CTOP));
	SWCP16_1 row28     (.SW(SW8), .VTOP0(CTOP));
	SWCP16_1 row29    (.SW(SW8), .VTOP0(CTOP));

	SWCP16_1 row9     (.SW(SW9), .VTOP0(CTOP));
	SWCP16_1 row10    (.SW(SW9), .VTOP0(CTOP));
	SWCP16_1 row30     (.SW(SW9), .VTOP0(CTOP));
	SWCP16_1 row31    (.SW(SW9), .VTOP0(CTOP));
	// cap 256 
	SWCP16_1 row5     (.SW(SW10), .VTOP0(CTOP));
	SWCP16_1 row6    (.SW(SW10), .VTOP0(CTOP));
	SWCP16_1 row7     (.SW(SW10), .VTOP0(CTOP));
	SWCP16_1 row8    (.SW(SW10), .VTOP0(CTOP));
	SWCP16_1 row32     (.SW(SW10), .VTOP0(CTOP));
	SWCP16_1 row33    (.SW(SW10), .VTOP0(CTOP));
	SWCP16_1 row34     (.SW(SW10), .VTOP0(CTOP));
	SWCP16_1 row35    (.SW(SW10), .VTOP0(CTOP));

	SWCP16_1 row1     (.SW(SW11), .VTOP0(CTOP));
	SWCP16_1 row2    (.SW(SW11), .VTOP0(CTOP));
	SWCP16_1 row3     (.SW(SW11), .VTOP0(CTOP));
	SWCP16_1 row4    (.SW(SW11), .VTOP0(CTOP));
	SWCP16_1 row36     (.SW(SW11), .VTOP0(CTOP));
	SWCP16_1 row37    (.SW(SW11), .VTOP0(CTOP));
	SWCP16_1 row38     (.SW(SW11), .VTOP0(CTOP));
	SWCP16_1 row39    (.SW(SW11), .VTOP0(CTOP));

	SWCPDL row0    (.VTOP1(CTOP));

endmodule

module SWCP16_1 (
	//inout VDD, VSS  		// Power Supply
	input SW,
	output VTOP0
);

	wire VBTM;
	wire FT00;

	INVD8 DR08     (.I(SW), .ZN(VBTM));
	
	MOM1  r0c01    (.POS(VTOP0), .NEG(VBTM));
	MOM1  r0c02    (.POS(VTOP0), .NEG(VBTM));	
	MOM1  r0c03    (.POS(VTOP0), .NEG(VBTM));
	MOM1  r0c04    (.POS(VTOP0), .NEG(VBTM));
	MOM1  r0c05    (.POS(VTOP0), .NEG(VBTM));
	MOM1  r0c06    (.POS(VTOP0), .NEG(VBTM));	
	MOM1  r0c07    (.POS(VTOP0), .NEG(VBTM));
	MOM1  r0c08    (.POS(VTOP0), .NEG(VBTM));
	MOM1  r1c01    (.POS(VTOP0), .NEG(VBTM));
	MOM1  r1c02    (.POS(VTOP0), .NEG(VBTM));	
	MOM1  r1c03    (.POS(VTOP0), .NEG(VBTM));
	MOM1  r1c04    (.POS(VTOP0), .NEG(VBTM));
	MOM1  r1c05    (.POS(VTOP0), .NEG(VBTM));
	MOM1  r1c06    (.POS(VTOP0), .NEG(VBTM));	
	MOM1  r1c07    (.POS(VTOP0), .NEG(VBTM));
	MOM1  r1c08    (.POS(VTOP0), .NEG(VBTM));
	
	MOM1  dm0l    (.POS(FT00), .NEG(VBTM));
	MOM1  dm0r    (.POS(XVDD), .NEG(XVDD));

	TIEH  bvdd0   (.Z(XVDD));
	DCAP8  axl0   ();
endmodule

module SWCP16 (
	//inout VDD, VSS  		// Power Supply
	input SW,
	output VTOP0
);

	wire VBTM;
	wire FT00;

	INVD8 DR08     (.I(SW), .ZN(VBTM));
	
	MOM1  r0c01    (.POS(VTOP0), .NEG(VBTM));
	MOM1  r0c02    (.POS(VTOP0), .NEG(VBTM));	
	MOM1  r0c03    (.POS(VTOP0), .NEG(VBTM));
	MOM1  r0c04    (.POS(VTOP0), .NEG(VBTM));
	MOM1  r0c05    (.POS(VTOP0), .NEG(VBTM));
	MOM1  r0c06    (.POS(VTOP0), .NEG(VBTM));	
	MOM1  r0c07    (.POS(VTOP0), .NEG(VBTM));
	MOM1  r0c08    (.POS(VTOP0), .NEG(VBTM));
	MOM1  r1c01    (.POS(VTOP0), .NEG(VBTM));
	MOM1  r1c02    (.POS(VTOP0), .NEG(VBTM));	
	MOM1  r1c03    (.POS(VTOP0), .NEG(VBTM));
	MOM1  r1c04    (.POS(VTOP0), .NEG(VBTM));
	MOM1  r1c05    (.POS(VTOP0), .NEG(VBTM));
	MOM1  r1c06    (.POS(VTOP0), .NEG(VBTM));	
	MOM1  r1c07    (.POS(VTOP0), .NEG(VBTM));
	MOM1  r1c08    (.POS(VTOP0), .NEG(VBTM));
	
	MOM1  dm0l    (.POS(FT00), .NEG(VBTM));
	MOM1  dm0r    (.POS(XVSS), .NEG(XVSS));

	TIEL  bvss0   (.ZN(XVSS));
	DCAP8  axl0   ();

endmodule

module SWCP08 (
	//inout VDD, VSS  		// Power Supply
	input SW,
	output VTOP0
);

	wire VBTM;
	wire FT00;

	INVD4 DR04     (.I(SW), .ZN(VBTM));
	
	MOM1  r0c01    (.POS(VTOP0), .NEG(VBTM));
	MOM1  r0c02    (.POS(VTOP0), .NEG(VBTM));	
	MOM1  r0c03    (.POS(VTOP0), .NEG(VBTM));
	MOM1  r0c04    (.POS(VTOP0), .NEG(VBTM));
	MOM1  r0c05    (.POS(VTOP0), .NEG(VBTM));
	MOM1  r0c06    (.POS(VTOP0), .NEG(VBTM));	
	MOM1  r0c07    (.POS(VTOP0), .NEG(VBTM));
	MOM1  r0c08    (.POS(VTOP0), .NEG(VBTM));
	MOM1  r1c01    (.POS(VTOP0), .NEG(XVSS));
	MOM1  r1c02    (.POS(VTOP0), .NEG(XVSS));	
	MOM1  r1c03    (.POS(VTOP0), .NEG(XVSS));
	MOM1  r1c04    (.POS(VTOP0), .NEG(XVSS));
	MOM1  r1c05    (.POS(VTOP0), .NEG(XVSS));
	MOM1  r1c06    (.POS(VTOP0), .NEG(XVSS));	
	MOM1  r1c07    (.POS(VTOP0), .NEG(XVSS));
	MOM1  r1c08    (.POS(VTOP0), .NEG(XVSS));
	
	MOM1  dm0l    (.POS(FT00), .NEG(VBTM));
	MOM1  dm0r    (.POS(XVSS), .NEG(XVSS));

	TIEL  bvss0   (.ZN(XVSS));
	DCAP8  axl0   ();

endmodule

module SWCP04 (
	//inout VDD, VSS  		// Power Supply
	input SW,
	output VTOP0
);

	wire VBTM;
	wire FT00;

	INVD2 DR02     (.I(SW), .ZN(VBTM));
	
	MOM1  r0c01    (.POS(VTOP0), .NEG(VBTM));
	MOM1  r0c02    (.POS(VTOP0), .NEG(VBTM));	
	MOM1  r0c03    (.POS(VTOP0), .NEG(VBTM));
	MOM1  r0c04    (.POS(VTOP0), .NEG(VBTM));
	MOM1  r0c05    (.POS(VTOP0), .NEG(XVSS));
	MOM1  r0c06    (.POS(VTOP0), .NEG(XVSS));	
	MOM1  r0c07    (.POS(VTOP0), .NEG(XVSS));
	MOM1  r0c08    (.POS(VTOP0), .NEG(XVSS));
	MOM1  r1c01    (.POS(VTOP0), .NEG(XVSS));
	MOM1  r1c02    (.POS(VTOP0), .NEG(XVSS));	
	MOM1  r1c03    (.POS(VTOP0), .NEG(XVSS));
	MOM1  r1c04    (.POS(VTOP0), .NEG(XVSS));
	MOM1  r1c05    (.POS(VTOP0), .NEG(XVSS));
	MOM1  r1c06    (.POS(VTOP0), .NEG(XVSS));	
	MOM1  r1c07    (.POS(VTOP0), .NEG(XVSS));
	MOM1  r1c08    (.POS(VTOP0), .NEG(XVSS));
	
	MOM1  dm0l    (.POS(FT00), .NEG(VBTM));
	MOM1  dm0r    (.POS(XVSS), .NEG(XVSS));

	TIEL  bvss0   (.ZN(XVSS));
	DCAP8  axl0   ();

endmodule

module SWCP02 (
	//inout VDD, VSS  		// Power Supply
	input SW,
	output VTOP0
);

	wire VBTM;
	wire FT00;

	INVD1 DR01     (.I(SW), .ZN(VBTM));
	
	MOM1  r0c01    (.POS(VTOP0), .NEG(VBTM));
	MOM1  r0c02    (.POS(VTOP0), .NEG(VBTM));	
	MOM1  r0c03    (.POS(VTOP0), .NEG(XVSS));
	MOM1  r0c04    (.POS(VTOP0), .NEG(XVSS));
	MOM1  r0c05    (.POS(VTOP0), .NEG(XVSS));
	MOM1  r0c06    (.POS(VTOP0), .NEG(XVSS));	
	MOM1  r0c07    (.POS(VTOP0), .NEG(XVSS));
	MOM1  r0c08    (.POS(VTOP0), .NEG(XVSS));
	MOM1  r1c01    (.POS(VTOP0), .NEG(XVSS));
	MOM1  r1c02    (.POS(VTOP0), .NEG(XVSS));	
	MOM1  r1c03    (.POS(VTOP0), .NEG(XVSS));
	MOM1  r1c04    (.POS(VTOP0), .NEG(XVSS));
	MOM1  r1c05    (.POS(VTOP0), .NEG(XVSS));
	MOM1  r1c06    (.POS(VTOP0), .NEG(XVSS));	
	MOM1  r1c07    (.POS(VTOP0), .NEG(XVSS));
	MOM1  r1c08    (.POS(VTOP0), .NEG(XVSS));
	
	MOM1  dm0l     (.POS(FT00), .NEG(VBTM));
	MOM1  dm0r     (.POS(XVSS), .NEG(XVSS));

	TIEL  bvss0    (.ZN(XVSS));
	DCAP8 axl0     ();

endmodule

module SWCP01 (
	//inout VDD, VSS  		// Power Supply
	input SW,
	output VTOP0
);

	wire VBTM;
	wire FT00;

	INVD1 DR01     (.I(SW), .ZN(VBTM));
	
	MOM1  r0c01    (.POS(VTOP0), .NEG(VBTM));
	MOM1  r0c02    (.POS(VTOP0), .NEG(XVSS));	
	MOM1  r0c03    (.POS(VTOP0), .NEG(XVSS));
	MOM1  r0c04    (.POS(VTOP0), .NEG(XVSS));
	MOM1  r0c05    (.POS(VTOP0), .NEG(XVSS));
	MOM1  r0c06    (.POS(VTOP0), .NEG(XVSS));	
	MOM1  r0c07    (.POS(VTOP0), .NEG(XVSS));
	MOM1  r0c08    (.POS(VTOP0), .NEG(XVSS));
	MOM1  r1c01    (.POS(VTOP0), .NEG(XVSS));
	MOM1  r1c02    (.POS(VTOP0), .NEG(XVSS));	
	MOM1  r1c03    (.POS(VTOP0), .NEG(XVSS));
	MOM1  r1c04    (.POS(VTOP0), .NEG(XVSS));
	MOM1  r1c05    (.POS(VTOP0), .NEG(XVSS));
	MOM1  r1c06    (.POS(VTOP0), .NEG(XVSS));	
	MOM1  r1c07    (.POS(VTOP0), .NEG(XVSS));
	MOM1  r1c08    (.POS(VTOP0), .NEG(XVSS));

	MOM1  dm0l    (.POS(FT00), .NEG(VBTM));
	MOM1  dm0r    (.POS(XVSS), .NEG(XVSS));

	TIEL  bvss0   (.ZN(XVSS));
	DCAP8  axl0   ();

endmodule


module SWCPDM ();

	wire XVDD, VTOP0;

	MOM1  r0c01    (.POS(VTOP0), .NEG(XVDD));
	MOM1  r0c02    (.POS(VTOP0), .NEG(XVDD));	
	MOM1  r0c03    (.POS(VTOP0), .NEG(XVDD));
	MOM1  r0c04    (.POS(VTOP0), .NEG(XVDD));
	MOM1  r0c05    (.POS(VTOP0), .NEG(XVDD));
	MOM1  r0c06    (.POS(VTOP0), .NEG(XVDD));	
	MOM1  r0c07    (.POS(VTOP0), .NEG(XVDD));
	MOM1  r0c08    (.POS(VTOP0), .NEG(XVDD));
	MOM1  r1c01    (.POS(VTOP0), .NEG(XVDD));
	MOM1  r1c02    (.POS(VTOP0), .NEG(XVDD));	
	MOM1  r1c03    (.POS(VTOP0), .NEG(XVDD));
	MOM1  r1c04    (.POS(VTOP0), .NEG(XVDD));
	MOM1  r1c05    (.POS(VTOP0), .NEG(XVDD));
	MOM1  r1c06    (.POS(VTOP0), .NEG(XVDD));	
	MOM1  r1c07    (.POS(VTOP0), .NEG(XVDD));
	MOM1  r1c08    (.POS(VTOP0), .NEG(XVDD));

	MOM1  dm0l     (.POS(VTOP0), .NEG(XVDD));
	MOM1  dm0r     (.POS(VTOP0), .NEG(XVDD));

	TIEH  bvdd0    (.Z(XVDD));	
	TIEL  drv      (.ZN(VTOP0));
	DCAP8 axl0    ();	

endmodule

module SWCPDL (output VTOP1);

	wire XVDD, VTOP0;

	MOM1  r0c01    (.POS(VTOP1), .NEG(XVDD));
	MOM1  r0c02    (.POS(VTOP0), .NEG(XVDD));	
	MOM1  r0c03    (.POS(VTOP0), .NEG(XVDD));
	MOM1  r0c04    (.POS(VTOP0), .NEG(XVDD));
	MOM1  r0c05    (.POS(VTOP0), .NEG(XVDD));
	MOM1  r0c06    (.POS(VTOP0), .NEG(XVDD));	
	MOM1  r0c07    (.POS(VTOP0), .NEG(XVDD));
	MOM1  r0c08    (.POS(VTOP0), .NEG(XVDD));
	MOM1  r1c01    (.POS(VTOP0), .NEG(XVDD));
	MOM1  r1c02    (.POS(VTOP0), .NEG(XVDD));	
	MOM1  r1c03    (.POS(VTOP0), .NEG(XVDD));
	MOM1  r1c04    (.POS(VTOP0), .NEG(XVDD));
	MOM1  r1c05    (.POS(VTOP0), .NEG(XVDD));
	MOM1  r1c06    (.POS(VTOP0), .NEG(XVDD));	
	MOM1  r1c07    (.POS(VTOP0), .NEG(XVDD));
	MOM1  r1c08    (.POS(VTOP0), .NEG(XVDD));
	
	MOM1  dm0l     (.POS(VTOP1), .NEG(XVDD));
	MOM1  dm0r     (.POS(VTOP0), .NEG(XVDD));

	TIEH  bvdd0    (.Z(XVDD));	
	DCAP8 axl0    ();	

endmodule
