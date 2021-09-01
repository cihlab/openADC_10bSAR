# The milkyway lib path and input/output path
set LIBR_PATH cdac11b_H
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


source ../script/signoff.tcl










