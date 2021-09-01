
# The milkyway lib path and input/output path
set LIBR_PATH  comp
set RTL_PATH    ../src/comp.v
set MODULE_NAME COMP
set VERSION     _v1
set GDS_PATH aprout/$MODULE_NAME$VERSION.gds

# The backend files provided by foundry
set TECHFILE_PATH /EDA/PDK/tsmcN65/TSMCHOME/digital/Back_End/milkyway/tcbn65lp_200a/techfiles/tsmcn65_9lmT2.tf
set REFLIB_PATH  {/EDA/PDK/tsmcN65/TSMCHOME/digital/Back_End/milkyway/tcbn65lp_200a/cell_frame/tcbn65lp \
                 /home/ninezhang/workspace/MKW/MKW_RAIL/CEL_FRAM/rail65}
set TLUMAX_PATH /EDA/PDK/tsmcN65/TSMCHOME/digital/Back_End/milkyway/tcbn65lp_200a/techfiles/tluplus/cln65lp_1p09m+alrdl_rcbest_top2.tluplus
set TLUMIN_PATH /EDA/PDK/tsmcN65/TSMCHOME/digital/Back_End/milkyway/tcbn65lp_200a/techfiles/tluplus/cln65lp_1p09m+alrdl_rcworst_top2.tluplus
set TECH2ITF_PATH /EDA/PDK/tsmcN65/TSMCHOME/digital/Back_End/milkyway/tcbn65lp_200a/techfiles/tluplus/star.map_9M
set STDCELL_DB_PATH /EDA/PDK/tsmcN65/TSMCHOME/digital/Front_End/timing_power_noise/NLDM/tcbn65lp_200a
set RAILIB_DB_PATH /home/cxchen/workspace/lemon_digital/LC
set MAP_PATH /EDA/PDK/tsmcN65/TSMCHOME/digital/Back_End/milkyway/tcbn65lp_200a/gdsout_6X2Z.map
set_host_options -max 16

set_tlu_plus_files 	-max_tluplus $TLUMAX_PATH \
			-min_tluplus $TLUMIN_PATH \
		 	-tech2itf_map $TECH2ITF_PATH

lappend search_path $STDCELL_DB_PATH
lappend search_path $RAILIB_DB_PATH

# For simplicty we choose the typical case
set_app_var target_library "tcbn65lptc.db"
set_app_var link_library "tcbn65lptc.db rail65.db"


create_mw_lib \
    -technology $TECHFILE_PATH \
    -mw_reference_library  "$REFLIB_PATH" \
    -open $LIBR_PATH
read_verilog -top $MODULE_NAME -allow_black_box $RTL_PATH

# The physical information set, including floorplan area and allowed routing metal
set TILE_HT 1.8
set TILE_WD 0.2
set CORE_ROW 4
set CORE_COL 98
set CORE_HT [expr {$TILE_HT * $CORE_ROW}]
set CORE_WD [expr {$TILE_WD * $CORE_COL}]
set TOP_RT_METAL M5

create_floorplan -control_type width_and_height \
		 -core_width  $CORE_WD \
		 -core_height $CORE_HT 
		 
set_ignored_layers -min_routing M2 -max_routing_layer $TOP_RT_METAL

check_legality




# This part place all the cells manually


set_undoable_attribute [get_cells -all axl0] origin {0.000 0.0}
set_undoable_attribute [get_cells -all axl0] is_fixed {1}
set_undoable_attribute [get_cells -all comp1_p0] origin {3.200 0.0}
set_undoable_attribute [get_cells -all comp1_p0] is_fixed {1}
set_undoable_attribute [get_cells -all comp1_p1] origin {7.600 0.0}
set_undoable_attribute [get_cells -all comp1_p1] orientation {FN}
set_undoable_attribute [get_cells -all comp1_p1] is_fixed {1}
set_undoable_attribute [get_cells -all comp1_p6] origin {9.600 0.0}
set_undoable_attribute [get_cells -all comp1_p6] orientation {FN}
set_undoable_attribute [get_cells -all comp1_p6] is_fixed {1}


