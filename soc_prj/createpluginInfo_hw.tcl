# load the initial variables
source read_bd.tcl
# open the opreject
open_project $prjPath
#open block design 
open_bd_design $blockdesign

#finding max value
proc max args {
    set res [lindex $args 0]
    foreach element [lrange $args 1 end] {
        if {$element > $res} {set res $element}
    }
    return $res
}


#set numIntrDutPorts [lindex $argv $dutIntrPortIdx]


set masterSpace [list ]
for {set nm 1} {$nm <= $numMastseg} {incr nm} {
lappend masterSpace [lindex  $argv [expr $nm + 2]]
}
close [ open XilinxPluginInfoHW.m w ]
set fp [open "XilinxPluginInfoHW.m" w+]
puts $fp "function pluginrdInfo = XilinxPluginInfoHW(pluginrdInfo)"
set space_name [list ]
for {set nm 0} {$nm < $numMastseg} {incr nm} {
lappend space_name '[get_bd_addr_spaces -of_objects [get_bd_intf_pins [lindex $mstSeg $nm]]]'
}

puts $fp "master_space = {$space_name};"
puts $fp "tempStr=\[];"
puts $fp "for ii=1:numel(master_space)"
puts $fp "\  if(ii==1)"
puts $fp "\      tempStr=\[tempStr sprintf('''%s''',master_space{ii}(2:end))];"
puts $fp "\  else"
puts $fp "\      tempStr=\[tempStr sprintf(',''%s''',master_space{ii}(2:end))];"
puts $fp "\  end"
puts $fp "end"
puts $fp "\ if(numel(master_space)>1)"
puts $fp "      pluginrdInfo.AXI4Lite.MasterAddressSpace = \['{',tempStr,'}'];"
puts $fp "\ else"
puts $fp "      pluginrdInfo.AXI4Lite.MasterAddressSpace = tempStr;"
puts $fp "\ end"

for {set nvsm 0} {$nvsm < $numVStreamM } {incr nvsm} {
set pinName $dutIPCore
set pinName [append pinName /AXI4_Stream_Video_ $nvsm _Master_TDATA]
set VStreamMstDw [get_property LEFT [get_bd_pins $pinName]]
puts $fp "pluginrdInfo.AXI_Stream_Video_Master([expr $nvsm + 1]).Mstrdw = $VStreamMstDw;"
}

for {set nvss 0} {$nvss < $numVStreamS } {incr nvss} {
set pinName $dutIPCore
set pinName [append pinName /AXI4_Stream_Video_ $nvss _Slave_TDATA]
set VStreamSlvDw [get_property LEFT [get_bd_pins $pinName]]
puts $fp "pluginrdInfo.AXI_Stream_Video_Slave([expr $nvss + 1]).Slvdw = $VStreamSlvDw;"
}

for {set nsm 0} {$nsm < $numStreamM } {incr nsm} {
set pinName $dutIPCore
set pinName [append pinName /AXI4_Stream_ $nsm _Master_TDATA]
set StreamMstDw [get_property LEFT [get_bd_pins $pinName]]
puts $fp "pluginrdInfo.AXI_Stream_Master([expr $nsm + 1]).Mstrdw = $StreamMstDw;"
}

for {set nss 0} {$nss < $numStreamS } {incr nss} {
set pinName $dutIPCore
set pinName [append pinName /AXI4_Stream_ $nss _Slave_TDATA]
set StreamSlvDw [get_property LEFT [get_bd_pins $pinName]]
puts $fp "pluginrdInfo.AXI_Stream_Slave([expr $nss + 1]).Slvdw = $StreamSlvDw;"
}

