# This file is automatically generated.
# It contains project source information necessary for synthesis and implementation.

# IP: c:/Users/Student/Documents/GitHub/CSM152B_S23/Finals/Finals.srcs/sources_1/bd/design_1/ip/design_1_PmodGYRO_0_0/design_1_PmodGYRO_0_0.xci
# IP: The module: 'design_1_PmodGYRO_0_0' is the root of the design. Do not add the DONT_TOUCH constraint.

# IP: c:/Users/Student/Documents/GitHub/CSM152B_S23/Finals/Finals.srcs/sources_1/bd/design_1/ip/design_1_PmodGYRO_0_0/src/PmodGYRO_pmod_bridge_0_0/PmodGYRO_pmod_bridge_0_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==PmodGYRO_pmod_bridge_0_0 || ORIG_REF_NAME==PmodGYRO_pmod_bridge_0_0} -quiet] -quiet

# IP: c:/Users/Student/Documents/GitHub/CSM152B_S23/Finals/Finals.srcs/sources_1/bd/design_1/ip/design_1_PmodGYRO_0_0/src/PmodGYRO_axi_quad_spi_0_0/PmodGYRO_axi_quad_spi_0_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==PmodGYRO_axi_quad_spi_0_0 || ORIG_REF_NAME==PmodGYRO_axi_quad_spi_0_0} -quiet] -quiet

# IP: c:/Users/Student/Documents/GitHub/CSM152B_S23/Finals/Finals.srcs/sources_1/bd/design_1/ip/design_1_PmodGYRO_0_0/src/PmodGYRO_axi_gpio_0_0/PmodGYRO_axi_gpio_0_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==PmodGYRO_axi_gpio_0_0 || ORIG_REF_NAME==PmodGYRO_axi_gpio_0_0} -quiet] -quiet

# XDC: c:/Users/Student/Documents/GitHub/CSM152B_S23/Finals/Finals.srcs/sources_1/bd/design_1/ip/design_1_PmodGYRO_0_0/src/PmodGYRO_pmod_bridge_0_0/PmodGYRO_pmod_bridge_0_0_board.xdc
set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==PmodGYRO_pmod_bridge_0_0 || ORIG_REF_NAME==PmodGYRO_pmod_bridge_0_0} -quiet] {/inst } ]/inst ] -quiet] -quiet

# XDC: c:/Users/Student/Documents/GitHub/CSM152B_S23/Finals/Finals.srcs/sources_1/bd/design_1/ip/design_1_PmodGYRO_0_0/src/PmodGYRO_pmod_bridge_0_0/src/pmod_concat_ooc.xdc

# XDC: c:/Users/Student/Documents/GitHub/CSM152B_S23/Finals/Finals.srcs/sources_1/bd/design_1/ip/design_1_PmodGYRO_0_0/design_1_PmodGYRO_0_0_board.xdc
# XDC: The top module name and the constraint reference have the same name: 'design_1_PmodGYRO_0_0'. Do not add the DONT_TOUCH constraint.
set_property DONT_TOUCH TRUE [get_cells inst -quiet] -quiet

# XDC: c:/Users/Student/Documents/GitHub/CSM152B_S23/Finals/Finals.srcs/sources_1/bd/design_1/ip/design_1_PmodGYRO_0_0/src/PmodGYRO_ooc.xdc
# XDC: The top module name and the constraint reference have the same name: 'design_1_PmodGYRO_0_0'. Do not add the DONT_TOUCH constraint.
#dup# set_property DONT_TOUCH TRUE [get_cells inst -quiet] -quiet

# XDC: c:/Users/Student/Documents/GitHub/CSM152B_S23/Finals/Finals.srcs/sources_1/bd/design_1/ip/design_1_PmodGYRO_0_0/src/PmodGYRO_axi_quad_spi_0_0/PmodGYRO_axi_quad_spi_0_0_board.xdc
set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==PmodGYRO_axi_quad_spi_0_0 || ORIG_REF_NAME==PmodGYRO_axi_quad_spi_0_0} -quiet] {/U0 } ]/U0 ] -quiet] -quiet

# XDC: c:/Users/Student/Documents/GitHub/CSM152B_S23/Finals/Finals.srcs/sources_1/bd/design_1/ip/design_1_PmodGYRO_0_0/src/PmodGYRO_axi_quad_spi_0_0/PmodGYRO_axi_quad_spi_0_0.xdc
#dup# set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==PmodGYRO_axi_quad_spi_0_0 || ORIG_REF_NAME==PmodGYRO_axi_quad_spi_0_0} -quiet] {/U0 } ]/U0 ] -quiet] -quiet

