set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks -of [get_pins design_1_i/clkgen/inst/clk_in1*]]
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]

