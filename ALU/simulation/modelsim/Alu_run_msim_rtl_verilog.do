transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/Pablo/Desktop/Arqui/proyecto2/Proyecto2-Arqui/ALU {C:/Users/Pablo/Desktop/Arqui/proyecto2/Proyecto2-Arqui/ALU/Alu_tb.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Desktop/Arqui/proyecto2/Proyecto2-Arqui/ALU {C:/Users/Pablo/Desktop/Arqui/proyecto2/Proyecto2-Arqui/ALU/full_adder.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Desktop/Arqui/proyecto2/Proyecto2-Arqui/ALU {C:/Users/Pablo/Desktop/Arqui/proyecto2/Proyecto2-Arqui/ALU/nbit_full_adder.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Desktop/Arqui/proyecto2/Proyecto2-Arqui/ALU {C:/Users/Pablo/Desktop/Arqui/proyecto2/Proyecto2-Arqui/ALU/nbit_multiplier.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Desktop/Arqui/proyecto2/Proyecto2-Arqui/ALU {C:/Users/Pablo/Desktop/Arqui/proyecto2/Proyecto2-Arqui/ALU/nbit_divider.sv}
vlog -sv -work work +incdir+C:/Users/Pablo/Desktop/Arqui/proyecto2/Proyecto2-Arqui/ALU {C:/Users/Pablo/Desktop/Arqui/proyecto2/Proyecto2-Arqui/ALU/alu.sv}