# XDC: c:/Users/Student/Documents/GitHub/CSM152B_S23/Finals/Finals.srcs/sources_1/bd/design_1/ip/design_1_PmodGYRO_0_0/src/PmodGYRO_axi_quad_spi_0_0/PmodGYRO_axi_quad_spi_0_0_ooc.xdc

# XDC: c:/Users/Student/Documents/GitHub/CSM152B_S23/Finals/Finals.srcs/sources_1/bd/design_1/ip/design_1_PmodGYRO_0_0/src/PmodGYRO_axi_quad_spi_0_0/PmodGYRO_axi_quad_spi_0_0_clocks.xdc
#dup# set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==PmodGYRO_axi_quad_spi_0_0 || ORIG_REF_NAME==PmodGYRO_axi_quad_spi_0_0} -quiet] {/U0 } ]/U0 ] -quiet] -quiet

# XDC: c:/Users/Student/Documents/GitHub/CSM152B_S23/Finals/Finals.srcs/sources_1/bd/design_1/ip/design_1_PmodGYRO_0_0/src/PmodGYRO_axi_gpio_0_0/PmodGYRO_axi_gpio_0_0_board.xdc
set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==PmodGYRO_axi_gpio_0_0 || ORIG_REF_NAME==PmodGYRO_axi_gpio_0_0} -quiet] {/U0 } ]/U0 ] -quiet] -quiet

# XDC: c:/Users/Student/Documents/GitHub/CSM152B_S23/Finals/Finals.srcs/sources_1/bd/design_1/ip/design_1_PmodGYRO_0_0/src/PmodGYRO_axi_gpio_0_0/PmodGYRO_axi_gpio_0_0_ooc.xdc

# XDC: c:/Users/Student/Documents/GitHub/CSM152B_S23/Finals/Finals.srcs/sources_1/bd/design_1/ip/design_1_PmodGYRO_0_0/src/PmodGYRO_axi_gpio_0_0/PmodGYRO_axi_gpio_0_0.xdc
#dup# set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==PmodGYRO_axi_gpio_0_0 || ORIG_REF_NAME==PmodGYRO_axi_gpio_0_0} -quiet] {/U0 } ]/U0 ] -quiet] -quiet

# IP: c:/Users/Student/Documents/GitHub/CSM152B_S23/Finals/Finals.srcs/sources_1/bd/design_1/ip/design_1_PmodGYRO_0_0/design_1_PmodGYRO_0_0.xci
# IP: The module: 'design_1_PmodGYRO_0_0' is the root of the design. Do not add the DONT_TOUCH constraint.

# IP: c:/Users/Student/Documents/GitHub/CSM152B_S23/Finals/Finals.srcs/sources_1/bd/design_1/ip/design_1_PmodGYRO_0_0/src/PmodGYRO_pmod_bridge_0_0/PmodGYRO_pmod_bridge_0_0.xci
#dup# set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==PmodGYRO_pmod_bridge_0_0 || ORIG_REF_NAME==PmodGYRO_pmod_bridge_0_0} -quiet] -quiet

# IP: c:/Users/Student/Documents/GitHub/CSM152B_S23/Finals/Finals.srcs/sources_1/bd/design_1/ip/design_1_PmodGYRO_0_0/src/PmodGYRO_axi_quad_spi_0_0/PmodGYRO_axi_quad_spi_0_0.xci
#dup# set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==PmodGYRO_axi_quad_spi_0_0 || ORIG_REF_NAME==PmodGYRO_axi_quad_spi_0_0} -quiet] -quiet

# IP: c:/Users/Student/Documents/GitHub/CSM152B_S23/Finals/Finals.srcs/sources_1/bd/design_1/ip/design_1_PmodGYRO_0_0/src/PmodGYRO_axi_gpio_0_0/PmodGYRO_axi_gpio_0_0.xci
#dup# set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==PmodGYRO_axi_gpio_0_0 || ORIG_REF_NAME==PmodGYRO_axi_gpio_0_0} -quiet] -quiet

# XDC: c:/Users/Student/Documents/GitHub/CSM152B_S23/Finals/Finals.srcs/sources_1/bd/design_1/ip/design_1_PmodGYRO_0_0/src/PmodGYRO_pmod_bridge_0_0/PmodGYRO_pmod_bridge_0_0_board.xdc
#dup# set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==PmodGYRO_pmod_bridge_0_0 || ORIG_REF_NAME==PmodGYRO_pmod_bridge_0_0} -quiet] {/inst } ]/inst ] -quiet] -quiet

