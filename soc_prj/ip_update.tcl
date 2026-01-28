if {$argc == 0} {
    set ver "v1_0"
} else {
    set ver [lindex $argv 0]
}
ipx::open_ipxact_file component.xml
set_property vendor {mathworks.com} [ipx::current_core]
set_property library {ip} [ipx::current_core]
ipx::save_core [ipx::current_core]
set ipName [get_property name [ipx::current_core]]
ipx::archive_core ${ipName}_${ver}.zip [ipx::current_core]
