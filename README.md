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

/home/vsduser/Desktop/work/tools/openlane_working_dir/openlane/designs/picorv32a/sky130A_sky130_fd_sc_hd_config.tcl

config.tcl has lower priority than sky130... file.

![image](https://github.com/user-attachments/assets/d59d1d4d-aaa2-4802-8a8a-947e7d72c913)

Step 3: Input the required packages.

Command: package require openlane 0.9

![image](https://github.com/user-attachments/assets/a628ca5e-a88b-4b79-9cd5-24084170664e)


Step 4: Preparing the design we want to synthesize.

Command: prep -design picorv32a

![image](https://github.com/user-attachments/assets/138529ba-06a7-4071-9b9a-c148d228fca3)

"run" directory created in /home/vsduser/Desktop/work/tools/openlane_working_dir/openlane/designs/picorv32a/runs

![image](https://github.com/user-attachments/assets/b7e15584-fed3-4fb9-8cca-75bfbc89d385)

Step 5: Run synthesis

Command: run_synthesis
![image](https://github.com/user-attachments/assets/e2132951-5b36-4019-90fa-519b3edff919)

Synthesized netlist:
/home/vsduser/Desktop/work/tools/openlane_working_dir/openlane/designs/picorv32a/runs/02-08_05-29/results/synthesis/picorv32a.synthesis.v

![image](https://github.com/user-attachments/assets/ae996cd8-df3d-4280-8690-aee6b1bae8b7)

Reports: /home/vsduser/Desktop/work/tools/openlane_working_dir/openlane/designs/picorv32a/runs/02-08_05-29/reports/synthesis
![image](https://github.com/user-attachments/assets/9ae4c6f2-7bd3-4379-9194-4a8b4ccaeed9)


Flop Ratio = Number of flops / total number of cells = 1613/14876 = 0.108429

% Flop = 10.84 %
![image](https://github.com/user-attachments/assets/ddae5d50-2d62-4684-8e2c-8b4488bc83e5)


## Day 2
#### Theory Notes
Core - Place where standard cells/instances (fundamental logic) are placed.
Die - Encapsulates your core.
![image](https://github.com/user-attachments/assets/6a16e930-1ceb-43df-ac92-80a2a357c859)

Utilization factor = Area Occupied by Netlist / Total Area of Core

Aspect Ratio = Height / Width

Preplaced cells - Place some cells like memory/mux/comparator/clock-gating in iser defined locations before tool automatically places other logic cells. Basically these cells are the ones which are used repeatedly in the design.

Decap cells - Ensures that approx ideal voltage reaches standard cells so that logic is either 1 or 0 and logic is not present in undefined region. Placed near standard instances. This takes care of local communication scenario.
We create a power grid mesh so that each instance gets approx ideal voltage.

#### Lab

Congigurable parameters available in openlane: 
/home/vsduser/Desktop/work/tools/openlane_working_dir/openlane/configuration/README.md
![image](https://github.com/user-attachments/assets/80e7d9cb-07da-49f2-8271-9f97c79a7e39)

Tool defaults in floorplan.tcl: /home/vsduser/Desktop/work/tools/openlane_working_dir/openlane/configuration/floorplan.tcl

![image](https://github.com/user-attachments/assets/f67b5f0e-33a3-4602-b28b-913a49f4995f)

This file has lowest priority.

Next higher priority - /home/vsduser/Desktop/work/tools/openlane_working_dir/openlane/designs/picorv32a/config.tcl

Next higher priority - /home/vsduser/Desktop/work/tools/openlane_working_dir/openlane/designs/picorv32a/sky130A_sky130_fd_sc_hd_config.tcl

Parameters in config.tcl:
![image](https://github.com/user-attachments/assets/b1e7a0ad-5aad-4564-9448-61f2074cab78)
Note: Metal layers created in floorplan stage in openlane tool are always +1 than what user specifies.

Paramaters in sky130A_sky130_fd_sc_hd_config.tcl:
![image](https://github.com/user-attachments/assets/1d20164b-03dd-4373-a031-cc203b0b1d14)

Running floorplan:

Command: run_floorplan
![image](https://github.com/user-attachments/assets/2b2e16bc-474f-45e0-835d-b4527eb9d0c1)
![image](https://github.com/user-attachments/assets/0902f9f8-3b38-4fb5-9941-5893f03b78bd)

ioPlacer log: 
/home/vsduser/Desktop/work/tools/openlane_working_dir/openlane/designs/picorv32a/runs/02-08_07-48/logs/floorplan/4-ioPlacer.log
![image](https://github.com/user-attachments/assets/3ab7443d-b758-4a65-bf48-2578d2290ef0)

Core util taken by tool: /home/vsduser/Desktop/work/tools/openlane_working_dir/openlane/designs/picorv32a/runs/02-08_07-48/config.tcl
![image](https://github.com/user-attachments/assets/986afeb0-4358-4dc1-8f97-00c1b00600b8)

DEF file dumped by tool in results directory: /home/vsduser/Desktop/work/tools/openlane_working_dir/openlane/designs/picorv32a/runs/02-08_07-48/results/floorplan/picorv32a.floorplan.def
![image](https://github.com/user-attachments/assets/348986de-b4ad-4818-8ab0-cf31a7f82de6)

Using magic tool to view design:

Command: magic -T /home/vsduser/Desktop/work/tools/openlane_working_dir/pdks/sky130A/libs.tech/magic/sky130A.tech lef read ../../tmp/merged.lef def read picorv32a.floorplan.def
![image](https://github.com/user-attachments/assets/0d1fd291-7e52-4846-a375-9f4ede4cbc59)

Press "S" to select design and "V" to put in centre.
![image](https://github.com/user-attachments/assets/b09ba89d-d6a4-4b17-a3ea-3e2aeb0789dd)

To zoom in, click left mouse button, then right mouse button. A rectangle will form. Press "Z".