set_undoable_attribute [get_cells -all axr0] origin {19.600 0.0}
set_undoable_attribute [get_cells -all axr0] orientation {FN}
set_undoable_attribute [get_cells -all axr0] is_fixed {1}
set_undoable_attribute [get_cells -all comp1_n0] origin {12.000 0.0}
set_undoable_attribute [get_cells -all comp1_n0] is_fixed {1}
set_undoable_attribute [get_cells -all comp1_n1] origin {16.400 0.0}
set_undoable_attribute [get_cells -all comp1_n1] orientation {FN}
set_undoable_attribute [get_cells -all comp1_n1] is_fixed {1}
set_undoable_attribute [get_cells -all comp1_n6] origin {10.000 0.0}
set_undoable_attribute [get_cells -all comp1_n6] is_fixed {1}

set_undoable_attribute [get_cells -all axl1] origin {0.000 3.6}
set_undoable_attribute [get_cells -all axl1] orientation {FS}
set_undoable_attribute [get_cells -all axl1] is_fixed {1}
set_undoable_attribute [get_cells -all comp1_p2] origin {1.200 3.6}
set_undoable_attribute [get_cells -all comp1_p2] orientation {FS}
set_undoable_attribute [get_cells -all comp1_p2] is_fixed {1}
set_undoable_attribute [get_cells -all comp1_p3] origin {3.200 3.6}
set_undoable_attribute [get_cells -all comp1_p3] orientation {FS}
set_undoable_attribute [get_cells -all comp1_p3] is_fixed {1}
set_undoable_attribute [get_cells -all comp1_p4] origin {7.600 3.6}
set_undoable_attribute [get_cells -all comp1_p4] orientation {S}
set_undoable_attribute [get_cells -all comp1_p4] is_fixed {1}
set_undoable_attribute [get_cells -all comp1_p5] origin {9.600 3.6}
set_undoable_attribute [get_cells -all comp1_p5] orientation {S}
set_undoable_attribute [get_cells -all comp1_p5] is_fixed {1}

set_undoable_attribute [get_cells -all axr1] origin {19.600 3.6}
set_undoable_attribute [get_cells -all axr1] orientation {S}
set_undoable_attribute [get_cells -all axr1] is_fixed {1}
set_undoable_attribute [get_cells -all comp1_n5] origin {10.000 3.6}
set_undoable_attribute [get_cells -all comp1_n5] orientation {FS}
set_undoable_attribute [get_cells -all comp1_n5] is_fixed {1}
set_undoable_attribute [get_cells -all comp1_n4] origin {12.000 3.6}
set_undoable_attribute [get_cells -all comp1_n4] orientation {FS}
set_undoable_attribute [get_cells -all comp1_n4] is_fixed {1}
set_undoable_attribute [get_cells -all comp1_n3] origin {16.400 3.6}
set_undoable_attribute [get_cells -all comp1_n3] orientation {S}
set_undoable_attribute [get_cells -all comp1_n3] is_fixed {1}
set_undoable_attribute [get_cells -all comp1_n2] origin {18.400 3.6}
set_undoable_attribute [get_cells -all comp1_n2] orientation {S}
set_undoable_attribute [get_cells -all comp1_n2] is_fixed {1}

set_undoable_attribute [get_cells -all axl2] origin {0.000 7.2}
set_undoable_attribute [get_cells -all axl2] orientation {FS}
set_undoable_attribute [get_cells -all axl2] is_fixed {1}
set_undoable_attribute [get_cells -all drp1] origin {6.400 7.2}
set_undoable_attribute [get_cells -all drp1] orientation {S}
set_undoable_attribute [get_cells -all drp1] is_fixed {1}
set_undoable_attribute [get_cells -all drp0] origin {7.800 7.2}
set_undoable_attribute [get_cells -all drp0] orientation {S}
set_undoable_attribute [get_cells -all drp0] is_fixed {1}
set_undoable_attribute [get_cells -all comp2_p0] origin {9.600 7.2}
set_undoable_attribute [get_cells -all comp2_p0] orientation {S}
set_undoable_attribute [get_cells -all comp2_p0] is_fixed {1}

set_undoable_attribute [get_cells -all axr2] origin {19.600 7.2}
set_undoable_attribute [get_cells -all axr2] orientation {S}
set_undoable_attribute [get_cells -all axr2] is_fixed {1}
set_undoable_attribute [get_cells -all drn1] origin {13.200 7.2}
set_undoable_attribute [get_cells -all drn1] orientation {FS}
set_undoable_attribute [get_cells -all drn1] is_fixed {1}
set_undoable_attribute [get_cells -all drn0] origin {11.800 7.2}
set_undoable_attribute [get_cells -all drn0] orientation {FS}
set_undoable_attribute [get_cells -all drn0] is_fixed {1}
set_undoable_attribute [get_cells -all comp2_n0] origin {10.000 7.2}
set_undoable_attribute [get_cells -all comp2_n0] orientation {FS}
set_undoable_attribute [get_cells -all comp2_n0] is_fixed {1}

