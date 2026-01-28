create_project -force fil_test_fil .
set_property target_language VHDL [current_project]
set_property part xc7a35tcsg324-1 [current_project]
add_files -norecurse {C:/demo/MultichannelFIRFilterForFPGAExample/fil_test.vhd}
add_files -norecurse {C:/demo/MultichannelFIRFilterForFPGAExample/filsrc/MWClkMgr.vhd}
add_files -norecurse {C:/demo/MultichannelFIRFilterForFPGAExample/filsrc/MWMII2GMII.vhd}
add_files -norecurse {C:/demo/MultichannelFIRFilterForFPGAExample/filsrc/mwrxmac.vhd}
add_files -norecurse {C:/demo/MultichannelFIRFilterForFPGAExample/filsrc/mwtxmac.vhd}
add_files -norecurse {C:/demo/MultichannelFIRFilterForFPGAExample/filsrc/mwpingram.vhd}
add_files -norecurse {C:/demo/MultichannelFIRFilterForFPGAExample/filsrc/MWMAC.vhd}
add_files -norecurse {C:/demo/MultichannelFIRFilterForFPGAExample/filsrc/MWDPRAM.vhd}
add_files -norecurse {C:/demo/MultichannelFIRFilterForFPGAExample/filsrc/FILUDPCRC.vhd}
add_files -norecurse {C:/demo/MultichannelFIRFilterForFPGAExample/filsrc/FILPktMUX.vhd}
add_files -norecurse {C:/demo/MultichannelFIRFilterForFPGAExample/filsrc/FILCmdProc.vhd}
add_files -norecurse {C:/demo/MultichannelFIRFilterForFPGAExample/filsrc/MWAsyncFIFO.vhd}
add_files -norecurse {C:/demo/MultichannelFIRFilterForFPGAExample/filsrc/FILDataProc.vhd}
add_files -norecurse {C:/demo/MultichannelFIRFilterForFPGAExample/filsrc/MWPKTBuffer.vhd}
add_files -norecurse {C:/demo/MultichannelFIRFilterForFPGAExample/filsrc/MWUDPPKTBuilder.vhd}
add_files -norecurse {C:/demo/MultichannelFIRFilterForFPGAExample/filsrc/FILPktProc.vhd}
add_files -norecurse {C:/demo/MultichannelFIRFilterForFPGAExample/filsrc/FILCommLayer.vhd}
add_files -norecurse {C:/demo/MultichannelFIRFilterForFPGAExample/filsrc/mwfil_dpscram.vhd}
add_files -norecurse {C:/demo/MultichannelFIRFilterForFPGAExample/filsrc/mwfil_udfifo.vhd}
add_files -norecurse {C:/demo/MultichannelFIRFilterForFPGAExample/filsrc/mwfil_bus2dut.vhd}
add_files -norecurse {C:/demo/MultichannelFIRFilterForFPGAExample/filsrc/mwfil_chifcore.vhd}
add_files -norecurse {C:/demo/MultichannelFIRFilterForFPGAExample/filsrc/mwfil_controller.vhd}
add_files -norecurse {C:/demo/MultichannelFIRFilterForFPGAExample/filsrc/mwfil_dut2bus.vhd}
add_files -norecurse {C:/demo/MultichannelFIRFilterForFPGAExample/filsrc/fil_test_wrapper.vhd}
add_files -norecurse {C:/demo/MultichannelFIRFilterForFPGAExample/filsrc/mwfil_chiftop.vhd}
add_files -norecurse {C:/demo/MultichannelFIRFilterForFPGAExample/filsrc/FILCore.vhd}
add_files -norecurse {C:/demo/MultichannelFIRFilterForFPGAExample/filsrc/MWMdioBasic.vhd}
add_files -norecurse {C:/demo/MultichannelFIRFilterForFPGAExample/filsrc/fil_test_fil.vhd}
add_files -norecurse {C:/demo/MultichannelFIRFilterForFPGAExample/filsrc/fil_test_fil.xdc}
set_property top fil_test_fil [current_fileset]
launch_runs impl_1 -jobs 4
wait_on_run impl_1
open_run impl_1
write_bitstream -force fil_test_fil
open_run impl_1
set par_str [report_timing_summary -return_string]
set timing_err ""
set result [regexp {Timing constraints are not met} $par_str match]
if {$result > 0} {
	set timing_err "Warning: Design does not meet all timing constraints."
}

close_project
set log ""
lappend log "\n\n------------------------------------"
lappend log "   FPGA-in-the-Loop build summary"
lappend log "------------------------------------\n"
set expected_file fil_test_fil.bit
set copied_file C:/demo/MultichannelFIRFilterForFPGAExample/fil_test_fil.bit
if [catch {file copy -force $expected_file ..}] {
   file delete ../$expected_file
   lappend log "Expected programming file not generated."
   lappend log "FPGA-in-the-Loop build failed.\n"
} else {
   if {[string length $timing_err] > 0} {
      lappend log "$timing_err\n"
      set warn_str " with warning"
   } else {
      set warn_str ""
   }
   lappend log "Programming file generated:"
   lappend log "$copied_file\n"
   lappend log "FPGA-in-the-Loop build completed$warn_str."
   lappend log "You may close this shell.\n"
}
foreach j $log {puts $j}
if { [catch {open fpgaproj.log w} log_fid] } {
} else {
    foreach j $log {puts $log_fid $j}
}
close $log_fid
