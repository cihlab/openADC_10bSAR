# CDAC11b_H

# The milkyway lib path and input/output path
set LIBR_PATH  ADC_LP
set RTL_PATH  ../src/cdac11b_high.v
set MODULE_NAME CDAC11b_H
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
uniquify_fp_mw_cel

# The physical information set, including floorplan area and allowed routing metal
set TILE_HT 1.8
set TILE_WD 0.2
set CORE_ROW 41
set CORE_COL 297
set CORE_HT [expr {$TILE_HT * $CORE_ROW}]
set CORE_WD [expr {$TILE_WD * $CORE_COL}]
set TOP_RT_METAL M5

create_floorplan -control_type width_and_height \
		 -core_width  $CORE_WD \
		 -core_height $CORE_HT 
set_ignored_layers -min_routing M2 -max_routing_layer $TOP_RT_METAL

set CDAC_ORT N
set CDAC_FOT FN
set ROW_PFX row0
set ROW_HGT 0.0
source ../script/row_place_H.tcl

set CDAC_ORT FS
set CDAC_FOT S
set ROW_PFX row1
set ROW_HGT 3.6
source ../script/row_place_H.tcl

set CDAC_ORT N
set CDAC_FOT FN
set ROW_PFX row2
set ROW_HGT 3.6
source ../script/row_place_H.tcl

set CDAC_ORT FS
set CDAC_FOT S
set ROW_PFX row3
set ROW_HGT 7.2
source ../script/row_place_H.tcl

set CDAC_ORT N
set CDAC_FOT FN
set ROW_PFX row4
set ROW_HGT 7.2
source ../script/row_place_H.tcl

set CDAC_ORT FS
set CDAC_FOT S
set ROW_PFX row5
set ROW_HGT 10.8
source ../script/row_place_H.tcl

set CDAC_ORT N
set CDAC_FOT FN
set ROW_PFX row6
set ROW_HGT 10.8
source ../script/row_place_H.tcl

set CDAC_ORT FS
set CDAC_FOT S
set ROW_PFX row7
set ROW_HGT 14.4
source ../script/row_place_H.tcl

set CDAC_ORT N
set CDAC_FOT FN
set ROW_PFX row8
set ROW_HGT 14.4
source ../script/row_place_H.tcl

set CDAC_ORT FS
set CDAC_FOT S
set ROW_PFX row9
set ROW_HGT 18.0
source ../script/row_place_H.tcl

set CDAC_ORT N
set CDAC_FOT FN
set ROW_PFX row10
set ROW_HGT 18.0
source ../script/row_place_H.tcl

set CDAC_ORT FS
set CDAC_FOT S
set ROW_PFX row11
set ROW_HGT 21.6
source ../script/row_place_H.tcl

set CDAC_ORT N
set CDAC_FOT FN
set ROW_PFX row12
set ROW_HGT 21.6
source ../script/row_place_H.tcl

set CDAC_ORT FS
set CDAC_FOT S
set ROW_PFX row13
set ROW_HGT 25.2
source ../script/row_place_H.tcl

set CDAC_ORT N
set CDAC_FOT FN
set ROW_PFX row14
set ROW_HGT 25.2
source ../script/row_place_H.tcl

set CDAC_ORT FS
set CDAC_FOT S
set ROW_PFX row15
set ROW_HGT 28.8
source ../script/row_place_H.tcl

set CDAC_ORT N
set CDAC_FOT FN
set ROW_PFX row16
set ROW_HGT 28.8
source ../script/row_place_H.tcl

set CDAC_ORT FS
set CDAC_FOT S
set ROW_PFX row17
set ROW_HGT 32.4
source ../script/row_place_H.tcl

set CDAC_ORT N
set CDAC_FOT FN
set ROW_PFX row18
set ROW_HGT 32.4
source ../script/row_place_H.tcl

set CDAC_ORT FS
set CDAC_FOT S
set ROW_PFX row19
set ROW_HGT 36.0
source ../script/row_place_H.tcl

set CDAC_ORT N
set CDAC_FOT FN
set ROW_PFX row20
set ROW_HGT 36.0
source ../script/row_place_H.tcl

set CDAC_ORT FS
set CDAC_FOT S
set ROW_PFX row21
set ROW_HGT 39.6
source ../script/row_place_H.tcl

set CDAC_ORT N
set CDAC_FOT FN
set ROW_PFX row22
set ROW_HGT 39.6
source ../script/row_place_H.tcl

set CDAC_ORT FS
set CDAC_FOT S
set ROW_PFX row23
set ROW_HGT 43.2
source ../script/row_place_H.tcl

set CDAC_ORT N
set CDAC_FOT FN
set ROW_PFX row24
set ROW_HGT 43.2
source ../script/row_place_H.tcl

set CDAC_ORT FS
set CDAC_FOT S
set ROW_PFX row25
set ROW_HGT 46.8
source ../script/row_place_H.tcl

set CDAC_ORT N
set CDAC_FOT FN
set ROW_PFX row26
set ROW_HGT 46.8
source ../script/row_place_H.tcl

set CDAC_ORT FS
set CDAC_FOT S
set ROW_PFX row27
set ROW_HGT 50.4
source ../script/row_place_H.tcl

set CDAC_ORT N
set CDAC_FOT FN
set ROW_PFX row28
set ROW_HGT 50.4
source ../script/row_place_H.tcl

set CDAC_ORT FS
set CDAC_FOT S
set ROW_PFX row29
set ROW_HGT 54.0
source ../script/row_place_H.tcl

set CDAC_ORT N
set CDAC_FOT FN
set ROW_PFX row30
set ROW_HGT 54.0
source ../script/row_place_H.tcl

set CDAC_ORT FS
set CDAC_FOT S
set ROW_PFX row31
set ROW_HGT 57.6
source ../script/row_place_H.tcl

set CDAC_ORT N
set CDAC_FOT FN
set ROW_PFX row32
set ROW_HGT 57.6
source ../script/row_place_H.tcl

set CDAC_ORT FS
set CDAC_FOT S
set ROW_PFX row33
set ROW_HGT 61.2
source ../script/row_place_H.tcl

set CDAC_ORT N
set CDAC_FOT FN
set ROW_PFX row34
set ROW_HGT 61.2
source ../script/row_place_H.tcl

set CDAC_ORT FS
set CDAC_FOT S
set ROW_PFX row35
set ROW_HGT 64.8
source ../script/row_place_H.tcl

set CDAC_ORT N
set CDAC_FOT FN
set ROW_PFX row36
set ROW_HGT 64.8
source ../script/row_place_H.tcl

set CDAC_ORT FS
set CDAC_FOT S
set ROW_PFX row37
set ROW_HGT 68.4
source ../script/row_place_H.tcl

set CDAC_ORT N
set CDAC_FOT FN
set ROW_PFX row38
set ROW_HGT 68.4
source ../script/row_place_H.tcl

set CDAC_ORT FS
set CDAC_FOT S
set ROW_PFX row39
set ROW_HGT 72.0
source ../script/row_place_H.tcl

set CDAC_ORT N
set CDAC_FOT FN
set ROW_PFX row40
set ROW_HGT 72.0
source ../script/row_place_H.tcl

# Pin Assignment
set obj [get_terminal {"CTOP"}]
set_attribute -quiet $obj layer  M5
set_attribute -quiet $obj owner_port  {CTOP}
set_attribute -quiet $obj bbox {{0.0 0.85} {0.1 0.95}}
create_text {CTOP}  -layer {TEXT5} -height 0.1 -origin {0.05 0.90}

set obj [get_terminal {"SW0"}]
set_attribute -quiet $obj layer  M3
set_attribute -quiet $obj owner_port  {SW0}
set_attribute -quiet $obj bbox {{0.00 36.75} {0.10 36.85}}
create_text {SW0}  -layer {TEXT3} -height 0.1 -origin {0.05 36.80}

set obj [get_terminal {"SW1"}]
set_attribute -quiet $obj layer  M3
set_attribute -quiet $obj owner_port  {SW1}
set_attribute -quiet $obj bbox {{0.00 38.55} {0.10 38.65}}
create_text {SW1}  -layer {TEXT3} -height 0.1 -origin {0.05 38.60}

set obj [get_terminal {"SW2"}]
set_attribute -quiet $obj layer  M3
set_attribute -quiet $obj owner_port  {SW2}
set_attribute -quiet $obj bbox {{0.00 35.05} {0.10 35.15}}
create_text {SW2}  -layer {TEXT3} -height 0.1 -origin {0.05 35.10}

set obj [get_terminal {"SW3"}]
set_attribute -quiet $obj layer  M3
set_attribute -quiet $obj owner_port  {SW3}
set_attribute -quiet $obj bbox {{0.00 40.35} {0.10 40.45}}
create_text {SW3}  -layer {TEXT3} -height 0.1 -origin {0.05 40.40}

set obj [get_terminal {"SW4"}]
set_attribute -quiet $obj layer  M3
set_attribute -quiet $obj owner_port  {SW4}
set_attribute -quiet $obj bbox {{0.00 33.15} {0.10 33.25}}
create_text {SW4}  -layer {TEXT3} -height 0.1 -origin {0.05 33.20}

set obj [get_terminal {"SW5"}]
set_attribute -quiet $obj layer  M3
set_attribute -quiet $obj owner_port  {SW5}
set_attribute -quiet $obj bbox {{0.00 42.35} {0.10 42.45}}
create_text {SW5}  -layer {TEXT3} -height 0.1 -origin {0.05 42.40}

set obj [get_terminal {"SW6"}]
set_attribute -quiet $obj layer  M3
set_attribute -quiet $obj owner_port  {SW6}
set_attribute -quiet $obj bbox {{0.00 44.15} {0.10 44.25}}
create_text {SW6}  -layer {TEXT3} -height 0.1 -origin {0.05 44.20}

set obj [get_terminal {"SW7"}]
set_attribute -quiet $obj layer  M3
set_attribute -quiet $obj owner_port  {SW[7]}
set_attribute -quiet $obj bbox {{0.00 47.55} {0.10 47.65}}
create_text {SW7}  -layer {TEXT3} -height 0.1 -origin {0.05 47.60}

