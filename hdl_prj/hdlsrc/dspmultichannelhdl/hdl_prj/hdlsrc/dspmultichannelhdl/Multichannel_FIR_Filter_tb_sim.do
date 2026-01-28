onbreak resume
onerror resume
vsim -voptargs=+acc work.Multichannel_FIR_Filter_tb

add wave sim:/Multichannel_FIR_Filter_tb/u_Multichannel_FIR_Filter/clk
add wave sim:/Multichannel_FIR_Filter_tb/u_Multichannel_FIR_Filter/reset
add wave sim:/Multichannel_FIR_Filter_tb/u_Multichannel_FIR_Filter/clk_enable
add wave sim:/Multichannel_FIR_Filter_tb/u_Multichannel_FIR_Filter/In1_0
add wave sim:/Multichannel_FIR_Filter_tb/u_Multichannel_FIR_Filter/In1_1
add wave sim:/Multichannel_FIR_Filter_tb/u_Multichannel_FIR_Filter/ce_out
add wave sim:/Multichannel_FIR_Filter_tb/u_Multichannel_FIR_Filter/Out1_0
add wave sim:/Multichannel_FIR_Filter_tb/Out1_0_ref
add wave sim:/Multichannel_FIR_Filter_tb/u_Multichannel_FIR_Filter/Out1_1
add wave sim:/Multichannel_FIR_Filter_tb/Out1_1_ref
run -all
