#--------------输入信号---------------------#
#系统时钟
create_clock -period 10.000 -name clk [get_ports clk]
set_property -dict {PACKAGE_PIN W5 IOSTANDARD LVCMOS33} [get_ports clk]
# BTNC 按键用于复位
set_property -dict {PACKAGE_PIN U18 IOSTANDARD LVCMOS33} [get_ports rst]
# option 用于选模式
set_property -dict {PACKAGE_PIN W19 IOSTANDARD LVCMOS33} [get_ports option]
#拨位开关 sw控制输入数字
set_property -dict {PACKAGE_PIN R2 IOSTANDARD LVCMOS33} [get_ports {val_in[15]}]
set_property -dict {PACKAGE_PIN T1 IOSTANDARD LVCMOS33} [get_ports {val_in[14]}]
set_property -dict {PACKAGE_PIN U1 IOSTANDARD LVCMOS33} [get_ports {val_in[13]}]
set_property -dict {PACKAGE_PIN W2 IOSTANDARD LVCMOS33} [get_ports {val_in[12]}]
set_property -dict {PACKAGE_PIN R3 IOSTANDARD LVCMOS33} [get_ports {val_in[11]}]
set_property -dict {PACKAGE_PIN T2 IOSTANDARD LVCMOS33} [get_ports {val_in[10]}]
set_property -dict {PACKAGE_PIN T3 IOSTANDARD LVCMOS33} [get_ports {val_in[9]}]
set_property -dict {PACKAGE_PIN V2 IOSTANDARD LVCMOS33} [get_ports {val_in[8]}]
set_property -dict {PACKAGE_PIN W13 IOSTANDARD LVCMOS33} [get_ports {val_in[7]}]
set_property -dict {PACKAGE_PIN W14 IOSTANDARD LVCMOS33} [get_ports {val_in[6]}]
set_property -dict {PACKAGE_PIN V15 IOSTANDARD LVCMOS33} [get_ports {val_in[5]}]
set_property -dict {PACKAGE_PIN W15 IOSTANDARD LVCMOS33} [get_ports {val_in[4]}]
set_property -dict {PACKAGE_PIN W17 IOSTANDARD LVCMOS33} [get_ports {val_in[3]}]
set_property -dict {PACKAGE_PIN W16 IOSTANDARD LVCMOS33} [get_ports {val_in[2]}]
set_property -dict {PACKAGE_PIN V16 IOSTANDARD LVCMOS33} [get_ports {val_in[1]}]
set_property -dict {PACKAGE_PIN V17 IOSTANDARD LVCMOS33} [get_ports {val_in[0]}]


#--------------输出信号---------------------#

#4 个数码管输出使能
set_property -dict {PACKAGE_PIN W4 IOSTANDARD LVCMOS33} [get_ports{an_out[3]}]
set_property -dict {PACKAGE_PIN V4 IOSTANDARD LVCMOS33} [get_ports{an_out[2]}]
set_property -dict {PACKAGE_PIN U4 IOSTANDARD LVCMOS33} [get_ports{an_out[1]}]
set_property -dict {PACKAGE_PIN U2 IOSTANDARD LVCMOS33} [get_ports{an_out[0]}]

#4 个数码管的七段码数据总线输出
set_property -dict {PACKAGE_PIN U7 IOSTANDARD LVCMOS33} [get_ports{cat_out [6]}]
set_property -dict {PACKAGE_PIN V5 IOSTANDARD LVCMOS33} [get_ports{cat_out [5]}]
set_property -dict {PACKAGE_PIN U5 IOSTANDARD LVCMOS33} [get_ports{cat_out [4]}]
set_property -dict {PACKAGE_PIN V8 IOSTANDARD LVCMOS33} [get_ports{cat_out [3]}]
set_property -dict {PACKAGE_PIN U8 IOSTANDARD LVCMOS33} [get_ports{cat_out [2]}]
set_property -dict {PACKAGE_PIN W6 IOSTANDARD LVCMOS33} [get_ports{cat_out [1]}]
set_property -dict {PACKAGE_PIN W7 IOSTANDARD LVCMOS33} [get_ports{cat_out [0]}]

set_property IOSTANDARD LVCMOS33 [get_ports {an_out[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an_out[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an_out[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an_out[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cat_out[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cat_out[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cat_out[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cat_out[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cat_out[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cat_out[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cat_out[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cat_out[0]}]
set_property PACKAGE_PIN W4 [get_ports {an_out[3]}]
set_property PACKAGE_PIN V4 [get_ports {an_out[2]}]
set_property PACKAGE_PIN U4 [get_ports {an_out[1]}]
set_property PACKAGE_PIN U2 [get_ports {an_out[0]}]

set_property PACKAGE_PIN U7 [get_ports {cat_out[6]}]
set_property PACKAGE_PIN U5 [get_ports {cat_out[4]}]
set_property PACKAGE_PIN V8 [get_ports {cat_out[3]}]
set_property PACKAGE_PIN W6 [get_ports {cat_out[1]}]

set_property PACKAGE_PIN V5 [get_ports {cat_out[5]}]
set_property PACKAGE_PIN U8 [get_ports {cat_out[2]}]
set_property PACKAGE_PIN W7 [get_ports {cat_out[0]}]