set obj [get_terminal {"SW8"}]
set_attribute -quiet $obj layer  M3
set_attribute -quiet $obj owner_port  {SW8}
set_attribute -quiet $obj bbox {{0.00 51.35} {0.10 51.45}}
create_text {SW8}  -layer {TEXT3} -height 0.1 -origin {0.05 51.40}

set obj [get_terminal {"SW9"}]
set_attribute -quiet $obj layer  M3
set_attribute -quiet $obj owner_port  {SW9}
set_attribute -quiet $obj bbox {{0.00 54.95} {0.10 55.05}}
create_text {SW9}  -layer {TEXT3} -height 0.1 -origin {0.05 55.00}

set obj [get_terminal {"SW10"}]
set_attribute -quiet $obj layer  M3
set_attribute -quiet $obj owner_port  {SW10}
set_attribute -quiet $obj bbox {{0.00 58.55} {0.10 58.65}}
create_text {SW10}  -layer {TEXT3} -height 0.1 -origin {0.05 58.60}

set obj [get_terminal {"SW11"}]
set_attribute -quiet $obj layer  M3
set_attribute -quiet $obj owner_port  {SW11}
set_attribute -quiet $obj bbox {{0.00 65.75} {0.10 65.85}}
create_text {SW11}  -layer {TEXT3} -height 0.1 -origin {0.05 65.80}


# Routing

create_power_straps  -direction horizontal  -start_at 0.90 -nets  {row0/XVDD}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 4.50 -start_high_ends coordinate  -start_high_ends_coordinate 58.80

create_power_straps  -direction horizontal  -start_at 72.90 -nets  {row40/XVDD}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 4.50 -start_high_ends coordinate  -start_high_ends_coordinate 58.80

# cap 01
create_power_straps  -direction horizontal  -start_at 36.90 -nets  {row20/VBTM}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 4.60 -start_high_ends coordinate  -start_high_ends_coordinate 10.80

create_power_straps  -direction horizontal  -start_at 36.90 -nets  {row20/XVSS}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 12.30 -start_high_ends coordinate  -start_high_ends_coordinate 58.80

# cap 02
create_power_straps  -direction horizontal  -start_at 38.70 -nets  {row21/VBTM}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 4.60 -start_high_ends coordinate  -start_high_ends_coordinate 13.80
create_power_straps  -direction horizontal  -start_at 38.70 -nets  {row21/XVSS}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 15.30 -start_high_ends coordinate  -start_high_ends_coordinate 58.80

# cap 04
create_power_straps  -direction horizontal  -start_at 35.10 -nets  {row19/VBTM}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 4.60 -start_high_ends coordinate  -start_high_ends_coordinate 19.80
create_power_straps  -direction horizontal  -start_at 35.10 -nets  {row19/XVSS}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 21.30 -start_high_ends coordinate  -start_high_ends_coordinate 58.80

# cap 08
create_power_straps  -direction horizontal  -start_at 40.50 -nets  {row22/VBTM}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 4.60 -start_high_ends coordinate  -start_high_ends_coordinate 31.80
create_power_straps  -direction horizontal  -start_at 40.50 -nets  {row22/XVSS}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 33.30 -start_high_ends coordinate  -start_high_ends_coordinate 58.80

# cap 16
create_power_straps  -direction horizontal  -start_at 33.30 -nets  {row18/VBTM}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 4.60 -start_high_ends coordinate  -start_high_ends_coordinate 55.80
create_power_straps  -direction horizontal  -start_at 33.30 -nets  {row18/XVSS}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 57.30 -start_high_ends coordinate  -start_high_ends_coordinate 58.80

# cap 32
create_power_straps  -direction horizontal  -start_at 31.50 -nets  {row17/VBTM}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 4.60 -start_high_ends coordinate  -start_high_ends_coordinate 55.80
create_power_straps  -direction horizontal  -start_at 31.50 -nets  {row17/XVSS}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 57.30 -start_high_ends coordinate  -start_high_ends_coordinate 58.80

create_power_straps  -direction horizontal  -start_at 42.30 -nets  {row23/VBTM}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 4.60 -start_high_ends coordinate  -start_high_ends_coordinate 55.80
create_power_straps  -direction horizontal  -start_at 42.30 -nets  {row23/XVSS}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 57.30 -start_high_ends coordinate  -start_high_ends_coordinate 58.80

# cap 64
create_power_straps  -direction horizontal  -start_at 27.90 -nets  {row15/VBTM}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 4.60 -start_high_ends coordinate  -start_high_ends_coordinate 55.80
create_power_straps  -direction horizontal  -start_at 27.90 -nets  {row15/XVSS}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 57.30 -start_high_ends coordinate  -start_high_ends_coordinate 58.80

create_power_straps  -direction horizontal  -start_at 29.70 -nets  {row16/VBTM}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 4.60 -start_high_ends coordinate  -start_high_ends_coordinate 55.80
create_power_straps  -direction horizontal  -start_at 29.70 -nets  {row16/XVSS}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 57.30 -start_high_ends coordinate  -start_high_ends_coordinate 58.80

create_power_straps  -direction horizontal  -start_at 44.10 -nets  {row24/VBTM}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 4.60 -start_high_ends coordinate  -start_high_ends_coordinate 55.80
create_power_straps  -direction horizontal  -start_at 44.10 -nets  {row24/XVSS}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 57.30 -start_high_ends coordinate  -start_high_ends_coordinate 58.80

create_power_straps  -direction horizontal  -start_at 45.90 -nets  {row25/VBTM}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 4.60 -start_high_ends coordinate  -start_high_ends_coordinate 55.80
create_power_straps  -direction horizontal  -start_at 45.90 -nets  {row25/XVSS}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 57.30 -start_high_ends coordinate  -start_high_ends_coordinate 58.80

# cap 64
create_power_straps  -direction horizontal  -start_at 24.30 -nets  {row13/VBTM}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 4.60 -start_high_ends coordinate  -start_high_ends_coordinate 55.80
create_power_straps  -direction horizontal  -start_at 24.30 -nets  {row13/XVSS}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 57.30 -start_high_ends coordinate  -start_high_ends_coordinate 58.80

create_power_straps  -direction horizontal  -start_at 26.10 -nets  {row14/VBTM}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 4.60 -start_high_ends coordinate  -start_high_ends_coordinate 55.80
create_power_straps  -direction horizontal  -start_at 26.10 -nets  {row14/XVSS}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 57.30 -start_high_ends coordinate  -start_high_ends_coordinate 58.80

create_power_straps  -direction horizontal  -start_at 47.70 -nets  {row26/VBTM}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 4.60 -start_high_ends coordinate  -start_high_ends_coordinate 55.80
create_power_straps  -direction horizontal  -start_at 47.70 -nets  {row26/XVSS}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 57.30 -start_high_ends coordinate  -start_high_ends_coordinate 58.80

create_power_straps  -direction horizontal  -start_at 49.50 -nets  {row27/VBTM}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 4.60 -start_high_ends coordinate  -start_high_ends_coordinate 55.80
create_power_straps  -direction horizontal  -start_at 49.50 -nets  {row27/XVSS}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 57.30 -start_high_ends coordinate  -start_high_ends_coordinate 58.80

# cap 128
create_power_straps  -direction horizontal  -start_at 17.10 -nets  {row9/VBTM}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 4.60 -start_high_ends coordinate  -start_high_ends_coordinate 55.80
create_power_straps  -direction horizontal  -start_at 17.10 -nets  {row9/XVDD}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 57.30 -start_high_ends coordinate  -start_high_ends_coordinate 58.80

create_power_straps  -direction horizontal  -start_at 18.90 -nets  {row10/VBTM}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 4.60 -start_high_ends coordinate  -start_high_ends_coordinate 55.80
create_power_straps  -direction horizontal  -start_at 18.90 -nets  {row10/XVDD}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 57.30 -start_high_ends coordinate  -start_high_ends_coordinate 58.80

create_power_straps  -direction horizontal  -start_at 20.70 -nets  {row11/VBTM}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 4.60 -start_high_ends coordinate  -start_high_ends_coordinate 55.80
create_power_straps  -direction horizontal  -start_at 20.70 -nets  {row11/XVDD}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 57.30 -start_high_ends coordinate  -start_high_ends_coordinate 58.80

create_power_straps  -direction horizontal  -start_at 22.50 -nets  {row12/VBTM}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 4.60 -start_high_ends coordinate  -start_high_ends_coordinate 55.80
create_power_straps  -direction horizontal  -start_at 22.50 -nets  {row12/XVDD}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 57.30 -start_high_ends coordinate  -start_high_ends_coordinate 58.80

create_power_straps  -direction horizontal  -start_at 51.30 -nets  {row28/VBTM}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 4.60 -start_high_ends coordinate  -start_high_ends_coordinate 55.80
create_power_straps  -direction horizontal  -start_at 51.30 -nets  {row28/XVDD}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 57.30 -start_high_ends coordinate  -start_high_ends_coordinate 58.80

create_power_straps  -direction horizontal  -start_at 53.10 -nets  {row29/VBTM}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 4.60 -start_high_ends coordinate  -start_high_ends_coordinate 55.80
create_power_straps  -direction horizontal  -start_at 53.10 -nets  {row29/XVDD}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 57.30 -start_high_ends coordinate  -start_high_ends_coordinate 58.80

create_power_straps  -direction horizontal  -start_at 54.90 -nets  {row30/VBTM}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 4.60 -start_high_ends coordinate  -start_high_ends_coordinate 55.80
create_power_straps  -direction horizontal  -start_at 54.90 -nets  {row30/XVDD}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 57.30 -start_high_ends coordinate  -start_high_ends_coordinate 58.80

create_power_straps  -direction horizontal  -start_at 56.70 -nets  {row31/VBTM}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 4.60 -start_high_ends coordinate  -start_high_ends_coordinate 55.80
create_power_straps  -direction horizontal  -start_at 56.70 -nets  {row31/XVDD}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 57.30 -start_high_ends coordinate  -start_high_ends_coordinate 58.80

