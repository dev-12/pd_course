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

Area of design after floorplan:

X length = 529275 units = 529272/1000 microns = 529.272 microns
Y length = 539995 units = 539995/1000 microns = 539.995 microns

Area = 529.272 * 539.995 sq. microns = 285804.237 microns

Using magic tool to view design:

Command: magic -T /home/vsduser/Desktop/work/tools/openlane_working_dir/pdks/sky130A/libs.tech/magic/sky130A.tech lef read ../../tmp/merged.lef def read picorv32a.floorplan.def
![image](https://github.com/user-attachments/assets/0d1fd291-7e52-4846-a375-9f4ede4cbc59)

Press "S" to select design and "V" to put in centre.
![image](https://github.com/user-attachments/assets/b09ba89d-d6a4-4b17-a3ea-3e2aeb0789dd)

To zoom in, click left mouse button, then right mouse button. A rectangle will form. Press "Z" to zoom. Shift + Z to zoom out.

Hover over signal IO and press "S". Type "what" in console to get details.
![image](https://github.com/user-attachments/assets/d878273f-f008-4584-a511-1dd15c621c1a)
![image](https://github.com/user-attachments/assets/f65cb501-ac3d-46c4-b100-5223a40fcb39)


Selecting bottom vertical IO pin:

![image](https://github.com/user-attachments/assets/fcbb6004-b97a-4828-b695-b107a3ff9976)

Proper layer numbers got honoured. VMETAL was given as 4. Here we see met3. met3 is 4th layer.
![image](https://github.com/user-attachments/assets/54fc0d95-c53f-4915-be8d-2ad492ac5788)



Running Placement.
Command: run_placement

![image](https://github.com/user-attachments/assets/98c36edd-71db-4ad6-b854-c2e9f0d16dde)

![image](https://github.com/user-attachments/assets/9fb79397-3c35-4ad6-94e5-618909b9ec1b)

New DEF in /home/vsduser/Desktop/work/tools/openlane_working_dir/openlane/designs/picorv32a/runs/02-08_07-48/results/placement/picorv32a.placement.def

Open DEF using magic.

Command: magic -T /home/vsduser/Desktop/work/tools/openlane_working_dir/pdks/sky130A/libs.tech/magic/sky130A.tech lef read ../../tmp/merged.lef def read picorv32a.placement.def &
![image](https://github.com/user-attachments/assets/24c531c9-ad1d-4bf6-9b18-9791d95a3147)
Zoomed In:
![image](https://github.com/user-attachments/assets/7ce7ffb0-0a08-43b8-9431-d64f7defe095)


PDN is done post placement, CTS in openlane. In general, PDN happens during floorplan. 



## Day 3
Changing IO pin placement after run is completed.
Below command in terminal:

set ::env(FP_IO_MODE) 2

Run floorplan

![image](https://github.com/user-attachments/assets/59aad206-c730-4b80-b6da-42f2b043443c)

Open def and check IO pin locations:

magic -T /home/vsduser/Desktop/work/tools/openlane_working_dir/pdks/sky130A/libs.tech/magic/sky130A.tech lef read ../../tmp/merged.lef def read picorv32a.placement.def &

Pin locations changed:
![image](https://github.com/user-attachments/assets/87b05d52-36ce-45f1-93ba-e8ec5a349223)



VTC-Spice Simulations

Circuit:
![image](https://github.com/user-attachments/assets/ca1105d5-1279-4e66-ad26-80659307811c)

Transistor_name drain gate source substrate transistor_name_in_file width length
![image](https://github.com/user-attachments/assets/72835ae1-f559-41ee-a028-bfe4e4849a5e)

Final spice deck:
![image](https://github.com/user-attachments/assets/c16c45ce-3bfa-4ced-9519-0480e392b6cf)

.dc Vin 0 2.5 0.05

DC sweep from 0 to 2.5 in steps of 0.05

Spice waveform after simulation:
![image](https://github.com/user-attachments/assets/9092c547-aa26-4059-bc93-6889df8b2562)

Increasing width of PMOS and doing simulation:
![image](https://github.com/user-attachments/assets/5efcc166-8e20-47ed-b733-6d6e707fd7cb)

Vm -> both pmos and nmos in saturation region. High current.
![image](https://github.com/user-attachments/assets/b12add95-9329-4787-837d-7e4c981b76a1)

Transient sim spice deck:
![image](https://github.com/user-attachments/assets/4a411215-8b5f-4304-834a-321986fe2029)

Transient sim output: 
Measuring rise and fall delay at 50% point
![image](https://github.com/user-attachments/assets/33172565-4fe1-4ecb-99e8-a8c3f97e6a40)

![image](https://github.com/user-attachments/assets/7608260d-fd81-4a1f-a6ed-b6167e05c179)

Copy repository link:
![image](https://github.com/user-attachments/assets/bf3e013e-8af4-4b84-8dc5-abf25400420f)

Add in vnc:
git clone https://github.com/nickson-jose/vsdstdcelldesign.git
![image](https://github.com/user-attachments/assets/636385cd-d984-4c5d-8ee2-c6dc259190ba)

Copy tech file:

cp sky130A.tech /home/vsduser/Desktop/work/tools/openlane_working_dir/openlane/vsdstdcelldesign
![image](https://github.com/user-attachments/assets/19e5b41d-5ac0-458a-acba-4aeba2051cd6)

Open inverter layout in magic:
![image](https://github.com/user-attachments/assets/bfcbe3ad-b88c-4b17-a45f-a430d9009b83)

![image](https://github.com/user-attachments/assets/6de8c17c-8304-4184-923b-ffd4a4f1098a)


16-nask CMOS Process:
![image](https://github.com/user-attachments/assets/ff5923b6-1486-4223-ae45-ae572db57d90)

![image](https://github.com/user-attachments/assets/f17fb6f6-45d2-4d7e-af60-e22735a13290)

![image](https://github.com/user-attachments/assets/37242e0e-8afc-4d2f-b94a-3120dcd7d5fa)

![image](https://github.com/user-attachments/assets/871cec15-8645-4f7d-9997-5b20343c40fa)

![image](https://github.com/user-attachments/assets/5158c90b-4a22-4b21-9b37-fb5b77b3f3ed)

![image](https://github.com/user-attachments/assets/0c037e99-15ed-43d3-b589-7528ad0818ed)

Bird's beak basically isolate the transistors.
![image](https://github.com/user-attachments/assets/b6de9f58-42cd-485b-990e-33d90357c626)

![image](https://github.com/user-attachments/assets/8ec2adf0-c0b6-4264-b913-38b67d798790)


Formartion of n-well and p-well
![image](https://github.com/user-attachments/assets/4e493c83-3dd5-4844-90d8-f31d56f043fc)

![image](https://github.com/user-attachments/assets/4c0d05cf-2804-4e74-b3f4-476ef1d028d4)

p-well using boron. (ion implantation also damages oxide layer - will repair later.)
![image](https://github.com/user-attachments/assets/9aad631f-8731-4285-9157-1e91b23e4e3c)

n-well using phosphorous.

Twin tub process:
![image](https://github.com/user-attachments/assets/1a16c116-149b-4f2f-a2ca-f28f78241c61)

Formation of gate:
![image](https://github.com/user-attachments/assets/6b7bf2d5-616a-4a05-8a6d-fd5aa12e9b90)

![image](https://github.com/user-attachments/assets/92fa292b-46c6-4497-9c59-d4566d37f01d)

4th mask. Doping P-well
![image](https://github.com/user-attachments/assets/f5da86ad-e25d-4115-bf90-0fe7604bf4c9)

Low energy as we just want on surface. Doping concentration depends on threshold voltage.
![image](https://github.com/user-attachments/assets/9896176c-f47c-4484-866b-571b28487f08)

5th Mask:
![image](https://github.com/user-attachments/assets/517c3b83-f3fe-4aec-989b-8824f21ca8ff)

![image](https://github.com/user-attachments/assets/6e45da21-d807-4fde-93f6-e67562cac46c)

Fixing oxide:
![image](https://github.com/user-attachments/assets/bd1892f7-f0cd-454d-8c1e-f35f37e1202a)
![image](https://github.com/user-attachments/assets/f99a0c03-4dbb-4886-845a-71c015998681)

Gate formation:
![image](https://github.com/user-attachments/assets/10d0708e-860c-4ce2-a118-d48f827c1293)

![image](https://github.com/user-attachments/assets/e07a6aa6-7d9c-4816-90c7-453da6f7bb33)

![image](https://github.com/user-attachments/assets/e66c52ac-b388-45a2-a1db-9d2e205258bc)

![image](https://github.com/user-attachments/assets/c4065b47-5689-4396-9b28-366c50771b42)

![image](https://github.com/user-attachments/assets/a45c25c9-403e-401e-b924-120aebd99373)

![image](https://github.com/user-attachments/assets/c04049c9-cda9-4225-a6ea-78579a8faa55)

















































