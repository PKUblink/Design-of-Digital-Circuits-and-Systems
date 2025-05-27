#--------------输入信号---------------------#
#系统时钟
create_clock -period 10.000 -name Clk [get_ports Clk]
set_property -dict {PACKAGE_PIN W5 IOSTANDARD LVCMOS33} [get_ports Clk]
# Btnc 按键用于复位
set_property -dict {PACKAGE_PIN U18 IOSTANDARD LVCMOS33} [get_ports Btnc]
# Btnl
set_property -dict {PACKAGE_PIN W19 IOSTANDARD LVCMOS33} [get_ports Btnl]
# Btnr
set_property -dict {PACKAGE_PIN T17 IOSTANDARD LVCMOS33} [get_ports Btnr]
# Btnu
set_property -dict {PACKAGE_PIN T18 IOSTANDARD LVCMOS33} [get_ports Btnu]
# Btnd
set_property -dict {PACKAGE_PIN U17 IOSTANDARD LVCMOS33} [get_ports Btnd]
# Rst
set_property -dict {PACKAGE_PIN R2 IOSTANDARD LVCMOS33} [get_ports Rst]
#拨位开关sw控制输入数字
set_property -dict {PACKAGE_PIN T1 IOSTANDARD LVCMOS33} [get_ports {Switch[14]}]
set_property -dict {PACKAGE_PIN U1 IOSTANDARD LVCMOS33} [get_ports {Switch[13]}]
set_property -dict {PACKAGE_PIN W2 IOSTANDARD LVCMOS33} [get_ports {Switch[12]}]
set_property -dict {PACKAGE_PIN R3 IOSTANDARD LVCMOS33} [get_ports {Switch[11]}]
set_property -dict {PACKAGE_PIN T2 IOSTANDARD LVCMOS33} [get_ports {Switch[10]}]
set_property -dict {PACKAGE_PIN T3 IOSTANDARD LVCMOS33} [get_ports {Switch[9]}]
set_property -dict {PACKAGE_PIN V2 IOSTANDARD LVCMOS33} [get_ports {Switch[8]}]
set_property -dict {PACKAGE_PIN W13 IOSTANDARD LVCMOS33} [get_ports {Switch[7]}]
set_property -dict {PACKAGE_PIN W14 IOSTANDARD LVCMOS33} [get_ports {Switch[6]}]
set_property -dict {PACKAGE_PIN V15 IOSTANDARD LVCMOS33} [get_ports {Switch[5]}]
set_property -dict {PACKAGE_PIN W15 IOSTANDARD LVCMOS33} [get_ports {Switch[4]}]
set_property -dict {PACKAGE_PIN W17 IOSTANDARD LVCMOS33} [get_ports {Switch[3]}]
set_property -dict {PACKAGE_PIN W16 IOSTANDARD LVCMOS33} [get_ports {Switch[2]}]
set_property -dict {PACKAGE_PIN V16 IOSTANDARD LVCMOS33} [get_ports {Switch[1]}]
set_property -dict {PACKAGE_PIN V17 IOSTANDARD LVCMOS33} [get_ports {Switch[0]}]


#--------------输出信号---------------------#

#4 个数码管输出使能
set_property -dict {PACKAGE_PIN W4 IOSTANDARD LVCMOS33} [get_ports{An[3]}]
set_property -dict {PACKAGE_PIN V4 IOSTANDARD LVCMOS33} [get_ports{An[2]}]
set_property -dict {PACKAGE_PIN U4 IOSTANDARD LVCMOS33} [get_ports{An[1]}]
set_property -dict {PACKAGE_PIN U2 IOSTANDARD LVCMOS33} [get_ports{An[0]}]

#4 个数码管的七段码数据总线输出
set_property -dict {PACKAGE_PIN U7 IOSTANDARD LVCMOS33} [get_ports{Cat_out [6]}]
set_property -dict {PACKAGE_PIN V5 IOSTANDARD LVCMOS33} [get_ports{Cat_out [5]}]
set_property -dict {PACKAGE_PIN U5 IOSTANDARD LVCMOS33} [get_ports{Cat_out [4]}]
set_property -dict {PACKAGE_PIN V8 IOSTANDARD LVCMOS33} [get_ports{Cat_out [3]}]
set_property -dict {PACKAGE_PIN U8 IOSTANDARD LVCMOS33} [get_ports{Cat_out [2]}]
set_property -dict {PACKAGE_PIN W6 IOSTANDARD LVCMOS33} [get_ports{Cat_out [1]}]
set_property -dict {PACKAGE_PIN W7 IOSTANDARD LVCMOS33} [get_ports{Cat_out [0]}]

set_property IOSTANDARD LVCMOS33 [get_ports {An[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {An[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {An[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {An[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Cat_out[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Cat_out[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Cat_out[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Cat_out[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Cat_out[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Cat_out[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Cat_out[0]}]
set_property PACKAGE_PIN W4 [get_ports {An[3]}]
set_property PACKAGE_PIN V4 [get_ports {An[2]}]
set_property PACKAGE_PIN U4 [get_ports {An[1]}]
set_property PACKAGE_PIN U2 [get_ports {An[0]}]

set_property PACKAGE_PIN U16 [get_ports Led_A]
set_property PACKAGE_PIN L1 [get_ports Led_B]
set_property PACKAGE_PIN W7 [get_ports {Cat_Out[0]}]
set_property PACKAGE_PIN W6 [get_ports {Cat_Out[1]}]
set_property PACKAGE_PIN U8 [get_ports {Cat_Out[2]}]
set_property PACKAGE_PIN V8 [get_ports {Cat_Out[3]}]
set_property PACKAGE_PIN U5 [get_ports {Cat_Out[4]}]
set_property PACKAGE_PIN V5 [get_ports {Cat_Out[5]}]
set_property PACKAGE_PIN U7 [get_ports {Cat_Out[6]}]

set_property IOSTANDARD LVCMOS33 [get_ports Led_A]
set_property IOSTANDARD LVCMOS33 [get_ports Led_B]