# XDC: c:/Users/Student/Documents/GitHub/CSM152B_S23/Finals/Finals.srcs/sources_1/bd/design_1/ip/design_1_PmodGYRO_0_0/src/PmodGYRO_pmod_bridge_0_0/src/pmod_concat_ooc.xdc

# XDC: c:/Users/Student/Documents/GitHub/CSM152B_S23/Finals/Finals.srcs/sources_1/bd/design_1/ip/design_1_PmodGYRO_0_0/design_1_PmodGYRO_0_0_board.xdc
# XDC: The top module name and the constraint reference have the same name: 'design_1_PmodGYRO_0_0'. Do not add the DONT_TOUCH constraint.
#dup# set_property DONT_TOUCH TRUE [get_cells inst -quiet] -quiet

# XDC: c:/Users/Student/Documents/GitHub/CSM152B_S23/Finals/Finals.srcs/sources_1/bd/design_1/ip/design_1_PmodGYRO_0_0/src/PmodGYRO_ooc.xdc
# XDC: The top module name and the constraint reference have the same name: 'design_1_PmodGYRO_0_0'. Do not add the DONT_TOUCH constraint.
#dup# set_property DONT_TOUCH TRUE [get_cells inst -quiet] -quiet

# XDC: c:/Users/Student/Documents/GitHub/CSM152B_S23/Finals/Finals.srcs/sources_1/bd/design_1/ip/design_1_PmodGYRO_0_0/src/PmodGYRO_axi_quad_spi_0_0/PmodGYRO_axi_quad_spi_0_0_board.xdc
#dup# set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==PmodGYRO_axi_quad_spi_0_0 || ORIG_REF_NAME==PmodGYRO_axi_quad_spi_0_0} -quiet] {/U0 } ]/U0 ] -quiet] -quiet

# XDC: c:/Users/Student/Documents/GitHub/CSM152B_S23/Finals/Finals.srcs/sources_1/bd/design_1/ip/design_1_PmodGYRO_0_0/src/PmodGYRO_axi_quad_spi_0_0/PmodGYRO_axi_quad_spi_0_0.xdc
#dup# set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==PmodGYRO_axi_quad_spi_0_0 || ORIG_REF_NAME==PmodGYRO_axi_quad_spi_0_0} -quiet] {/U0 } ]/U0 ] -quiet] -quiet

# XDC: c:/Users/Student/Documents/GitHub/CSM152B_S23/Finals/Finals.srcs/sources_1/bd/design_1/ip/design_1_PmodGYRO_0_0/src/PmodGYRO_axi_quad_spi_0_0/PmodGYRO_axi_quad_spi_0_0_ooc.xdc

# XDC: c:/Users/Student/Documents/GitHub/CSM152B_S23/Finals/Finals.srcs/sources_1/bd/design_1/ip/design_1_PmodGYRO_0_0/src/PmodGYRO_axi_quad_spi_0_0/PmodGYRO_axi_quad_spi_0_0_clocks.xdc
#dup# set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==PmodGYRO_axi_quad_spi_0_0 || ORIG_REF_NAME==PmodGYRO_axi_quad_spi_0_0} -quiet] {/U0 } ]/U0 ] -quiet] -quiet

# XDC: c:/Users/Student/Documents/GitHub/CSM152B_S23/Finals/Finals.srcs/sources_1/bd/design_1/ip/design_1_PmodGYRO_0_0/src/PmodGYRO_axi_gpio_0_0/PmodGYRO_axi_gpio_0_0_board.xdc
#dup# set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==PmodGYRO_axi_gpio_0_0 || ORIG_REF_NAME==PmodGYRO_axi_gpio_0_0} -quiet] {/U0 } ]/U0 ] -quiet] -quiet

# XDC: c:/Users/Student/Documents/GitHub/CSM152B_S23/Finals/Finals.srcs/sources_1/bd/design_1/ip/design_1_PmodGYRO_0_0/src/PmodGYRO_axi_gpio_0_0/PmodGYRO_axi_gpio_0_0_ooc.xdc

# XDC: c:/Users/Student/Documents/GitHub/CSM152B_S23/Finals/Finals.srcs/sources_1/bd/design_1/ip/design_1_PmodGYRO_0_0/src/PmodGYRO_axi_gpio_0_0/PmodGYRO_axi_gpio_0_0.xdc
#dup# set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==PmodGYRO_axi_gpio_0_0 || ORIG_REF_NAME==PmodGYRO_axi_gpio_0_0} -quiet] {/U0 } ]/U0 ] -quiet] -quiet
