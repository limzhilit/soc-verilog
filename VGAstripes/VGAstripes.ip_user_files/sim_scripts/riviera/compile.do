transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xpm
vlib riviera/xil_defaultlib

vmap xpm riviera/xpm
vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xpm  -incr "+incdir+../../../../../../../Xilinx/2025.1/Vivado/data/rsb/busdef" "+incdir+../../../VGAstripes.gen/sources_1/ip/clk_wiz_1" -l xpm -l xil_defaultlib \
"C:/Xilinx/2025.1/Vivado/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -93  -incr \
"C:/Xilinx/2025.1/Vivado/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../../../../Xilinx/2025.1/Vivado/data/rsb/busdef" "+incdir+../../../VGAstripes.gen/sources_1/ip/clk_wiz_1" -l xpm -l xil_defaultlib \
"../../../VGAstripes.srcs/sources_1/imports/VGAStripesSourceCode-20261021/VGAColourStripes.v" \
"../../../VGAstripes.srcs/sources_1/imports/VGAStripesSourceCode-20261021/VGASync.v" \
"../../../VGAstripes.srcs/sources_1/imports/VGAStripesSourceCode-20261021/Testbench.v" \

vlog -work xil_defaultlib \
"glbl.v"

