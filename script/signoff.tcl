
# Verify the placement and routing
save_mw_cel
verify_lvs

# Export the GDS-II file
set_write_stream_options -child_depth 0 -skip_ref_lib_cells \
			 -map_layer $MAP_PATH
write_stream -format gds -cells  $MODULE_NAME $GDS_PATH
write_verilog -no_tap_cells aprout/$MODULE_NAME$VERSION.lvs.v -pg -no_core_filler_cells
write_verilog -no_tap_cells aprout/$MODULE_NAME$VERSION.aprbhv.v -no_core_filler_cells -no_pg_pin_only_cells

close_mw_cel
