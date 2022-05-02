#!/bin/sh

# sram
sudo openocd -f numato_mimas_a7_mini.cfg -c "init" -c "pld load 0 ../vivado/shoot-through.runs/impl_1/test_fpga.bit" -c "shutdown"

# flash - not guaranteed to work, first you need to convert bit file into bin file 
#sudo openocd -f numato_mimas_a7_mini.cfg -c "init" -c "jtagspi_init 0 bscan_spi_xc7a50t" -c "jtagspi_program top.bin 0x00000000"  -c "shutdown"


#reference:
# https://numato.com/kb/programming-mimas-a7-using-openocd-and-xc3sprog-in-linux/
