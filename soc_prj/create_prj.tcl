# Create project
if {$argc == 1} {
  set part "xc7a35ticsg324-1L"
  set SynOpt [lindex $argv 0]
} else {
  set part [lindex $argv 0]
  set SynOpt [lindex $argv 1]
}


set ip_dir "./ipcore"
set xdc_file "constr.xdc"
set bd_file "system_bd.tcl"
set include_file "hsb_xil.tcl"
  
create_project vivado_prj . -force
set_property part $part [current_project]
set_property "target_language" "VHDL" [current_project]
set_property ip_repo_paths  $ip_dir [current_fileset]
update_ip_catalog

add_files -fileset constrs_1 -norecurse $xdc_file

create_bd_design design_1

source $include_file
source $bd_file

if {$SynOpt == "Global"} {
set_property GENERATE_SYNTH_CHECKPOINT 0  [get_files  ./[current_project].srcs/sources_1/bd/design_1/design_1.bd]
}
validate_bd_design
save_bd_design

generate_target all [get_files  ./[current_project].srcs/sources_1/bd/design_1/design_1.bd]
make_wrapper -files [get_files ./[current_project].srcs/sources_1/bd/design_1/design_1.bd] -top
add_files -norecurse ./[current_project].srcs/sources_1/bd/design_1/hdl/design_1_wrapper.vhd
update_compile_order -fileset sources_1

close_project
exit