# cap 256
create_power_straps  -direction horizontal  -start_at 2.70 -nets  {row1/VBTM}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 4.60 -start_high_ends coordinate  -start_high_ends_coordinate 55.80
create_power_straps  -direction horizontal  -start_at 2.70 -nets  {row1/XVDD}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 57.30 -start_high_ends coordinate  -start_high_ends_coordinate 58.80

create_power_straps  -direction horizontal  -start_at 4.50 -nets  {row2/VBTM}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 4.60 -start_high_ends coordinate  -start_high_ends_coordinate 55.80
create_power_straps  -direction horizontal  -start_at 4.50 -nets  {row2/XVDD}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 57.30 -start_high_ends coordinate  -start_high_ends_coordinate 58.80

create_power_straps  -direction horizontal  -start_at 6.30 -nets  {row3/VBTM}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 4.60 -start_high_ends coordinate  -start_high_ends_coordinate 55.80
create_power_straps  -direction horizontal  -start_at 6.30 -nets  {row3/XVDD}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 57.30 -start_high_ends coordinate  -start_high_ends_coordinate 58.80

create_power_straps  -direction horizontal  -start_at 8.10 -nets  {row4/VBTM}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 4.60 -start_high_ends coordinate  -start_high_ends_coordinate 55.80
create_power_straps  -direction horizontal  -start_at 8.10 -nets  {row4/XVDD}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 57.30 -start_high_ends coordinate  -start_high_ends_coordinate 58.80

create_power_straps  -direction horizontal  -start_at 9.90 -nets  {row5/VBTM}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 4.60 -start_high_ends coordinate  -start_high_ends_coordinate 55.80
create_power_straps  -direction horizontal  -start_at 9.90 -nets  {row5/XVDD}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 57.30 -start_high_ends coordinate  -start_high_ends_coordinate 58.80

create_power_straps  -direction horizontal  -start_at 11.70 -nets  {row6/VBTM}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 4.60 -start_high_ends coordinate  -start_high_ends_coordinate 55.80
create_power_straps  -direction horizontal  -start_at 11.70 -nets  {row6/XVDD}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 57.30 -start_high_ends coordinate  -start_high_ends_coordinate 58.80

create_power_straps  -direction horizontal  -start_at 13.50 -nets  {row7/VBTM}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 4.60 -start_high_ends coordinate  -start_high_ends_coordinate 55.80
create_power_straps  -direction horizontal  -start_at 13.50 -nets  {row7/XVDD}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 57.30 -start_high_ends coordinate  -start_high_ends_coordinate 58.80

create_power_straps  -direction horizontal  -start_at 15.30 -nets  {row8/VBTM}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 4.60 -start_high_ends coordinate  -start_high_ends_coordinate 55.80
create_power_straps  -direction horizontal  -start_at 15.30 -nets  {row8/XVDD}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 57.30 -start_high_ends coordinate  -start_high_ends_coordinate 58.80

create_power_straps  -direction horizontal  -start_at 58.50 -nets  {row32/VBTM}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 4.60 -start_high_ends coordinate  -start_high_ends_coordinate 55.80
create_power_straps  -direction horizontal  -start_at 58.50 -nets  {row32/XVDD}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 57.30 -start_high_ends coordinate  -start_high_ends_coordinate 58.80

create_power_straps  -direction horizontal  -start_at 60.30 -nets  {row33/VBTM}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 4.60 -start_high_ends coordinate  -start_high_ends_coordinate 55.80
create_power_straps  -direction horizontal  -start_at 60.30 -nets  {row33/XVDD}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 57.30 -start_high_ends coordinate  -start_high_ends_coordinate 58.80

create_power_straps  -direction horizontal  -start_at 62.10 -nets  {row34/VBTM}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 4.60 -start_high_ends coordinate  -start_high_ends_coordinate 55.80
create_power_straps  -direction horizontal  -start_at 62.10 -nets  {row34/XVDD}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 57.30 -start_high_ends coordinate  -start_high_ends_coordinate 59.00

create_power_straps  -direction horizontal  -start_at 63.90 -nets  {row35/VBTM}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 4.60 -start_high_ends coordinate  -start_high_ends_coordinate 55.80
create_power_straps  -direction horizontal  -start_at 63.90 -nets  {row35/XVDD}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 57.30 -start_high_ends coordinate  -start_high_ends_coordinate 58.80

create_power_straps  -direction horizontal  -start_at 65.70 -nets  {row36/VBTM}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 4.60 -start_high_ends coordinate  -start_high_ends_coordinate 55.80
create_power_straps  -direction horizontal  -start_at 65.70 -nets  {row36/XVDD}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 57.30 -start_high_ends coordinate  -start_high_ends_coordinate 58.80

create_power_straps  -direction horizontal  -start_at 67.50 -nets  {row37/VBTM}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 4.60 -start_high_ends coordinate  -start_high_ends_coordinate 55.80
create_power_straps  -direction horizontal  -start_at 67.50 -nets  {row37/XVDD}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 57.30 -start_high_ends coordinate  -start_high_ends_coordinate 58.80

create_power_straps  -direction horizontal  -start_at 69.30 -nets  {row38/VBTM}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 4.60 -start_high_ends coordinate  -start_high_ends_coordinate 55.80
create_power_straps  -direction horizontal  -start_at 69.30 -nets  {row38/XVDD}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 57.30 -start_high_ends coordinate  -start_high_ends_coordinate 58.80

create_power_straps  -direction horizontal  -start_at 71.10 -nets  {row39/VBTM}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 4.60 -start_high_ends coordinate  -start_high_ends_coordinate 55.80
create_power_straps  -direction horizontal  -start_at 71.10 -nets  {row39/XVDD}  -layer M2 -width 0.2 -start_low_ends coordinate  -start_low_ends_coordinate 57.30 -start_high_ends coordinate  -start_high_ends_coordinate 58.80


# top plate 
create_power_straps  -direction horizontal  -start_at 2.70  -num_placement_strap 39 -increment_x_or_y 1.8 -nets  {CTOP}  -layer M5 -width 0.1 -start_low_ends coordinate  -start_low_ends_coordinate 7.80 -start_high_ends coordinate  -start_high_ends_coordinate 55.80 

create_power_straps  -direction horizontal  -start_at 0.90 -nets  {row0/VTOP0}  -layer M5 -width 0.1 -start_low_ends coordinate  -start_low_ends_coordinate 10.80 -start_high_ends coordinate  -start_high_ends_coordinate 57.30 

create_power_straps  -direction horizontal  -start_at 72.90 -nets  {row40/VTOP0}  -layer M5 -width 0.1 -start_low_ends coordinate  -start_low_ends_coordinate 4.60 -start_high_ends coordinate  -start_high_ends_coordinate 57.30 

create_power_straps  -direction vertical  -start_at 9.30 -num_placement_strap 16 -increment_x_or_y 3.0 -nets  {CTOP}  -layer M6 -width 0.10 -start_low_ends coordinate  -start_low_ends_coordinate 1.80 -start_high_ends coordinate  -start_high_ends_coordinate 72.00 -extend_low_ends off -extend_high_ends off

create_power_straps  -direction vertical -start_at 9.30 -nets  {CTOP}  -layer M6 -width 0.1 -start_low_ends coordinate  -start_low_ends_coordinate 0.90 -start_high_ends coordinate  -start_high_ends_coordinate 1.8 

create_power_straps  -direction horizontal  -start_at 0.90 -nets  {CTOP}  -layer M5 -width 0.1 -start_low_ends coordinate  -start_low_ends_coordinate 0.00 -start_high_ends coordinate  -start_high_ends_coordinate 9.30


# VDD VSS FILL


derive_pg_connection -power_net VDD -power_pin VDD -ground_net VSS -ground_pin VSS
insert_stdcell_filler -cell_without_metal "FILL4 FILL2 FILL1"	\
	-respect_keepout 	\
	-connect_to_power VDD  -connect_to_ground VSS

create_power_straps  -direction vertical  -start_at 0.2500 -nets  {VDD}  -layer M2 -width 0.5 -start_low_ends coordinate  -start_high_ends coordinate  -start_high_ends_coordinate 73.8 -look_inside_std_cells
create_power_straps  -direction vertical  -start_at 1.00 -nets  {VSS}  -layer M2 -width 0.5 -start_low_ends coordinate  -start_high_ends coordinate  -start_high_ends_coordinate 73.8 -look_inside_std_cells

# Routing

set_ignored_layers -min_routing M2 -max_routing_layer $TOP_RT_METAL
set_route_mode_options -zroute true
set_route_opt_strategy -search_repair_loop 8

set_route_zrt_common_options -post_detail_route_redundant_via_insertion high

route_zrt_eco -nets {row*/VBTM}
route_zrt_detail
route_zrt_eco
route_zrt_detail

create_text {VDD} -layer {TEXT2} -height 0.2 -origin {0.25 1}
create_text {VSS} -layer {TEXT2} -height 0.2 -origin {1.0 1}


create_macro_fram -preserve_all_metal_blockage -identify_macro_pin_by_pin_text -extract_pin_connectivity_through { v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 bv1 bv2} -m1_pin_text_layers {TEXT1} -m2_pin_text_layers {TEXT2} -m3_pin_text_layers {TEXT3} -m4_pin_text_layers {TEXT4} -m5_pin_text_layers {TEXT5} -m6_pin_text_layers {TEXT6} -m7_pin_text_layers {TEXT7} -m8_pin_text_layers {TEXT8} -m9_pin_text_layers {TEXT9} -pin_must_connect_area_layer_number { m1 31 m2 32 m3 33 m4 34 m5 35 m6 36 m7 37 m8 M8 m9 M9} -auto_pin_must_connect_area_threshold { m1 0.01 m2 0.01 m3 0.01 m4 0.01 m5 0.01 m6 0.01} -extract_via_on_layer { v1 v2 v3 v4 v5 v6}

save_mw_cel

close_mw_cel


# BTSW100
set RTL_PATH    ../src/btsw100m.v
set MODULE_NAME BTSW100

