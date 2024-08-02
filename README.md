# PD Course
Physical Design Course. August 2024

## Day 1:
### Agenda: 
### 1) Running synthesis for design "picorv32a" using openLANE flow.
### 2) Calculate flop ratio


Step 1: Go to working directory and invoke openlane flow using docker and flow.tcl

![image](https://github.com/user-attachments/assets/7109eb3d-e39a-4788-bf00-7ab318e2f496)

Step 2: Check config.tcl and sky130A_sky130_fd_sc_hd_config.tcl.

/home/vsduser/Desktop/work/tools/openlane_working_dir/openlane/designs/picorv32a/config.tcl

/home/vsduser/Desktop/work/tools/openlane_working_dir/openlane/designs/picorv32a/config.tcl

config.tcl has lower priority than sky130... file.

![image](https://github.com/user-attachments/assets/d59d1d4d-aaa2-4802-8a8a-947e7d72c913)

Step 3: Input the required packages:
package require openlane 0.9

![image](https://github.com/user-attachments/assets/a628ca5e-a88b-4b79-9cd5-24084170664e)


Step 4: Preparing the design we want to synthesize.
prep -design picorv32a

![image](https://github.com/user-attachments/assets/138529ba-06a7-4071-9b9a-c148d228fca3)

