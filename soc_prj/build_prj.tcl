if {$argc == 0} {
    set proj_name "design_1_wrapper"
    set num_jobs 1
} else {
    set proj_name [lindex $argv 0]
    set num_jobs  [lindex $argv 1]
}

open_project vivado_prj.xpr
update_compile_order -fileset sources_1
reset_run impl_1
reset_run synth_1
launch_runs -jobs $num_jobs synth_1
wait_on_run synth_1
if {[string compare [get_property STATUS [get_runs synth_1]] "synth_design Complete!"] == 0} {
        puts "synthesis was successful"
} else {
        puts "synthesis was failed"
}
launch_runs -jobs $num_jobs impl_1
wait_on_run impl_1
if {[string first "route_design Complete" [get_property STATUS [get_runs impl_1]]] == 0} {
        puts "implementation was successful"
} else {
        puts "implementation was failed"
}
open_run impl_1
set slackvalue [get_property SLACK [get_timing_paths]]
if [expr [get_property SLACK [get_timing_paths]] < 0] { 
   puts " The worst slack is: $slackvalue ns "
   puts " Timing failed! " 
} else {
    puts " No timing failures "
}
if {[catch {write_bitstream -force ${proj_name}}]} {
	puts "bitstream generation failed.\n"
} else {
   # write_hw_platform -fixed -force  -include_bit -file ${proj_name}.xsa
    puts "------------------------------------"
    puts "Bitstream generation completed!"
    puts "------------------------------------"
}

close_project
exit