read_verilog -top $MODULE_NAME -allow_black_box $RTL_PATH
uniquify_fp_mw_cel

# The physical information set, including floorplan area and allowed routing metal
set TILE_HT 1.8
set TILE_WD 0.2
set CORE_ROW 5 
set CORE_COL 71
set MOMCP_WD 21
set CORE_HT [expr {$TILE_HT * $CORE_ROW}]
set CORE_WD [expr {$TILE_WD * $CORE_COL}]
set TOP_RT_METAL M5

create_floorplan -control_type width_and_height \
		 -core_width  $CORE_WD \
		 -core_height $CORE_HT 

set_ignored_layers -min_routing M2 -max_routing_layer $TOP_RT_METAL

check_legality


# Pin Assignment
set obj [get_terminal {"CK"}]
set_attribute -quiet $obj layer  M4
set_attribute -quiet $obj owner_port  {CK}
set_attribute -quiet $obj bbox {{9.45 0.00} {9.55 0.10}}

set obj [get_terminal {"VOUT"}]
set_attribute -quiet $obj layer  M4
set_attribute -quiet $obj owner_port  {VOUT}
set_attribute -quiet $obj bbox {{2.80 8.90} {2.90 9.00}}

set obj [get_terminal {"VIN"}]
set_attribute -quiet $obj layer  M4
set_attribute -quiet $obj owner_port  {VIN}
set_attribute -quiet $obj bbox {{2.90 0.00} {3.00 0.10}}

set_undoable_attribute [get_cells -all smp_sw0] origin {1.600 3.6}
set_undoable_attribute [get_cells -all smp_sw0] orientation {FS}
set_undoable_attribute [get_cells -all smp_sw0] is_fixed {1}

set_undoable_attribute [get_cells -all chinv0] origin {14.20 0.000}
set_undoable_attribute [get_cells -all chinv0] orientation {FN}
set_undoable_attribute [get_cells -all chinv0] is_fixed {1}

set_undoable_attribute [get_cells -all axl0] origin {1.60 0.000}
set_undoable_attribute [get_cells -all axl0] orientation {N}
set_undoable_attribute [get_cells -all axl0] is_fixed {1}

set_undoable_attribute [get_cells -all inp_sw0] origin {3.80 0.000}
set_undoable_attribute [get_cells -all inp_sw0] orientation {FN}
set_undoable_attribute [get_cells -all inp_sw0] is_fixed {1}

set_undoable_attribute [get_cells -all axl1] origin {0.00 0.000}
set_undoable_attribute [get_cells -all axl1] orientation {N}
set_undoable_attribute [get_cells -all axl1] is_fixed {1}

set_undoable_attribute [get_cells -all axl2] origin {0.00 3.600}
set_undoable_attribute [get_cells -all axl2] orientation {FS}
set_undoable_attribute [get_cells -all axl2] is_fixed {1}

set_undoable_attribute [get_cells -all axl3] origin {0.00 3.600}
set_undoable_attribute [get_cells -all axl3] orientation {N}
set_undoable_attribute [get_cells -all axl3] is_fixed {1}

set_undoable_attribute [get_cells -all axl4] origin {0.00 7.200}
set_undoable_attribute [get_cells -all axl4] orientation {FS}
set_undoable_attribute [get_cells -all axl4] is_fixed {1}

set_undoable_attribute [get_cells -all axl5] origin {0.00 7.200}
set_undoable_attribute [get_cells -all axl5] orientation {N}
set_undoable_attribute [get_cells -all axl5] is_fixed {1}

set_undoable_attribute [get_cells -all axl6] origin {0.80 0.000}
set_undoable_attribute [get_cells -all axl6] orientation {N}
set_undoable_attribute [get_cells -all axl6] is_fixed {1}

set_undoable_attribute [get_cells -all axl7] origin {0.80 3.600}
set_undoable_attribute [get_cells -all axl7] orientation {FS}
set_undoable_attribute [get_cells -all axl7] is_fixed {1}

set_undoable_attribute [get_cells -all axl8] origin {0.80 3.600}
set_undoable_attribute [get_cells -all axl8] orientation {N}
set_undoable_attribute [get_cells -all axl8] is_fixed {1}

set_undoable_attribute [get_cells -all axl9] origin {0.80 7.200}
set_undoable_attribute [get_cells -all axl9] orientation {FS}
set_undoable_attribute [get_cells -all axl9] is_fixed {1}

set_undoable_attribute [get_cells -all axl10] origin {0.80 7.200}
set_undoable_attribute [get_cells -all axl10] orientation {N}
set_undoable_attribute [get_cells -all axl10] is_fixed {1}




create_placement_blockage -bbox {4.000 1.800 14.20 9.000} -type soft -name MOMARY


set_fp_placement_strategy -pin_routing_aware true
create_fp_placement -effort high

set_ignored_layers -min_routing M2 -max_routing_layer $TOP_RT_METAL
set_route_mode_options -zroute true
set_route_opt_strategy -search_repair_loop 8


set_route_zrt_common_options -post_detail_route_redundant_via_insertion high

derive_pg_connection -power_net VDD -power_pin VDD -ground_net VSS -ground_pin VSS

create_power_straps  -direction vertical  -start_at 0.200 -nets  {VSS}  -layer M2 -width 0.32 -start_low_ends coordinate  -start_high_ends coordinate  -start_high_ends_coordinate 9.00 -extend_low_ends off -extend_high_ends off -look_inside_std_cells
create_power_straps  -direction vertical  -start_at 1.000 -nets  {VDD}  -layer M2 -width 0.32 -start_low_ends coordinate  -start_high_ends coordinate  -start_high_ends_coordinate 9.00 -extend_low_ends off -extend_high_ends off -look_inside_std_cells
create_power_straps  -direction horizontal  -start_at 3.600 -nets  {VSS}  -layer M1 -width 0.33 -start_low_ends coordinate  -start_low_ends_coordinate 4.0 -start_high_ends coordinate  -start_high_ends_coordinate 14.20 -extend_low_ends off -extend_high_ends off -look_inside_std_cells
create_power_straps  -direction horizontal  -start_at 5.400 -nets  {VDD}  -layer M1 -width 0.33 -start_low_ends coordinate  -start_low_ends_coordinate 4.0 -start_high_ends coordinate  -start_high_ends_coordinate 14.20 -extend_low_ends off -extend_high_ends off -look_inside_std_cells
create_power_straps  -direction horizontal  -start_at 7.200 -nets  {VSS}  -layer M1 -width 0.33 -start_low_ends coordinate  -start_low_ends_coordinate 4.0 -start_high_ends coordinate  -start_high_ends_coordinate 14.20 -extend_low_ends off -extend_high_ends off -look_inside_std_cells


route_zrt_eco -nets {VBST}
route_zrt_detail


create_power_straps  -direction vertical  -start_at 2.800 -nets  {VOUT}  -layer M4 -width 0.32 -start_low_ends coordinate  -start_low_ends_coordinate 3.10 -start_high_ends coordinate  -start_high_ends_coordinate 9.00 -extend_low_ends off -extend_high_ends off -look_inside_std_cells

set ORIGIN_X 4.8
set ORIGIN_Y 1.9
source ../script/mom_gen.tcl

set ORIGIN_X 4.8
set ORIGIN_Y 3.7
source ../script/mom_gen.tcl

set ORIGIN_X 4.8
set ORIGIN_Y 5.5
source ../script/mom_gen.tcl

set ORIGIN_X 4.8
set ORIGIN_Y 7.3
source ../script/mom_gen.tcl

route_zrt_eco -nets {CAPN}
route_zrt_detail

create_power_straps  -direction horizontal  -start_at 0.600 -nets  {VIN}  -layer M3 -width 0.32 -start_low_ends coordinate  -start_low_ends_coordinate 2.9 -start_high_ends coordinate  -start_high_ends_coordinate 3.4 -extend_high_ends off -look_inside_std_cells

create_power_straps  -direction vertical  -start_at 3.000 -nets  {VIN}  -layer M4 -width 0.32 -start_low_ends coordinate  -start_high_ends coordinate  -start_high_ends_coordinate 2.3 -extend_high_ends off -look_inside_std_cells

route_zrt_eco -nets {VIN}
route_zrt_detail

create_power_straps  -direction vertical  -start_at 13.9 -nets  {CAPP}  -layer M2 -width 0.1 -start_low_ends coordinate  -start_low_ends_coordinate 1.7 -start_high_ends coordinate  -start_high_ends_coordinate 8.0 -extend_low_ends off -extend_high_ends off -look_inside_std_cells

create_power_straps  -direction horizontal  -start_at 2.24 -num_placement_strap 4 -increment_x_or_y 1.8 -nets {CAPP}  -layer M3 -width 0.32 -start_low_ends coordinate  -start_low_ends_coordinate 13.20  -start_high_ends coordinate  -start_high_ends_coordinate 14.00 -extend_low_ends off -extend_high_ends off -ignore_parallel_targets

route_zrt_eco -nets {VBST}
route_zrt_detail

route_zrt_eco -nets {UPIN}
route_zrt_detail

route_zrt_eco -nets {XVDD XVSS}
route_zrt_detail

route_zrt_eco
route_zrt_detail

insert_stdcell_filler -cell_without_metal "FILL4 FILL2 FILL1"	\
	-respect_keepout  	-between_std_cells_only \
	-connect_to_power VDD  -connect_to_ground VSS



create_text {CK}  -layer {TEXT4} -height 0.1 -origin {9.50 0.05}
create_text {VIN} -layer {TEXT4} -height 0.1 -origin {2.95 0.05}
create_text {VOUT} -layer {TEXT4} -height 0.1 -origin {2.85 8.95}
create_text {VSS} -layer {TEXT2} -height 0.2 -origin {0.2 0.05}
create_text {VDD} -layer {TEXT2} -height 0.2 -origin {1.0 0.05}


