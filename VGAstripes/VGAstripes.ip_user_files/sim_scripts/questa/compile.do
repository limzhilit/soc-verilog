vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xpm
vlib questa_lib/msim/xil_defaultlib

vmap xpm questa_lib/msim/xpm
vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xpm  -incr -mfcu  -sv "+incdir+../../../../../../../Xilinx/2025.1/Vivado/data/rsb/busdef" "+incdir+../../../VGAstripes.gen/sources_1/ip/clk_wiz_1" \
"C:/Xilinx/2025.1/Vivado/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm  -93  \
"C:/Xilinx/2025.1/Vivado/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../../../../Xilinx/2025.1/Vivado/data/rsb/busdef" "+incdir+../../../VGAstripes.gen/sources_1/ip/clk_wiz_1" \
"../../../VGAstripes.srcs/sources_1/imports/VGAStripesSourceCode-20261021/VGAColourStripes.v" \
"../../../VGAstripes.srcs/sources_1/imports/VGAStripesSourceCode-20261021/VGASync.v" \
"../../../VGAstripes.srcs/sources_1/imports/VGAStripesSourceCode-20261021/Testbench.v" \

vlog -work xil_defaultlib \
"glbl.v"