# Pin Assignment
set obj [get_terminal {"VIP"}]
set_attribute -quiet $obj layer  M2
set_attribute -quiet $obj owner_port  {VIP}
set_attribute -quiet $obj bbox {{5.35 0.00} {5.45 0.10}}

set obj [get_terminal {"VIN"}]
set_attribute -quiet $obj layer  M2
set_attribute -quiet $obj owner_port  {VIN}
set_attribute -quiet $obj bbox {{14.15 0.00} {14.25 0.10}}

set obj [get_terminal {"CLK"}]
set_attribute -quiet $obj layer  M2
set_attribute -quiet $obj owner_port  {CLK}
set_attribute -quiet $obj bbox {{9.75 0.00} {9.85 0.10}}

set obj [get_terminal {"OUTN"}]
set_attribute -quiet $obj layer  M2
set_attribute -quiet $obj owner_port  {OUTN}
set_attribute -quiet $obj bbox {{3.65 7.10} {3.75 7.20}}

set obj [get_terminal {"OUTP"}]
set_attribute -quiet $obj layer  M2
set_attribute -quiet $obj owner_port  {OUTP}
set_attribute -quiet $obj bbox {{15.85 7.10} {15.95 7.20}}

set obj [get_terminal {"CALP0"}]
set_attribute -quiet $obj layer  M3
set_attribute -quiet $obj owner_port  {CALP0}
set_attribute -quiet $obj bbox {{0.00 1.75} {0.10 1.85}}

set obj [get_terminal {"CALP1"}]
set_attribute -quiet $obj layer  M3
set_attribute -quiet $obj owner_port  {CALP1}
set_attribute -quiet $obj bbox {{0.00 2.55} {0.10 2.65}}

set obj [get_terminal {"CALP2"}]
set_attribute -quiet $obj layer  M3
set_attribute -quiet $obj owner_port  {CALP2}
set_attribute -quiet $obj bbox {{0.00 3.55} {0.10 3.65}}

set obj [get_terminal {"CALP3"}]
set_attribute -quiet $obj layer  M3
set_attribute -quiet $obj owner_port  {CALP3}
set_attribute -quiet $obj bbox {{0.00 4.55} {0.10 4.65}}

set obj [get_terminal {"CALN0"}]
set_attribute -quiet $obj layer  M3
set_attribute -quiet $obj owner_port  {CALN0}
set_attribute -quiet $obj bbox {{19.50 1.75} {19.60 1.85}}

set obj [get_terminal {"CALN1"}]
set_attribute -quiet $obj layer  M3
set_attribute -quiet $obj owner_port  {CALN1}
set_attribute -quiet $obj bbox {{19.50 2.55} {19.60 2.65}}

set obj [get_terminal {"CALN2"}]
set_attribute -quiet $obj layer  M3
set_attribute -quiet $obj owner_port  {CALN2}
set_attribute -quiet $obj bbox {{19.50 3.55} {19.60 3.65}}

set obj [get_terminal {"CALN3"}]
set_attribute -quiet $obj layer  M3
set_attribute -quiet $obj owner_port  {CALN3}
set_attribute -quiet $obj bbox {{19.50 4.55} {19.60 4.65}}

create_power_straps  -direction horizontal  -start_at 0.810 -nets  {VIP}  -layer M3 -width 0.35 -start_low_ends coordinate  -start_low_ends_coordinate 4.0 -start_high_ends coordinate  -start_high_ends_coordinate 9.0 -look_inside_std_cells
create_power_straps  -direction vertical  -start_at 5.40 -nets  {VIP}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_high_ends last_targets  -look_inside_std_cells

create_power_straps  -direction horizontal  -start_at 0.810 -nets  {VIN}  -layer M3 -width 0.35 -start_low_ends coordinate  -start_low_ends_coordinate 10.6 -start_high_ends coordinate  -start_high_ends_coordinate 15.6 -look_inside_std_cells
create_power_straps  -direction vertical  -start_at 14.2 -nets  {VIN}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_high_ends last_targets  -look_inside_std_cells

