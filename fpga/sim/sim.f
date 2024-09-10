-L work
-reflib pmi_work
-reflib ovi_ice40up


"/home/jcarlin/e155/e155-lab2/fpga/src/adder.sv" 
"/home/jcarlin/e155/e155-lab2/fpga/src/lab2_jc.sv" 
"/home/jcarlin/e155/e155-lab2/fpga/src/pulse.sv" 
"/home/jcarlin/e155/e155-lab2/fpga/src/seg_decoder.sv" 
"/home/jcarlin/e155/e155-lab2/fpga/src/top.sv" 
"/home/jcarlin/e155/e155-lab2/fpga/testbench/lab2_tb.sv" 
-sv
-optionset VOPTDEBUG
+noacc+pmi_work.*
+noacc+ovi_ice40up.*

-vopt.options
  -suppress vopt-7033
-end

-gui
-top lab2_tb
-vsim.options
  -suppress vsim-7033,vsim-8630,3009,3389
-end

-do "view wave"
-do "add wave /*"
-do "run 100 ns"
