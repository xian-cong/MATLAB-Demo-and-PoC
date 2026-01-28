create_project -force Multichannel_FIR_Filter_fil .
set_property target_language VHDL [current_project]
set_property part xc7a35tcsg324-1 [current_project]
add_files -norecurse {C:/demo/MultichannelFIRFilterForFPGAExample/hdl_prj/hdlsrc/dspmultichannelhdl/Multichannel_FIR_Filter_pkg.vhd}
add_files -norecurse {C:/demo/MultichannelFIRFilterForFPGAExample/hdl_prj/hdlsrc/dspmultichannelhdl/Discrete_FIR_Filter.vhd}
add_files -norecurse {C:/demo/MultichannelFIRFilterForFPGAExample/hdl_prj/hdlsrc/dspmultichannelhdl/Multichannel_FIR_Filter.vhd}
add_files -norecurse {C:/demo/MultichannelFIRFilterForFPGAExample/hdl_prj/fil_prj/filsrc/MWClkMgr.vhd}
add_files -norecurse {C:/demo/MultichannelFIRFilterForFPGAExample/hdl_prj/fil_prj/filsrc/MWMII2GMII.vhd}
add_files -norecurse {C:/demo/MultichannelFIRFilterForFPGAExample/hdl_prj/fil_prj/filsrc/mwrxmac.vhd}
add_files -norecurse {C:/demo/MultichannelFIRFilterForFPGAExample/hdl_prj/fil_prj/filsrc/mwtxmac.vhd}
add_files -norecurse {C:/demo/MultichannelFIRFilterForFPGAExample/hdl_prj/fil_prj/filsrc/mwpingram.vhd}
add_files -norecurse {C:/demo/MultichannelFIRFilterForFPGAExample/hdl_prj/fil_prj/filsrc/MWMAC.vhd}
add_files -norecurse {C:/demo/MultichannelFIRFilterForFPGAExample/hdl_prj/fil_prj/filsrc/MWDPRAM.vhd}
add_files -norecurse {C:/demo/MultichannelFIRFilterForFPGAExample/hdl_prj/fil_prj/filsrc/FILUDPCRC.vhd}
add_files -norecurse {C:/demo/MultichannelFIRFilterForFPGAExample/hdl_prj/fil_prj/filsrc/FILPktMUX.vhd}
add_files -norecurse {C:/demo/MultichannelFIRFilterForFPGAExample/hdl_prj/fil_prj/filsrc/FILCmdProc.vhd}
add_files -norecurse {C:/demo/MultichannelFIRFilterForFPGAExample/hdl_prj/fil_prj/filsrc/MWAsyncFIFO.vhd}
add_files -norecurse {C:/demo/MultichannelFIRFilterForFPGAExample/hdl_prj/fil_prj/filsrc/FILDataProc.vhd}
add_files -norecurse {C:/demo/MultichannelFIRFilterForFPGAExample/hdl_prj/fil_prj/filsrc/MWPKTBuffer.vhd}
add_files -norecurse {C:/demo/MultichannelFIRFilterForFPGAExample/hdl_prj/fil_prj/filsrc/MWUDPPKTBuilder.vhd}
add_files -norecurse {C:/demo/MultichannelFIRFilterForFPGAExample/hdl_prj/fil_prj/filsrc/FILPktProc.vhd}
add_files -norecurse {C:/demo/MultichannelFIRFilterForFPGAExample/hdl_prj/fil_prj/filsrc/FILCommLayer.vhd}
add_files -norecurse {C:/demo/MultichannelFIRFilterForFPGAExample/hdl_prj/fil_prj/filsrc/mwfil_dpscram.vhd}
add_files -norecurse {C:/demo/MultichannelFIRFilterForFPGAExample/hdl_prj/fil_prj/filsrc/mwfil_udfifo.vhd}
add_files -norecurse {C:/demo/MultichannelFIRFilterForFPGAExample/hdl_prj/fil_prj/filsrc/mwfil_bus2dut.vhd}
add_files -norecurse {C:/demo/MultichannelFIRFilterForFPGAExample/hdl_prj/fil_prj/filsrc/mwfil_chifcore.vhd}
add_files -norecurse {C:/demo/MultichannelFIRFilterForFPGAExample/hdl_prj/fil_prj/filsrc/mwfil_controller.vhd}
add_files -norecurse {C:/demo/MultichannelFIRFilterForFPGAExample/hdl_prj/fil_prj/filsrc/mwfil_dut2bus.vhd}
add_files -norecurse {C:/demo/MultichannelFIRFilterForFPGAExample/hdl_prj/fil_prj/filsrc/Multichannel_FIR_Filter_wrapper.vhd}
add_files -norecurse {C:/demo/MultichannelFIRFilterForFPGAExample/hdl_prj/fil_prj/filsrc/mwfil_chiftop.vhd}
add_files -norecurse {C:/demo/MultichannelFIRFilterForFPGAExample/hdl_prj/fil_prj/filsrc/FILCore.vhd}
add_files -norecurse {C:/demo/MultichannelFIRFilterForFPGAExample/hdl_prj/fil_prj/filsrc/MWMdioBasic.vhd}
add_files -norecurse {C:/demo/MultichannelFIRFilterForFPGAExample/hdl_prj/fil_prj/filsrc/Multichannel_FIR_Filter_fil.vhd}
add_files -norecurse {C:/demo/MultichannelFIRFilterForFPGAExample/hdl_prj/fil_prj/filsrc/Multichannel_FIR_Filter_fil.xdc}
set_property top Multichannel_FIR_Filter_fil [current_fileset]
launch_runs synth_1 -jobs 4
wait_on_run synth_1
if {[get_property PROGRESS [get_runs synth_1]] != "100%"} {  
  error "ERROR: Synthesis failed" 
}
close_project