for {set nm 0} {$nm < $numRandAccM } {incr nm} {
set ipcore [lindex $argv [expr $numMastseg + 3]]
set dut $dutIPCore
set rdAddrPinName [append dut /AXI4_Master_ $nm _Rd_ARADDR]
set dut $dutIPCore
set wrAddrPinName [append dut /AXI4_Master_ $nm _Wr_AWADDR]
set dut $dutIPCore
set rdDataPinName [append dut /AXI4_Master_ $nm _Rd_RDATA]
set dut $dutIPCore
set wrDataPinName [append dut /AXI4_Master_ $nm _Wr_WDATA]

if {([lindex $readRandAccM $nm] > 0) && ([lindex $writeRandAccM $nm] > 0)} {
set MstAw [max [get_property LEFT [get_bd_pins $rdAddrPinName]] [get_property LEFT [get_bd_pins $wrAddrPinName]]]
set MstDw [max [get_property LEFT [get_bd_pins $rdDataPinName]] [get_property LEFT [get_bd_pins $wrDataPinName]]]
} elseif {[lindex $readRandAccM $nm] > 0} {
set MstAw [get_property LEFT [get_bd_pins $rdAddrPinName]]
set MstDw [get_property LEFT [get_bd_pins $rdDataPinName]]
} elseif {[lindex $writeRandAccM $nm] > 0} {
set MstAw [get_property LEFT [get_bd_pins $wrAddrPinName]]
set MstDw [get_property LEFT [get_bd_pins $wrDataPinName]]
}

puts $fp "pluginrdInfo.AXI_Master([expr $nm + 1]).MstrMaxAw = $MstAw;"
puts $fp "pluginrdInfo.AXI_Master([expr $nm + 1]).MstrMaxDw= $MstDw;"
}
if {$numRandAccM > 0} {
set seg_name [get_bd_addr_segs -of [get_bd_intf_pins $memSeg]]
puts $fp "memSegName='$seg_name';"
puts $fp "pluginrdInfo.memSegName=sprintf('''%s''',memSegName(2:end));"
}

for {set nm 0} {$nm < $numIntrCon } {incr nm} {
set intrPort [lindex $intrPorts $nm ]
set portwidth [get_property LEFT [get_bd_pins $intrPort]]
set portdir [get_property DIR [get_bd_pins $intrPort]]
set width [string length [lindex $portwidth]]
if {$width == 0} {
puts $fp "pluginrdInfo.IntrCon([expr $nm + 1]).PortWidth = 1;"
} else {
puts $fp "pluginrdInfo.IntrCon([expr $nm + 1]).PortWidth = [incr portwidth];"
}
puts $fp "pluginrdInfo.IntrCon([expr $nm + 1]).InterfaceType = '$portdir';"
}

puts $fp "% board information"
puts $fp "% FPGA device information"

set family [get_property  FAMILY [get_parts -of_objects [get_projects]]]
puts $fp "pluginrdInfo.FPGAFamily = '$family';"

set device [get_property  DEVICE [get_parts -of_objects [get_projects]]]
puts $fp "pluginrdInfo.FPGADevice = '$device';"

set package [get_property  PACKAGE [get_parts -of_objects [get_projects]]]
puts $fp "pluginrdInfo.FPGAPackage = '$package';"

set speed [get_property  SPEED [get_parts -of_objects [get_projects]]]
puts $fp "pluginrdInfo.FPGASpeed = '$speed';"

set part_name [get_property part  [current_project]]
puts $fp "pluginrdInfo.PartName = '$part_name';"

# deleting interface connections
for {set dutPortIdx 0} {$dutPortIdx < $numIntrDutPorts } {incr dutPortIdx} {
# it can be net or interface
delete_bd_objs [get_bd_intf_nets [lindex $delIPcoreIntr $dutPortIdx]]
delete_bd_objs [get_bd_nets [lindex $delIPcoreIntr $dutPortIdx]]
}
# deleting LEDs
for {set ledIdx 0} {$ledIdx < $numLeds } {incr ledIdx} {
delete_bd_objs [get_bd_ports [lindex $ledPorts $ledIdx]]
}
# deleting PBs
for {set pbIdx 0} {$pbIdx < $numPBs } {incr pbIdx} {
delete_bd_objs [get_bd_ports [lindex $pbPorts $pbIdx]]
}
# deleting Dss
for {set dsIdx 0} {$dsIdx < $numDSs } {incr dsIdx} {
delete_bd_objs [get_bd_ports [lindex $dsPorts $dsIdx]]
}
delete_bd_objs [get_bd_cells $dutIPCore]


write_bd_tcl -force $exptclPath

puts $fp "end"
close $fp

close_project 
exit