create_macro_fram -preserve_all_metal_blockage -identify_macro_pin_by_pin_text -extract_pin_connectivity_through { v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 bv1 bv2} -m1_pin_text_layers {TEXT1} -m2_pin_text_layers {TEXT2} -m3_pin_text_layers {TEXT3} -m4_pin_text_layers {TEXT4} -m5_pin_text_layers {TEXT5} -m6_pin_text_layers {TEXT6} -m7_pin_text_layers {TEXT7} -m8_pin_text_layers {TEXT8} -m9_pin_text_layers {TEXT9} -pin_must_connect_area_layer_number { m1 31 m2 32 m3 33 m4 34 m5 35 m6 36 m7 37 m8 M8 m9 M9} -auto_pin_must_connect_area_threshold { m1 0.01 m2 0.01 m3 0.01 m4 0.01 m5 0.01 m6 0.01} -extract_via_on_layer { v1 v2 v3 v4 v5 v6}


save_mw_cel

close_mw_cel


# COMP
set RTL_PATH    ../src/comp.v
set MODULE_NAME COMP

read_verilog -top $MODULE_NAME -allow_black_box $RTL_PATH
uniquify_fp_mw_cel

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


create_macro_fram -preserve_all_metal_blockage -identify_macro_pin_by_pin_text -extract_pin_connectivity_through { v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 bv1 bv2} -m1_pin_text_layers {TEXT1} -m2_pin_text_layers {TEXT2} -m3_pin_text_layers {TEXT3} -m4_pin_text_layers {TEXT4} -m5_pin_text_layers {TEXT5} -m6_pin_text_layers {TEXT6} -m7_pin_text_layers {TEXT7} -m8_pin_text_layers {TEXT8} -m9_pin_text_layers {TEXT9} -pin_must_connect_area_layer_number { m1 31 m2 32 m3 33 m4 34 m5 35 m6 36 m7 37 m8 M8 m9 M9} -auto_pin_must_connect_area_threshold { m1 0.01 m2 0.01 m3 0.01 m4 0.01 m5 0.01 m6 0.01} -extract_via_on_layer { v1 v2 v3 v4 v5 v6}

save_mw_cel

close_mw_cel


# top
# The milkyway lib path and input/output path

set RTL_PATH   ../src/top.v
set MODULE_NAME ADC_LP_01
set VERSION     _v1
set GDS_PATH aprout/$MODULE_NAME$VERSION.gds


read_verilog -top $MODULE_NAME -allow_black_box $RTL_PATH
uniquify_fp_mw_cel


# The physical information set, including floorplan area and allowed routing metal


set TILE_HT 1.8
set TILE_WD 0.2
set CORE_ROW 41
set CORE_COL 1030
set CORE_HT [expr {$TILE_HT * $CORE_ROW}]
set CORE_WD [expr {$TILE_WD * $CORE_COL}]
set TOP_RT_METAL M5

create_floorplan -control_type width_and_height \
		 -core_width  $CORE_WD \
		 -core_height $CORE_HT \
		 -bottom_io2core 0.2 -top_io2core 0.2 -left_io2core 0.2 -right_io2core 0.2
set_ignored_layers -min_routing M2 -max_routing_layer $TOP_RT_METAL

check_legality

#set_top_implementation_options -block_references CDAC11b_H
#change_macro_view -reference CDAC11b_H -view FRAM

#set_top_implementation_options -block_references COMP
#change_macro_view -reference COMP -view FRAM


set_undoable_attribute [get_cells -all I_17] origin {85.2 0.2}
set_undoable_attribute [get_cells -all I_17] orientation {FN}
set_undoable_attribute [get_cells -all I_17] is_fixed {1}

set_undoable_attribute [get_cells -all I_18] origin {121.2 0.2}
set_undoable_attribute [get_cells -all I_18] orientation {N}
set_undoable_attribute [get_cells -all I_18] is_fixed {1}

set_undoable_attribute [get_cells -all X0] origin {103.0 3.8}
set_undoable_attribute [get_cells -all X0] orientation {FN}
set_undoable_attribute [get_cells -all X0] is_fixed {1}

set_undoable_attribute [get_cells -all X1] origin {103.4 3.8}
set_undoable_attribute [get_cells -all X1] orientation {N}
set_undoable_attribute [get_cells -all X1] is_fixed {1}

set_undoable_attribute [get_cells -all I0] origin {93.4 14.6}
set_undoable_attribute [get_cells -all I0] orientation {N}
set_undoable_attribute [get_cells -all I0] is_fixed {1}

set_undoable_attribute [get_cells -all I_115] origin {95.6 0.20}
set_undoable_attribute [get_cells -all I_115] orientation {N}
set_undoable_attribute [get_cells -all I_115] is_fixed {1}

set_undoable_attribute [get_cells -all I_113] origin {97.0 0.20}
set_undoable_attribute [get_cells -all I_113] orientation {N}
set_undoable_attribute [get_cells -all I_113] is_fixed {1}

set_undoable_attribute [get_cells -all I_112] origin {97.0 3.8}
set_undoable_attribute [get_cells -all I_112] orientation {FS}
set_undoable_attribute [get_cells -all I_112] is_fixed {1}

set_undoable_attribute [get_cells -all I_114] origin {101.6 3.8}
set_undoable_attribute [get_cells -all I_114] orientation {FS}
set_undoable_attribute [get_cells -all I_114] is_fixed {1}


create_placement_blockage -bbox {85.2 0.200 87.2 74.000} -type hard -name pl01

create_placement_blockage -bbox {119.20 0.200 121.20 74.000} -type hard -name pl02

create_placement_blockage -bbox {87.20 7.400 88.80 21.800} -type hard -name pl03

create_placement_blockage -bbox {117.60 7.400 119.20 21.800} -type hard -name pl04

create_placement_blockage -bbox {87.20 3.800 88.80 7.400} -type hard -name pl05

create_placement_blockage -bbox {117.60 3.800 119.20 7.400} -type hard -name pl06

create_placement_blockage -bbox {87.20 29.000 88.80 74.000} -type hard -name pl07

create_placement_blockage -bbox {117.60 29.000 119.20 74.000} -type hard -name pl08

create_placement_blockage -bbox {87.20 21.800 119.20 29.000} -type hard -name pl09

create_placement_blockage -bbox {87.20 0.200 88.80 3.800} -type hard -name pl10

create_placement_blockage -bbox {117.60 0.200 119.20 3.800} -type hard -name pl11

create_placement_blockage -bbox {88.80 0.200 117.60 3.800} -type hard -name pl12

create_placement_blockage -bbox {0.200 0.200 25.800 74.000} -type hard -name pl13

create_placement_blockage -bbox {180.600 0.200 206.200 74.000} -type hard -name pl14

create_placement_blockage -bbox {88.800 12.800 117.600 21.800} -type hard -name pl15


set obj [get_terminal {"C1"}]
set_attribute -quiet $obj layer  M4
set_attribute -quiet $obj owner_port  {C1}
set_attribute -quiet $obj bbox {{89.25 74.1} {89.35 74.2}}
create_text {C1}  -layer {TEXT4} -height 0.1 -origin {89.3 74.15}

set obj [get_terminal {"C2"}]
set_attribute -quiet $obj layer  M4
set_attribute -quiet $obj owner_port  {C2}
set_attribute -quiet $obj bbox {{90.85 74.1} {90.95 74.2}}
create_text {C2}  -layer {TEXT4} -height 0.1 -origin {90.9 74.15}

set obj [get_terminal {"C3"}]
set_attribute -quiet $obj layer  M4
set_attribute -quiet $obj owner_port  {C3}
set_attribute -quiet $obj bbox {{92.25 74.10} {92.35 74.20}}
create_text {C3}  -layer {TEXT4} -height 0.1 -origin {92.3 74.15}

set obj [get_terminal {"Vdel"}]
set_attribute -quiet $obj layer  M4
set_attribute -quiet $obj owner_port  {Vdel}
set_attribute -quiet $obj bbox {{101.45 0.0} {101.55 0.1}}
create_text {Vdel}  -layer {TEXT4} -height 0.1 -origin {101.5 0.05}

set obj [get_terminal {"CLK"}]
set_attribute -quiet $obj layer  M4
set_attribute -quiet $obj owner_port  {CLK}
set_attribute -quiet $obj bbox {{95.75 0.0} {95.85 0.1}}
create_text {CLK}  -layer {TEXT4} -height 0.1 -origin {95.80 0.05}

set obj [get_terminal {"VIP"}]
set_attribute -quiet $obj layer  M4
set_attribute -quiet $obj owner_port  {VIP}
set_attribute -quiet $obj bbox {{99.95 0.0} {100.05 0.1}}
create_text {VIP}  -layer {TEXT4} -height 0.1 -origin {100.0 0.05}

set obj [get_terminal {"VIN"}]
set_attribute -quiet $obj layer  M4
set_attribute -quiet $obj owner_port  {VIN}
set_attribute -quiet $obj bbox {{106.35 0.0} {106.45 0.1}}
create_text {VIN}  -layer {TEXT4} -height 0.1 -origin {106.4 0.05}

set obj [get_terminal {"B0"}]
set_attribute -quiet $obj layer  M4
set_attribute -quiet $obj owner_port  {B0}
set_attribute -quiet $obj bbox {{93.85 74.1} {93.95 74.2}}
create_text {B0}  -layer {TEXT4} -height 0.1 -origin {93.9 74.15}

set obj [get_terminal {"B1"}]
set_attribute -quiet $obj layer  M4
set_attribute -quiet $obj owner_port  {B1}
set_attribute -quiet $obj bbox {{95.25 74.1} {95.35 74.2}}
create_text {B1}  -layer {TEXT4} -height 0.1 -origin {95.3 74.15}

set obj [get_terminal {"B2"}]
set_attribute -quiet $obj layer  M4
set_attribute -quiet $obj owner_port  {B2}
set_attribute -quiet $obj bbox {{96.65 74.1} {96.75 74.2}}
create_text {B2}  -layer {TEXT4} -height 0.1 -origin {96.7 74.15}

set obj [get_terminal {"B3"}]
set_attribute -quiet $obj layer  M4
set_attribute -quiet $obj owner_port  {B3}
set_attribute -quiet $obj bbox {{98.25 74.1} {98.35 74.2}}
create_text {B3}  -layer {TEXT4} -height 0.1 -origin {98.3 74.15}

