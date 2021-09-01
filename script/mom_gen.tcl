
set NODEL CAPN
set NODER CAPP
set NHFIN  4
set PITCH 0.4
set MOM_HGT  [expr {$NHFIN * $PITCH}]
set BOX_TOP  [expr {$ORIGIN_Y + $MOM_HGT}]
set MOM_LGT 8
set FIN_RGT  [expr {$ORIGIN_X + $MOM_LGT}]
set BOX_RGT  [expr {$ORIGIN_X + $MOM_LGT + $PITCH}]


# MOM Cap generation
# P straps
create_power_straps  -direction vertical  -start_at $ORIGIN_X -nets  $NODEL  -layer M4 -width 0.32 -start_low_ends coordinate  -start_low_ends_coordinate $ORIGIN_Y -start_high_ends coordinate  -start_high_ends_coordinate $BOX_TOP -extend_low_ends off -extend_high_ends off -ignore_parallel_targets
create_power_straps  -direction vertical  -start_at $ORIGIN_X -nets  $NODEL  -layer M6 -width 0.32 -start_low_ends coordinate  -start_low_ends_coordinate $ORIGIN_Y -start_high_ends coordinate  -start_high_ends_coordinate $BOX_TOP -extend_low_ends off -extend_high_ends off -ignore_parallel_targets

create_power_straps  -direction horizontal  -start_at [expr {$ORIGIN_Y+0.14}] -num_placement_strap $NHFIN -increment_x_or_y $PITCH -nets  $NODEL  -layer M5 -width 0.1 -start_low_ends coordinate  -start_low_ends_coordinate [expr {$ORIGIN_X-0.16}] -start_high_ends coordinate  -start_high_ends_coordinate $FIN_RGT -extend_low_ends off -extend_high_ends off -ignore_parallel_targets

create_power_straps  -direction horizontal  -start_at [expr {$ORIGIN_Y+0.14}] -num_placement_strap $NHFIN -increment_x_or_y $PITCH -nets  $NODEL  -layer M3 -width 0.1 -start_low_ends coordinate  -start_low_ends_coordinate [expr {$ORIGIN_X-0.16}] -start_high_ends coordinate  -start_high_ends_coordinate $FIN_RGT -extend_low_ends off -extend_high_ends off -ignore_parallel_targets

create_power_straps  -direction horizontal  -start_at [expr {$ORIGIN_Y+0.34}] -num_placement_strap $NHFIN -increment_x_or_y $PITCH -nets  $NODEL  -layer M4 -width 0.1 -start_low_ends coordinate  -start_low_ends_coordinate  [expr {$ORIGIN_X-0.16}] -start_high_ends coordinate  -start_high_ends_coordinate $FIN_RGT -extend_low_ends off -extend_high_ends off -ignore_parallel_targets

create_power_straps  -direction horizontal  -start_at [expr {$ORIGIN_Y+0.34}] -num_placement_strap $NHFIN -increment_x_or_y $PITCH -nets  $NODEL  -layer M6 -width 0.1 -start_low_ends coordinate  -start_low_ends_coordinate [expr {$ORIGIN_X-0.16}] -start_high_ends coordinate  -start_high_ends_coordinate $FIN_RGT -extend_low_ends off -extend_high_ends off -ignore_parallel_targets

# N straps
create_power_straps  -direction vertical  -start_at $BOX_RGT -nets  $NODER  -layer M4 -width 0.32 -start_low_ends coordinate  -start_low_ends_coordinate $ORIGIN_Y -start_high_ends coordinate  -start_high_ends_coordinate $BOX_TOP -extend_low_ends off -extend_high_ends off -ignore_parallel_targets

create_power_straps  -direction vertical  -start_at $BOX_RGT -nets  $NODER  -layer M6 -width 0.32 -start_low_ends coordinate  -start_low_ends_coordinate $ORIGIN_Y -start_high_ends coordinate  -start_high_ends_coordinate $BOX_TOP -extend_low_ends off -extend_high_ends off -ignore_parallel_targets


create_power_straps  -direction horizontal  -start_at [expr {$ORIGIN_Y+0.34}] -num_placement_strap $NHFIN -increment_x_or_y $PITCH -nets  $NODER  -layer M5 -width 0.1 -start_low_ends coordinate  -start_low_ends_coordinate [expr {$ORIGIN_X+0.4}] -start_high_ends coordinate  -start_high_ends_coordinate [expr {$BOX_RGT+0.16}] -extend_low_ends off -extend_high_ends off -ignore_parallel_targets

create_power_straps  -direction horizontal  -start_at [expr {$ORIGIN_Y+0.34}] -num_placement_strap $NHFIN -increment_x_or_y $PITCH -nets  $NODER  -layer M3 -width 0.1 -start_low_ends coordinate  -start_low_ends_coordinate [expr {$ORIGIN_X+0.4}]  -start_high_ends coordinate  -start_high_ends_coordinate [expr {$BOX_RGT+0.16}] -extend_low_ends off -extend_high_ends off -ignore_parallel_targets

create_power_straps  -direction horizontal  -start_at [expr {$ORIGIN_Y+0.14}] -num_placement_strap $NHFIN -increment_x_or_y $PITCH -nets  $NODER  -layer M4 -width 0.1 -start_low_ends coordinate  -start_low_ends_coordinate [expr {$ORIGIN_X+0.4}] -start_high_ends coordinate  -start_high_ends_coordinate [expr {$BOX_RGT+0.16}] -extend_low_ends off -extend_high_ends off -ignore_parallel_targets

create_power_straps  -direction horizontal  -start_at [expr {$ORIGIN_Y+0.14}] -num_placement_strap $NHFIN -increment_x_or_y $PITCH -nets  $NODER -layer M6 -width 0.1 -start_low_ends coordinate  -start_low_ends_coordinate [expr {$ORIGIN_X+0.4}] -start_high_ends coordinate  -start_high_ends_coordinate [expr {$BOX_RGT+0.16}] -extend_low_ends off -extend_high_ends off -ignore_parallel_targets