create_power_straps  -direction horizontal  -start_at 0.380 -nets  {CTAIL}  -layer M3 -width 0.20 -start_low_ends coordinate  -start_low_ends_coordinate 4.77 -start_high_ends coordinate  -start_high_ends_coordinate 14.83 -look_inside_std_cells

create_power_straps  -direction vertical  -start_at 9.085 -nets  {OUT1N}  -layer M2 -width 0.35 -start_low_ends coordinate  -start_low_ends_coordinate 1.3 -start_high_ends coordinate  -start_high_ends_coordinate 6.45 -extend_low_ends off -extend_high_ends off -look_inside_std_cells
create_power_straps  -direction horizontal  -start_at 3.06 -nets  {OUT1N}  -layer M3 -width 0.20 -start_low_ends coordinate  -start_low_ends_coordinate 2.65 -start_high_ends coordinate  -start_high_ends_coordinate 9.26 -extend_low_ends off -extend_high_ends off -look_inside_std_cells
create_power_straps  -direction vertical  -start_at 4.150 -nets  {OUT1N}  -layer M2 -width 0.20 -start_low_ends coordinate  -start_low_ends_coordinate 1.3 -start_high_ends coordinate  -start_high_ends_coordinate 3.16 -extend_low_ends off -extend_high_ends off -look_inside_std_cells


create_power_straps  -direction vertical  -start_at 10.515 -nets  {OUT1P}  -layer M2 -width 0.35 -start_low_ends coordinate  -start_low_ends_coordinate 1.3 -start_high_ends coordinate  -start_high_ends_coordinate 6.45 -extend_low_ends off -extend_high_ends off -look_inside_std_cells
create_power_straps  -direction horizontal  -start_at 3.06 -nets  {OUT1P}  -layer M3 -width 0.20 -start_low_ends coordinate  -start_low_ends_coordinate 10.34 -start_high_ends coordinate  -start_high_ends_coordinate 16.95 -extend_low_ends off -extend_high_ends off -look_inside_std_cells
create_power_straps  -direction vertical  -start_at 15.45 -nets  {OUT1P}  -layer M2 -width 0.20 -start_low_ends coordinate  -start_low_ends_coordinate 1.3 -start_high_ends coordinate  -start_high_ends_coordinate 3.16 -extend_low_ends off -extend_high_ends off -look_inside_std_cells

create_power_straps  -direction vertical  -start_at 1.33 -nets  {CALP0}  -layer M2 -width 0.12 -start_low_ends coordinate  -start_low_ends_coordinate 1.7 -start_high_ends coordinate  -start_high_ends_coordinate 2.92 -extend_low_ends off -extend_high_ends off -look_inside_std_cells
create_power_straps  -direction horizontal  -start_at 1.8 -nets  {CALP0}  -layer M3 -width 0.20 -start_low_ends coordinate  -start_low_ends_coordinate 0.0 -start_high_ends coordinate  -start_high_ends_coordinate 1.39 -extend_low_ends off -extend_high_ends off -look_inside_std_cells

create_power_straps  -direction horizontal  -start_at 2.6 -nets  {CALP1}  -layer M3 -width 0.20 -start_low_ends coordinate  -start_low_ends_coordinate 0.0 -start_high_ends coordinate  -start_high_ends_coordinate 3.39 -extend_low_ends off -extend_high_ends off -look_inside_std_cells

create_power_straps  -direction vertical  -start_at 7.47 -nets  {CALP2}  -layer M2 -width 0.12 -start_low_ends coordinate  -start_low_ends_coordinate 2.48 -start_high_ends coordinate  -start_high_ends_coordinate 3.7 -extend_low_ends off -extend_high_ends off -look_inside_std_cells
create_power_straps  -direction horizontal  -start_at 3.6 -nets  {CALP2}  -layer M3 -width 0.20 -start_low_ends coordinate  -start_low_ends_coordinate 0.0 -start_high_ends coordinate  -start_high_ends_coordinate 7.53 -extend_low_ends off -extend_high_ends off -look_inside_std_cells