set obj [get_terminal {"B4"}]
set_attribute -quiet $obj layer  M4
set_attribute -quiet $obj owner_port  {B4}
set_attribute -quiet $obj bbox {{99.45 74.1} {99.55 74.2}}
create_text {B4}  -layer {TEXT4} -height 0.1 -origin {99.5 74.15}

set obj [get_terminal {"B5"}]
set_attribute -quiet $obj layer  M4
set_attribute -quiet $obj owner_port  {B5}
set_attribute -quiet $obj bbox {{101.45 74.1} {101.55 74.2}}
create_text {B5}  -layer {TEXT4} -height 0.1 -origin {101.5 74.15}

set obj [get_terminal {"B6"}]
set_attribute -quiet $obj layer  M4
set_attribute -quiet $obj owner_port  {B6}
set_attribute -quiet $obj bbox {{104.85 74.1} {104.95 74.2}}
create_text {B6}  -layer {TEXT4} -height 0.1 -origin {104.9 74.15}

set obj [get_terminal {"B7"}]
set_attribute -quiet $obj layer  M4
set_attribute -quiet $obj owner_port  {B7}
set_attribute -quiet $obj bbox {{106.65 74.1} {106.75 74.2}}
create_text {B7}  -layer {TEXT4} -height 0.1 -origin {106.7 74.15}

set obj [get_terminal {"B8"}]
set_attribute -quiet $obj layer  M4
set_attribute -quiet $obj owner_port  {B8}
set_attribute -quiet $obj bbox {{108.05 74.1} {108.15 74.2}}
create_text {B8}  -layer {TEXT4} -height 0.1 -origin {108.1 74.15}

set obj [get_terminal {"B9"}]
set_attribute -quiet $obj layer  M4
set_attribute -quiet $obj owner_port  {B9}
set_attribute -quiet $obj bbox {{109.25 74.1} {109.35 74.2}}
create_text {B9}  -layer {TEXT4} -height 0.1 -origin {109.3 74.15}

set obj [get_terminal {"B10"}]
set_attribute -quiet $obj layer  M4
set_attribute -quiet $obj owner_port  {B10}
set_attribute -quiet $obj bbox {{110.85 74.1} {110.95 74.2}}
create_text {B10}  -layer {TEXT4} -height 0.1 -origin {110.9 74.15}

set obj [get_terminal {"READY"}]
set_attribute -quiet $obj layer  M4
set_attribute -quiet $obj owner_port  {READY}
set_attribute -quiet $obj bbox {{112.25 74.1} {112.35 74.2}}
create_text {READY}  -layer {TEXT4} -height 0.1 -origin {112.3 74.15}

# Initial placement
set_fp_placement_strategy -pin_routing_aware true
create_fp_placement  -effort low 

set_dont_touch [get_cells *]
# Place opt
set_ignored_layers -min_routing M2 -max_routing_layer M5
set_route_mode_options -zroute true

set_optimize_pre_cts_power_options -low_power_placement true
set_place_opt_strategy -consider_routing true
set_separate_process_options -placement false
place_opt -area_recovery -effort low

create_net -power AVDD
create_net -ground AVSS

derive_pg_connection -power_net AVDD -cells X0
derive_pg_connection -power_net AVDD -cells X1
derive_pg_connection -power_net AVDD -cells I0
derive_pg_connection -power_net AVDD -cells I_112
derive_pg_connection -power_net AVDD -cells I_113
derive_pg_connection -power_net AVDD -cells I_114
derive_pg_connection -power_net AVDD -cells I_115

derive_pg_connection -ground_net AVSS -cells X0
derive_pg_connection -ground_net AVSS -cells X1
derive_pg_connection -ground_net AVSS -cells I0
derive_pg_connection -ground_net AVSS -cells I_112
derive_pg_connection -ground_net AVSS -cells I_113
derive_pg_connection -ground_net AVSS -cells I_114
derive_pg_connection -ground_net AVSS -cells I_115

create_net -power VREFP
create_net -ground VREFN

derive_pg_connection -power_net VREFP -cells I_17
derive_pg_connection -power_net VREFP -cells I_18
derive_pg_connection -ground_net VREFN -cells I_17
derive_pg_connection -ground_net VREFN -cells I_18

derive_pg_connection -power_net VDD -power_pin VDD -ground_net VSS -ground_pin VSS

create_placement_blockage -bbox {88.8 29.000 117.6 74.000} -type hard -name pl16

insert_stdcell_filler -cell_without_metal "FILL4 FILL2 FILL1"	\
	-respect_keepout 	\
	-connect_to_power AVDD  -connect_to_ground AVSS

remove_placement_blockage pl03
remove_placement_blockage pl04
remove_placement_blockage pl12
insert_stdcell_filler -cell_without_metal "DCAP8 DCAP4 DCAP"	\
	-respect_keepout 	\
	-connect_to_power AVDD  -connect_to_ground AVSS
insert_stdcell_filler -cell_without_metal "FILL4 FILL2 FILL1"	\
	-respect_keepout 	\
	-connect_to_power AVDD  -connect_to_ground AVSS

remove_placement_blockage pl15
create_placement_blockage -bbox {88.8 14.600 89.4 21.800} -type hard -name pl17
create_placement_blockage -bbox {89.4 14.600 90.2 21.800} -type hard -name pl18
create_placement_blockage -bbox {117.0 14.600 117.6 21.800} -type hard -name pl19
create_placement_blockage -bbox {116.2 14.600 117.0 21.800} -type hard -name pl20
insert_stdcell_filler -cell_without_metal "DCAP8"	\
	-respect_keepout 	\
	-connect_to_power AVDD  -connect_to_ground AVSS
remove_placement_blockage pl18
remove_placement_blockage pl20
insert_stdcell_filler -cell_without_metal "DCAP4"	\
	-respect_keepout 	\
	-connect_to_power AVDD  -connect_to_ground AVSS
remove_placement_blockage pl17
remove_placement_blockage pl19
insert_stdcell_filler -cell_without_metal "DCAP"	\
	-respect_keepout 	\
	-connect_to_power AVDD  -connect_to_ground AVSS

remove_placement_blockage pl07
remove_placement_blockage pl08
insert_stdcell_filler -cell_without_metal "DCAP8 DCAP4"	\
	-respect_keepout 	\
	-connect_to_power VDD  -connect_to_ground VSS
remove_placement_blockage pl16
insert_stdcell_filler -cell_without_metal "DCAP8 DCAP4"	\
	-respect_keepout 	\
	-connect_to_power VDD  -connect_to_ground VSS

insert_stdcell_filler -cell_without_metal "FILL4 FILL2 FILL1"	\
	-respect_keepout 	\
	-connect_to_power VDD  -connect_to_ground VSS

remove_placement_blockage pl13
remove_placement_blockage pl14
insert_stdcell_filler -cell_without_metal "DCAP32"	\
	-respect_keepout 	\
	-connect_to_power VREFP  -connect_to_ground VREFN


create_power_straps  -direction vertical  -start_at 88.200 -nets  {VDD}  -layer M2 -width 1.0 -start_low_ends coordinate  -start_low_ends_coordinate 29.0 -start_high_ends coordinate  -start_high_ends_coordinate 74.0 -extend_low_ends off -extend_high_ends off -look_inside_std_cells
create_power_straps  -direction vertical  -start_at 118.200 -nets  {VSS}  -layer M2 -width 1.0 -start_low_ends coordinate  -start_low_ends_coordinate 29.0 -start_high_ends coordinate  -start_high_ends_coordinate 74.0 -extend_low_ends off -extend_high_ends off -look_inside_std_cells
create_power_straps  -direction vertical  -start_at 87.700 -nets  {AVDD}  -layer M2 -width 1.0 -start_low_ends coordinate  -start_low_ends_coordinate 7.4 -start_high_ends coordinate  -start_high_ends_coordinate 21.8 -extend_low_ends off -extend_high_ends off -look_inside_std_cells
create_power_straps  -direction vertical  -start_at 118.700 -nets  {AVSS}  -layer M2 -width 1.0 -start_low_ends coordinate  -start_low_ends_coordinate 7.4 -start_high_ends coordinate  -start_high_ends_coordinate 21.8 -extend_low_ends off -extend_high_ends off -look_inside_std_cells
create_power_straps  -direction vertical  -start_at 104.4 -nets  {AVDD}  -layer M2 -width 0.32 -start_low_ends coordinate  -start_low_ends_coordinate 0.2 -start_high_ends coordinate  -start_high_ends_coordinate 3.8 -extend_low_ends off -extend_high_ends off -look_inside_std_cells
create_power_straps  -direction vertical  -start_at 103.6 -nets  {AVSS}  -layer M2 -width 0.32 -start_low_ends coordinate  -start_low_ends_coordinate 0.2 -start_high_ends coordinate  -start_high_ends_coordinate 3.8 -extend_low_ends off -extend_high_ends off -look_inside_std_cells

create_power_straps  -direction horizontal  -start_at 22.300 -nets  {VREFN}  -layer M3 -width 0.5 -start_low_ends coordinate  -start_low_ends_coordinate 83.95 -start_high_ends coordinate  -start_high_ends_coordinate 122.45 -extend_low_ends off -extend_high_ends off -look_inside_std_cells
create_power_straps  -direction horizontal  -start_at 23.100 -nets  {VREFP}  -layer M3 -width 0.5 -start_low_ends coordinate  -start_low_ends_coordinate 84.70 -start_high_ends coordinate  -start_high_ends_coordinate 121.70 -extend_low_ends off -extend_high_ends off -look_inside_std_cells

create_power_straps  -direction horizontal  -start_at 25.900 -nets  {VREFN}  -layer M3 -width 0.5 -start_low_ends coordinate  -start_low_ends_coordinate 83.95 -start_high_ends coordinate  -start_high_ends_coordinate 122.45 -extend_low_ends off -extend_high_ends off -look_inside_std_cells
create_power_straps  -direction horizontal  -start_at 26.700 -nets  {VREFP}  -layer M3 -width 0.5 -start_low_ends coordinate  -start_low_ends_coordinate 84.70 -start_high_ends coordinate  -start_high_ends_coordinate 121.70 -extend_low_ends off -extend_high_ends off -look_inside_std_cells

