# ----------------------------------------------------------------------------
#     _____
#    /     \
#   /____   \____
#  / \===\   \==/
# /___\===\___\/  AVNET Design Resource Center
#      \======/         www.em.avnet.com/drc
#       \====/
# ----------------------------------------------------------------------------
#
#  Disclaimer:
#     Avnet, Inc. makes no warranty for the use of this code or design.
#     This code is provided  "As Is". Avnet, Inc assumes no responsibility for
#     any errors, which may appear in this code, nor does it make a commitment
#     to update the information contained herein. Avnet, Inc specifically
#     disclaims any implied warranties of fitness for a particular purpose.
#                      Copyright(c) 2009 Avnet, Inc.
#                              All rights reserved.
#
# ----------------------------------------------------------------------------

## System Clock
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

# System Reset
set_property PACKAGE_PIN T17 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports reset]

create_clock -period 10.000 [get_ports clk]

## USB-UART Interface
set_property PACKAGE_PIN B18 [get_ports uart_rxd]
  set_property IOSTANDARD LVCMOS33 [get_ports uart_rxd]
set_property PACKAGE_PIN A18 [get_ports uart_txd]
  set_property IOSTANDARD LVCMOS33 [get_ports uart_txd]

## Switches Interface
set_property PACKAGE_PIN V17 [get_ports {gpio_input}]
  set_property IOSTANDARD LVCMOS33 [get_ports {gpio_input}]

## Leds Interface
set_property PACKAGE_PIN U16 [get_ports {gpio_output[0]}]
  set_property IOSTANDARD LVCMOS33 [get_ports {gpio_output[0]}]
set_property PACKAGE_PIN E19 [get_ports {gpio_output[1]}]
  set_property IOSTANDARD LVCMOS33 [get_ports {gpio_output[1]}]

set_property PACKAGE_PIN U19 [get_ports {t_led}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {t_led}]
  