create_power_straps  -direction vertical  -start_at 9.47 -nets  {CALP3}  -layer M2 -width 0.12 -start_low_ends coordinate  -start_low_ends_coordinate 2.48 -start_high_ends coordinate  -start_high_ends_coordinate 4.7 -extend_low_ends off -extend_high_ends off -look_inside_std_cells
create_power_straps  -direction horizontal  -start_at 4.6 -nets  {CALP3}  -layer M3 -width 0.20 -start_low_ends coordinate  -start_low_ends_coordinate 0.0 -start_high_ends coordinate  -start_high_ends_coordinate 9.53 -extend_low_ends off -extend_high_ends off -look_inside_std_cells

create_power_straps  -direction vertical  -start_at 18.27 -nets  {CALN0}  -layer M2 -width 0.12 -start_low_ends coordinate  -start_low_ends_coordinate 1.7 -start_high_ends coordinate  -start_high_ends_coordinate 2.92 -extend_low_ends off -extend_high_ends off -look_inside_std_cells
create_power_straps  -direction horizontal  -start_at 1.8 -nets  {CALN0}  -layer M3 -width 0.20 -start_low_ends coordinate  -start_low_ends_coordinate 18.21 -start_high_ends coordinate  -start_high_ends_coordinate 19.60 -extend_low_ends off -extend_high_ends off -look_inside_std_cells

create_power_straps  -direction horizontal  -start_at 2.6 -nets  {CALN1}  -layer M3 -width 0.20 -start_low_ends coordinate  -start_low_ends_coordinate 16.21 -start_high_ends coordinate  -start_high_ends_coordinate 19.60 -extend_low_ends off -extend_high_ends off -look_inside_std_cells

create_power_straps  -direction vertical  -start_at 12.13 -nets  {CALN2}  -layer M2 -width 0.12 -start_low_ends coordinate  -start_low_ends_coordinate 2.48 -start_high_ends coordinate  -start_high_ends_coordinate 3.7 -extend_low_ends off -extend_high_ends off -look_inside_std_cells
create_power_straps  -direction horizontal  -start_at 3.6 -nets  {CALN2}  -layer M3 -width 0.20 -start_low_ends coordinate  -start_low_ends_coordinate 12.07 -start_high_ends coordinate  -start_high_ends_coordinate 19.6 -extend_low_ends off -extend_high_ends off -look_inside_std_cells

create_power_straps  -direction vertical  -start_at 10.13 -nets  {CALN3}  -layer M2 -width 0.12 -start_low_ends coordinate  -start_low_ends_coordinate 2.48 -start_high_ends coordinate  -start_high_ends_coordinate 4.7 -extend_low_ends off -extend_high_ends off -look_inside_std_cells
create_power_straps  -direction horizontal  -start_at 4.6 -nets  {CALN3}  -layer M3 -width 0.20 -start_low_ends coordinate  -start_low_ends_coordinate 10.07 -start_high_ends coordinate  -start_high_ends_coordinate 19.6 -extend_low_ends off -extend_high_ends off -look_inside_std_cells

create_power_straps  -direction vertical  -start_at 3.7 -nets  {OUTN}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 6.25 -start_high_ends coordinate  -start_high_ends_coordinate 7.2 -extend_low_ends off -extend_high_ends off -look_inside_std_cells
create_power_straps  -direction horizontal  -start_at 6.35 -nets  {OUTN}  -layer M3 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 3.60 -start_high_ends coordinate  -start_high_ends_coordinate 5.25 -extend_low_ends off -extend_high_ends off -look_inside_std_cells

create_power_straps  -direction vertical  -start_at 15.9 -nets  {OUTP}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 6.25 -start_high_ends coordinate  -start_high_ends_coordinate 7.2 -extend_low_ends off -extend_high_ends off -look_inside_std_cells
create_power_straps  -direction horizontal  -start_at 6.35 -nets  {OUTP}  -layer M3 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 14.35 -start_high_ends coordinate  -start_high_ends_coordinate 16.0 -extend_low_ends off -extend_high_ends off -look_inside_std_cells