create_power_straps  -direction vertical  -start_at 100.00 -nets  {VIP}  -layer M4 -width 0.32 -start_low_ends coordinate  -start_low_ends_coordinate 0.00 -start_high_ends coordinate  -start_high_ends_coordinate 3.80 -look_inside_std_cells
create_power_straps  -direction vertical  -start_at 106.40 -nets  {VIN}  -layer M4 -width 0.32 -start_low_ends coordinate  -start_low_ends_coordinate 0.00 -start_high_ends coordinate  -start_high_ends_coordinate 3.80 -look_inside_std_cells

create_power_straps  -direction horizontal  -start_at 3.900 -nets  {clks}  -layer M3 -width 0.20 -start_low_ends coordinate  -start_low_ends_coordinate 93.45 -start_high_ends coordinate  -start_high_ends_coordinate 112.95 -look_inside_std_cells
#create_power_straps  -direction horizontal  -start_at 2.890 -nets  {clks}  -layer M1 -width 0.10 -start_low_ends coordinate  -start_low_ends_coordinate 102.65 -start_high_ends coordinate  -start_high_ends_coordinate 102.8 -look_inside_std_cells
#create_power_straps  -direction vertical  -start_at 103.200 -nets  {clks}  -layer M2 -width 0.10 -start_low_ends coordinate  -start_low_ends_coordinate 2.84 -start_high_ends coordinate  -start_high_ends_coordinate 4.6 -look_inside_std_cells

create_power_straps  -direction vertical  -start_at 95.800 -nets  {CLK}  -layer M4 -width 0.32 -start_low_ends coordinate  -start_low_ends_coordinate 0.00 -start_high_ends coordinate  -start_high_ends_coordinate 1.09 -look_inside_std_cells

create_power_straps  -direction horizontal  -start_at 31.85 -nets  {Vdel}  -layer M3 -width 0.32 -start_low_ends coordinate  -start_low_ends_coordinate 90.65 -start_high_ends coordinate  -start_high_ends_coordinate 101.66 -look_inside_std_cells
create_power_straps  -direction horizontal  -start_at 29.75 -nets  {Vdel}  -layer M3 -width 0.32 -start_low_ends coordinate  -start_low_ends_coordinate 93.40 -start_high_ends coordinate  -start_high_ends_coordinate 101.66 -look_inside_std_cells
create_power_straps  -direction vertical  -start_at 101.500 -nets  {Vdel}  -layer M4 -width 0.32 -start_low_ends coordinate  -start_low_ends_coordinate 0.00 -start_high_ends coordinate  -start_high_ends_coordinate 32.01 -look_inside_std_cells

create_power_straps  -direction vertical  -start_at 100.200 -nets  {net57}  -layer M4 -width 0.32 -start_low_ends coordinate  -start_low_ends_coordinate 12.80 -start_high_ends coordinate  -start_high_ends_coordinate 15.585 -look_inside_std_cells
create_power_straps  -direction vertical  -start_at 99.570 -nets  {net57}  -layer M4 -width 0.20 -start_low_ends coordinate  -start_low_ends_coordinate 3.00 -start_high_ends coordinate  -start_high_ends_coordinate 7.07 -look_inside_std_cells
create_power_straps  -direction horizontal  -start_at 3.100 -nets  {net57}  -layer M3 -width 0.20 -start_low_ends coordinate  -start_low_ends_coordinate 86.00 -start_high_ends coordinate  -start_high_ends_coordinate 99.670 -look_inside_std_cells
create_power_straps  -direction horizontal  -start_at 1.100 -nets  {net57}  -layer M5 -width 0.10 -start_low_ends coordinate  -start_low_ends_coordinate 85.2 -start_high_ends coordinate  -start_high_ends_coordinate 86.20 -look_inside_std_cells
create_power_straps  -direction vertical  -start_at 86.100 -nets  {net57}  -layer M4 -width 0.20 -start_low_ends coordinate  -start_low_ends_coordinate 1.050 -start_high_ends coordinate  -start_high_ends_coordinate 3.20 -look_inside_std_cells


create_power_straps  -direction vertical  -start_at 106.200 -nets  {net55}  -layer M4 -width 0.32 -start_low_ends coordinate  -start_low_ends_coordinate 12.80 -start_high_ends coordinate  -start_high_ends_coordinate 15.585 -look_inside_std_cells
create_power_straps  -direction vertical  -start_at 106.830 -nets  {net55}  -layer M4 -width 0.20 -start_low_ends coordinate  -start_low_ends_coordinate 3.00 -start_high_ends coordinate  -start_high_ends_coordinate 7.07 -look_inside_std_cells
create_power_straps  -direction horizontal  -start_at 3.100 -nets  {net55}  -layer M3 -width 0.20 -start_low_ends coordinate  -start_low_ends_coordinate 106.73 -start_high_ends coordinate  -start_high_ends_coordinate 120.40 -look_inside_std_cells
create_power_straps  -direction horizontal  -start_at 1.100 -nets  {net55}  -layer M5 -width 0.10 -start_low_ends coordinate  -start_low_ends_coordinate 120.2 -start_high_ends coordinate  -start_high_ends_coordinate 121.20 -look_inside_std_cells
create_power_straps  -direction vertical  -start_at 120.3 -nets  {net55}  -layer M4 -width 0.20 -start_low_ends coordinate  -start_low_ends_coordinate 1.050 -start_high_ends coordinate  -start_high_ends_coordinate 3.20 -look_inside_std_cells

create_power_straps  -direction vertical  -start_at 93.75 -nets  {Cal0}  -layer M4 -width 0.32 -start_low_ends coordinate  -start_low_ends_coordinate 16.35 -start_high_ends coordinate  -start_high_ends_coordinate 30.49 -look_inside_std_cells
create_power_straps  -direction horizontal  -start_at 30.33 -nets  {Cal0}  -layer M3 -width 0.32 -start_low_ends coordinate  -start_low_ends_coordinate 90.775 -start_high_ends coordinate  -start_high_ends_coordinate 93.59 -look_inside_std_cells


create_power_straps  -direction vertical  -start_at 94.40 -nets  {Cal1}  -layer M4 -width 0.32 -start_low_ends coordinate  -start_low_ends_coordinate 17.10 -start_high_ends coordinate  -start_high_ends_coordinate 34.09 -look_inside_std_cells
create_power_straps  -direction horizontal  -start_at 33.93 -nets  {Cal1}  -layer M3 -width 0.32 -start_low_ends coordinate  -start_low_ends_coordinate 94.24 -start_high_ends coordinate  -start_high_ends_coordinate 96.35 -look_inside_std_cells

create_power_straps  -direction vertical  -start_at 96.00 -nets  {Cal2}  -layer M4 -width 0.32 -start_low_ends coordinate  -start_low_ends_coordinate 18.10 -start_high_ends coordinate  -start_high_ends_coordinate 33.015 -look_inside_std_cells
create_power_straps  -direction horizontal  -start_at 32.955 -nets  {Cal2}  -layer M3 -width 0.12 -start_low_ends coordinate  -start_low_ends_coordinate 95.840 -start_high_ends coordinate  -start_high_ends_coordinate 98.55 -look_inside_std_cells

create_power_straps  -direction vertical  -start_at 99.00 -nets  {Cal3}  -layer M4 -width 0.32 -start_low_ends coordinate  -start_low_ends_coordinate 19.10 -start_high_ends coordinate  -start_high_ends_coordinate 31.46 -look_inside_std_cells
create_power_straps  -direction horizontal  -start_at 31.36 -nets  {Cal3}  -layer M3 -width 0.20 -start_low_ends coordinate  -start_low_ends_coordinate 98.84 -start_high_ends coordinate  -start_high_ends_coordinate 101.55 -look_inside_std_cells

create_power_straps  -direction vertical  -start_at 112.65 -nets  {Cal4}  -layer M4 -width 0.32 -start_low_ends coordinate  -start_low_ends_coordinate 16.35 -start_high_ends coordinate  -start_high_ends_coordinate 30.49 -look_inside_std_cells
create_power_straps  -direction horizontal  -start_at 30.39 -nets  {Cal4}  -layer M3 -width 0.20 -start_low_ends coordinate  -start_low_ends_coordinate 110.65 -start_high_ends coordinate  -start_high_ends_coordinate 112.81 -look_inside_std_cells

create_power_straps  -direction vertical  -start_at 112.00 -nets  {Cal5}  -layer M4 -width 0.32 -start_low_ends coordinate  -start_low_ends_coordinate 17.10 -start_high_ends coordinate  -start_high_ends_coordinate 29.6 -look_inside_std_cells
create_power_straps  -direction horizontal  -start_at 29.44 -nets  {Cal5}  -layer M3 -width 0.32 -start_low_ends coordinate  -start_low_ends_coordinate 112.16 -start_high_ends coordinate  -start_high_ends_coordinate 113.255 -look_inside_std_cells

create_power_straps  -direction vertical  -start_at 110.40 -nets  {Cal6}  -layer M4 -width 0.32 -start_low_ends coordinate  -start_low_ends_coordinate 18.10 -start_high_ends coordinate  -start_high_ends_coordinate 30.49 -look_inside_std_cells

create_power_straps  -direction horizontal  -start_at 30.39 -nets  {Cal6}  -layer M3 -width 0.20 -start_low_ends coordinate  -start_low_ends_coordinate 106.395 -start_high_ends coordinate  -start_high_ends_coordinate 110.56 -look_inside_std_cells


create_power_straps  -direction vertical  -start_at 107.40 -nets  {Cal7}  -layer M4 -width 0.32 -start_low_ends coordinate  -start_low_ends_coordinate 19.10 -start_high_ends coordinate  -start_high_ends_coordinate 29.615 -look_inside_std_cells
create_power_straps  -direction horizontal  -start_at 29.455 -nets  {Cal7}  -layer M3 -width 0.32 -start_low_ends coordinate  -start_low_ends_coordinate 105.015 -start_high_ends coordinate  -start_high_ends_coordinate 107.56 -look_inside_std_cells

