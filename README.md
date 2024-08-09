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

16 Mask CMOS Process -> Other file

![image](https://github.com/user-attachments/assets/10def1d8-5411-4086-babc-23108a24b23a)

Creating spice deck from this layout:
Checking directory: pwd
![image](https://github.com/user-attachments/assets/acb2c9e6-76b9-4bc3-86e3-980dd50230de)

Extracting this design: extract all

.ext file created:
![image](https://github.com/user-attachments/assets/e773df1d-0177-4d58-96a1-279d02c5ddff)

We will use this .ext file to create a spice deck for ngspice.

ext2spice cthresh 0 rthresh 0 -> will extract parasitics data.
ext2spice
![image](https://github.com/user-attachments/assets/caccf249-db64-48f8-97aa-9c5756830a5f)

Spice file created:
![image](https://github.com/user-attachments/assets/cea9d513-96d7-429e-9735-209d4f362d1e)

![image](https://github.com/user-attachments/assets/23eadba0-7be5-4a47-a3ed-fa9cea7aa3aa)

Name drain gate source substrate
![image](https://github.com/user-attachments/assets/91ea9da9-e9a5-42c8-bce8-06506823eb67)

Include pshort.lib abd nshort.lib present in below directory:
![image](https://github.com/user-attachments/assets/177af8fc-d2bf-4720-8501-e08ceb39b3f0)

Spice deck after including files, adding other connections and voltage sources:
![image](https://github.com/user-attachments/assets/3cacd3fe-1fe8-4daf-be6f-1fa60505b0fe)

Open pshort.lib and check pmos name. Here it is pshort_model.0 Do same for nmos.
![image](https://github.com/user-attachments/assets/93a5310c-f77e-4329-8bea-3eae201c736e)

Final spice deck after changing names:
![image](https://github.com/user-attachments/assets/2907b097-438e-4042-8233-a925be9fa2b6)


Install ngpsice: sudo apt-get install ngspice

Run ngspice: ngspice sky130_inv.spice
![image](https://github.com/user-attachments/assets/0060a72e-30b8-4c36-91ea-e1db06af58c5)

Plotting output wrt time:
![image](https://github.com/user-attachments/assets/485dc476-29b0-44b7-9a3a-add449195ee4)

![image](https://github.com/user-attachments/assets/34be5243-9d3a-4d86-8871-e6bc2f4b9c1e)

Output is not smooth. Increasing load cap for better waveform results.
![image](https://github.com/user-attachments/assets/a29ad950-e4c1-435e-ae54-9be609143601)

Running again and plotting:
![image](https://github.com/user-attachments/assets/5374aba0-ebd7-4b04-895e-d5f4f2456eaf)

Rise Transition time : Time taken for output to rise from 20% to 80% value

Fall Transition time : Time taken for output to fall from 80% to 20% value

Rise/Fall Cell Delay: TIme difference between input and output when both are at 50%   (Propagation Delay)

Rise Transition time:20% of 3.3 = 0.66V.  Zoom in and click. Data will be printed in terminal.
![image](https://github.com/user-attachments/assets/c7035899-adc4-4505-8905-af1b10c972cd)

![image](https://github.com/user-attachments/assets/966b1b6f-82fa-488b-82bc-7c16e03ee2b5)

Similarly, do for 80% of 3.3 = 2.64V.
![image](https://github.com/user-attachments/assets/f025fc3b-e855-4288-9835-056ff774ca63)

![image](https://github.com/user-attachments/assets/0aec50b1-86db-44f9-9c18-26a9ee21088e)

Difference gives us rise transition time:
![image](https://github.com/user-attachments/assets/9f9b2b12-63ee-4110-95f3-a874392ad644)

Fall Transition:

![image](https://github.com/user-attachments/assets/78284612-5e39-49c9-bd5e-14a763bdb582)

![image](https://github.com/user-attachments/assets/c0dfc13a-ce2d-48a3-a2cf-b6b55beb76b3)

![image](https://github.com/user-attachments/assets/fe014bfe-13cd-4763-b701-b1cabb093245)

4.272e-11
![image](https://github.com/user-attachments/assets/cfa049f1-0ec2-47d5-af31-a15ec8c93b61)





















