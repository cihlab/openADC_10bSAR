# The milkyway lib path and input/output path
set LIBR_PATH BTSW100
set RTL_PATH    ../src/btsw100m.v
set MODULE_NAME BTSW100
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


source ../script/signoff.tcl