create_power_straps  -direction vertical  -start_at 3.4 -num_placement_strap 2 -increment_x_or_y 12.8 -nets  {VREFN}  -layer M2 -width 4 -start_low_ends coordinate  -start_low_ends_coordinate 0.20 -start_high_ends coordinate  -start_high_ends_coordinate 74.00 -extend_low_ends off -extend_high_ends off -look_inside_std_cells
create_power_straps  -direction vertical  -start_at 3.4 -num_placement_strap 2 -increment_x_or_y 12.8 -nets  {VREFN}  -layer M4 -width 4 -start_low_ends coordinate  -start_low_ends_coordinate 0.20 -start_high_ends coordinate  -start_high_ends_coordinate 74.00 -extend_low_ends off -extend_high_ends off 
create_power_straps  -direction vertical  -start_at 3.4 -num_placement_strap 2 -increment_x_or_y 12.8 -nets  {VREFN}  -layer M6 -width 4 -start_low_ends coordinate  -start_low_ends_coordinate 0.20 -start_high_ends coordinate  -start_high_ends_coordinate 74.00 -extend_low_ends off -extend_high_ends off 

create_power_straps  -direction vertical  -start_at 9.8 -num_placement_strap 2 -increment_x_or_y 12.8 -nets  {VREFP}  -layer M2 -width 4 -start_low_ends coordinate  -start_low_ends_coordinate 0.20 -start_high_ends coordinate  -start_high_ends_coordinate 74.00 -extend_low_ends off -extend_high_ends off -look_inside_std_cells
create_power_straps  -direction vertical  -start_at 9.8 -num_placement_strap 2 -increment_x_or_y 12.8 -nets  {VREFP}  -layer M4 -width 4 -start_low_ends coordinate  -start_low_ends_coordinate 0.20 -start_high_ends coordinate  -start_high_ends_coordinate 74.00 -extend_low_ends off -extend_high_ends off 
create_power_straps  -direction vertical  -start_at 9.8 -num_placement_strap 2 -increment_x_or_y 12.8 -nets  {VREFP}  -layer M6 -width 4 -start_low_ends coordinate  -start_low_ends_coordinate 0.20 -start_high_ends coordinate  -start_high_ends_coordinate 74.00 -extend_low_ends off -extend_high_ends off 

create_power_straps  -direction vertical  -start_at 190.2 -num_placement_strap 2 -increment_x_or_y 12.8 -nets  {VREFN}  -layer M2 -width 4 -start_low_ends coordinate  -start_low_ends_coordinate 0.20 -start_high_ends coordinate  -start_high_ends_coordinate 74.00 -extend_low_ends off -extend_high_ends off -look_inside_std_cells
create_power_straps  -direction vertical  -start_at 190.2 -num_placement_strap 2 -increment_x_or_y 12.8 -nets  {VREFN}  -layer M4 -width 4 -start_low_ends coordinate  -start_low_ends_coordinate 0.20 -start_high_ends coordinate  -start_high_ends_coordinate 74.00 -extend_low_ends off -extend_high_ends off 
create_power_straps  -direction vertical  -start_at 190.2 -num_placement_strap 2 -increment_x_or_y 12.8 -nets  {VREFN}  -layer M6 -width 4 -start_low_ends coordinate  -start_low_ends_coordinate 0.20 -start_high_ends coordinate  -start_high_ends_coordinate 74.00 -extend_low_ends off -extend_high_ends off 

create_power_straps  -direction vertical  -start_at 183.8 -num_placement_strap 2 -increment_x_or_y 12.8 -nets  {VREFP}  -layer M2 -width 4 -start_low_ends coordinate  -start_low_ends_coordinate 0.20 -start_high_ends coordinate  -start_high_ends_coordinate 74.00 -extend_low_ends off -extend_high_ends off -look_inside_std_cells
create_power_straps  -direction vertical  -start_at 183.8 -num_placement_strap 2 -increment_x_or_y 12.8 -nets  {VREFP}  -layer M4 -width 4 -start_low_ends coordinate  -start_low_ends_coordinate 0.20 -start_high_ends coordinate  -start_high_ends_coordinate 74.00 -extend_low_ends off -extend_high_ends off 
create_power_straps  -direction vertical  -start_at 183.8 -num_placement_strap 2 -increment_x_or_y 12.8 -nets  {VREFP}  -layer M6 -width 4 -start_low_ends coordinate  -start_low_ends_coordinate 0.20 -start_high_ends coordinate  -start_high_ends_coordinate 74.00 -extend_low_ends off -extend_high_ends off 

create_power_straps  -direction horizontal  -start_at 3.8 -num_placement_strap 20 -increment_x_or_y 3.6 -nets  {VREFN}  -layer M3 -width 1.2 -start_low_ends coordinate  -start_low_ends_coordinate 0.20 -start_high_ends coordinate  -start_high_ends_coordinate 25.80 -extend_low_ends off -extend_high_ends off 
create_power_straps  -direction horizontal  -start_at 3.8 -num_placement_strap 20 -increment_x_or_y 3.6 -nets  {VREFN}  -layer M5 -width 1.2 -start_low_ends coordinate  -start_low_ends_coordinate 0.20 -start_high_ends coordinate  -start_high_ends_coordinate 25.80 -extend_low_ends off -extend_high_ends off 
create_power_straps  -direction horizontal  -start_at 3.8 -num_placement_strap 20 -increment_x_or_y 3.6 -nets  {VREFN}  -layer M7 -width 1.2 -start_low_ends coordinate  -start_low_ends_coordinate 0.20 -start_high_ends coordinate  -start_high_ends_coordinate 25.80 -extend_low_ends off -extend_high_ends off 

create_power_straps  -direction horizontal  -start_at 2.0 -num_placement_strap 20 -increment_x_or_y 3.6 -nets  {VREFP}  -layer M3 -width 1.2 -start_low_ends coordinate  -start_low_ends_coordinate 0.20 -start_high_ends coordinate  -start_high_ends_coordinate 25.80 -extend_low_ends off -extend_high_ends off 
create_power_straps  -direction horizontal  -start_at 2.0 -num_placement_strap 20 -increment_x_or_y 3.6 -nets  {VREFP}  -layer M5 -width 1.2 -start_low_ends coordinate  -start_low_ends_coordinate 0.20 -start_high_ends coordinate  -start_high_ends_coordinate 25.80 -extend_low_ends off -extend_high_ends off 
create_power_straps  -direction horizontal  -start_at 2.0 -num_placement_strap 20 -increment_x_or_y 3.6 -nets  {VREFP}  -layer M7 -width 1.2 -start_low_ends coordinate  -start_low_ends_coordinate 0.20 -start_high_ends coordinate  -start_high_ends_coordinate 25.80 -extend_low_ends off -extend_high_ends off 

create_power_straps  -direction horizontal  -start_at 3.8 -num_placement_strap 20 -increment_x_or_y 3.6 -nets  {VREFN}  -layer M3 -width 1.2 -start_low_ends coordinate  -start_low_ends_coordinate 180.6 -start_high_ends coordinate  -start_high_ends_coordinate 206.2 -extend_low_ends off -extend_high_ends off 
create_power_straps  -direction horizontal  -start_at 3.8 -num_placement_strap 20 -increment_x_or_y 3.6 -nets  {VREFN}  -layer M5 -width 1.2 -start_low_ends coordinate  -start_low_ends_coordinate 180.6 -start_high_ends coordinate  -start_high_ends_coordinate 206.2 -extend_low_ends off -extend_high_ends off 
create_power_straps  -direction horizontal  -start_at 3.8 -num_placement_strap 20 -increment_x_or_y 3.6 -nets  {VREFN}  -layer M7 -width 1.2 -start_low_ends coordinate  -start_low_ends_coordinate 180.6 -start_high_ends coordinate  -start_high_ends_coordinate 206.2 -extend_low_ends off -extend_high_ends off 

create_power_straps  -direction horizontal  -start_at 2.0 -num_placement_strap 20 -increment_x_or_y 3.6 -nets  {VREFP}  -layer M3 -width 1.2 -start_low_ends coordinate  -start_low_ends_coordinate 180.6 -start_high_ends coordinate  -start_high_ends_coordinate 206.2 -extend_low_ends off -extend_high_ends off 
create_power_straps  -direction horizontal  -start_at 2.0 -num_placement_strap 20 -increment_x_or_y 3.6 -nets  {VREFP}  -layer M5 -width 1.2 -start_low_ends coordinate  -start_low_ends_coordinate 180.6 -start_high_ends coordinate  -start_high_ends_coordinate 206.2 -extend_low_ends off -extend_high_ends off 
create_power_straps  -direction horizontal  -start_at 2.0 -num_placement_strap 20 -increment_x_or_y 3.6 -nets  {VREFP}  -layer M7 -width 1.2 -start_low_ends coordinate  -start_low_ends_coordinate 180.6 -start_high_ends coordinate  -start_high_ends_coordinate 206.2 -extend_low_ends off -extend_high_ends off 


set_ignored_layers -min_routing M2 -max_routing_layer $TOP_RT_METAL
set_route_mode_options -zroute true
set_route_opt_strategy -search_repair_loop 8

set_route_zrt_common_options -post_detail_route_redundant_via_insertion high
route_zrt_eco
route_zrt_detail

create_text {VDD} -layer {TEXT2} -height 0.1 -origin {88.200 29.6}
create_text {VSS} -layer {TEXT2} -height 0.1 -origin {118.200 29.6}
create_text {AVDD} -layer {TEXT2} -height 0.1 -origin {87.700 7.5}
create_text {AVSS} -layer {TEXT2} -height 0.1 -origin {118.700 7.5}
create_text {VREFN} -layer {TEXT3} -height 0.1 -origin {95.6 22.3}
create_text {VREFP} -layer {TEXT3} -height 0.1 -origin {95.6 23.1}

source ../script/signoff.tcl