create_power_straps  -direction vertical  -start_at 3.53 -nets  {CLK}  -layer M2 -width 0.12 -start_low_ends coordinate  -start_low_ends_coordinate 0.68 -start_high_ends coordinate  -start_high_ends_coordinate 1.965 -look_inside_std_cells
create_power_straps  -direction vertical  -start_at 7.27 -nets  {CLK}  -layer M2 -width 0.12 -start_low_ends coordinate  -start_low_ends_coordinate 0.68 -start_high_ends coordinate  -start_high_ends_coordinate 1.965 -look_inside_std_cells
create_power_straps  -direction vertical  -start_at 9.47 -nets  {CLK}  -layer M2 -width 0.12 -start_low_ends coordinate  -start_low_ends_coordinate 0.68 -start_high_ends coordinate  -start_high_ends_coordinate 1.965 -look_inside_std_cells
create_power_straps  -direction vertical  -start_at 10.13 -nets  {CLK}  -layer M2 -width 0.12 -start_low_ends coordinate  -start_low_ends_coordinate 0.68 -start_high_ends coordinate  -start_high_ends_coordinate 1.965 -look_inside_std_cells
create_power_straps  -direction vertical  -start_at 12.33 -nets  {CLK}  -layer M2 -width 0.12 -start_low_ends coordinate  -start_low_ends_coordinate 0.68 -start_high_ends coordinate  -start_high_ends_coordinate 1.965 -look_inside_std_cells
create_power_straps  -direction vertical  -start_at 16.07 -nets  {CLK}  -layer M2 -width 0.12 -start_low_ends coordinate  -start_low_ends_coordinate 0.68 -start_high_ends coordinate  -start_high_ends_coordinate 1.965 -look_inside_std_cells
create_power_straps  -direction vertical  -start_at 9.80 -nets  {CLK}  -layer M2 -width 0.20 -start_low_ends coordinate  -start_low_ends_coordinate 0.00 -start_high_ends coordinate  -start_high_ends_coordinate 1.965 -look_inside_std_cells
create_power_straps  -direction horizontal  -start_at 1.8 -nets  {CLK}  -layer M3 -width 0.33 -start_low_ends coordinate  -start_low_ends_coordinate 3.47 -start_high_ends coordinate  -start_high_ends_coordinate 16.13 -extend_low_ends off -extend_high_ends off -look_inside_std_cells



create_text {CLK}  -layer {TEXT2} -height 0.1 -origin {9.80 0.05}
create_text {VIP}  -layer {TEXT2} -height 0.1 -origin {5.40 0.05}
create_text {VIN}  -layer {TEXT2} -height 0.1 -origin {14.20 0.05}
create_text {CALP0}  -layer {TEXT3} -height 0.1 -origin {0.05 1.80}
create_text {CALP1}  -layer {TEXT3} -height 0.1 -origin {0.05 2.60}
create_text {CALP2}  -layer {TEXT3} -height 0.1 -origin {0.05 3.60}
create_text {CALP3}  -layer {TEXT3} -height 0.1 -origin {0.05 4.60}
create_text {CALN0}  -layer {TEXT3} -height 0.1 -origin {19.55 1.80}
create_text {CALN1}  -layer {TEXT3} -height 0.1 -origin {19.55 2.60}
create_text {CALN2}  -layer {TEXT3} -height 0.1 -origin {19.55 3.60}
create_text {CALN3}  -layer {TEXT3} -height 0.1 -origin {19.55 4.60}
create_text {OUTN}  -layer {TEXT2} -height 0.1 -origin {3.70 7.15}
create_text {OUTP}  -layer {TEXT2} -height 0.1 -origin {15.90 7.15}




derive_pg_connection -power_net VDD -power_pin VDD -ground_net VSS -ground_pin VSS

insert_stdcell_filler -cell_without_metal "FILL4 FILL2 FILL1"	\
	-respect_keepout 	\
	-connect_to_power VDD  -connect_to_ground VSS

create_power_straps  -direction vertical  -start_at 0.350 -nets  {VDD}  -layer M2 -width 0.5 -extend_low_ends off -extend_high_ends off -look_inside_std_cells
create_power_straps  -direction vertical  -start_at 19.250 -nets  {VSS}  -layer M2 -width 0.5 -extend_low_ends off -extend_high_ends off -look_inside_std_cells

set_ignored_layers -min_routing M2 -max_routing_layer $TOP_RT_METAL
set_route_mode_options -zroute true
set_route_opt_strategy -search_repair_loop 8

set_route_zrt_common_options -post_detail_route_redundant_via_insertion high
route_zrt_eco
route_zrt_detail

create_text {VDD} -layer {TEXT2} -height 0.1 -origin {0.350 1}
create_text {VSS} -layer {TEXT2} -height 0.1 -origin {19.250 1}


source ../script/signoff.tcl

