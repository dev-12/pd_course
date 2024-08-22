![image](https://github.com/user-attachments/assets/8326acc7-05c4-4690-9492-a40271ef352f)![image](https://github.com/user-attachments/assets/9716aeff-fe18-4023-b9ee-364b3fbfcbb1)# PD Course
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

![image](https://github.com/user-attachments/assets/4c60f863-a2ac-4566-bfb5-a49f3066d1fb)

Cell Rise Delay: Time difference between input and output when output is rising and reached 50%

![image](https://github.com/user-attachments/assets/9b684d0c-ed5a-426d-82e7-2762f333b1e8)

![image](https://github.com/user-attachments/assets/85879d7c-5954-4c65-8ce3-fc5af6e5f2f6)

Cell Rise Delay: 5.721999999999993e-11

![image](https://github.com/user-attachments/assets/22057ab8-f158-4463-820d-1fef428845b6)


Cell Fall Delay: Time difference between input and output when output is falling and reached 50%

![image](https://github.com/user-attachments/assets/20024e4c-2ed5-4d99-b0ac-29e113f25861)

![image](https://github.com/user-attachments/assets/b1ac089a-1a0d-4980-b14b-0255195a10fc)

Cell Fall Delay: 2.538999999999964e-11

![image](https://github.com/user-attachments/assets/079cb2a8-43e7-49cf-a537-accac2e31f76)


Magic DRC documentation: http://opencircuitdesign.com/magic/

Skywater documentation: https://skywater-pdk.readthedocs.io/en/main/

DRC rules: http://opencircuitdesign.com/magic/techref/maint2.html#drc

Download DRC tests:
![image](https://github.com/user-attachments/assets/c2376781-f8a2-4246-a0fa-5743e161600e)

Open Magic: magic -d XR

Open met3.mag
![image](https://github.com/user-attachments/assets/b7972ac2-f9af-4959-820a-50436dc0115e)

![image](https://github.com/user-attachments/assets/28835184-fb40-4537-bcda-9074f795afa4)

Load poly.mag
![image](https://github.com/user-attachments/assets/9edf36f3-8f2a-4979-a00b-e92d4c462254)

Rule: 
![image](https://github.com/user-attachments/assets/3f18ba6a-4510-41a7-87b2-98f9b17c7326)

Open tech file:
![image](https://github.com/user-attachments/assets/5d1aa5fe-d32e-4af6-8b3f-2fbeddd7d12a)

![image](https://github.com/user-attachments/assets/d8d5836b-96d7-405a-856e-80ab1eda2309)

No rule defined between poly resistor to poly. Adding rule:
![image](https://github.com/user-attachments/assets/3eade8c9-2e8a-4b9b-aad5-abe29cf99a22)

![image](https://github.com/user-attachments/assets/f40ad94c-39da-4731-96d8-265e42076564)

Load updated tech from console: tech load sky130A.tech

Run DRC again. drc check
![image](https://github.com/user-attachments/assets/ae0453c0-ff7e-4392-b371-248bf72957a7)




## Day 4

Extracting LEF from .mag file.

![image](https://github.com/user-attachments/assets/23e925c0-c5d2-43fd-8c65-99a451a07df1)

![image](https://github.com/user-attachments/assets/69dfa0cc-068a-41a2-9f1f-bf542eab7a85)

Lab steps to convert grid info to track info:

Track can be defined as a line on which metal layers are drawn. A track means one M1 Pitch. Height of Standard cell is generally measured in term of no. of tracks inside it. like a 6T standard cell means that the height of the standard cell is 6 Track of M1.
![image](https://github.com/user-attachments/assets/285d6a61-8446-436e-9865-ce78078c8990)

![image](https://github.com/user-attachments/assets/3d4eb135-ecc9-4f1f-b033-73fa2f03263b)

![image](https://github.com/user-attachments/assets/bcdd2957-36df-4b1d-bd5f-38098c949a51)

Before:
![image](https://github.com/user-attachments/assets/453791cd-5387-474f-9dfd-920d208428f7)

After grid change:
![image](https://github.com/user-attachments/assets/43121cf8-dd4f-4af7-a14f-1da4b0eea1b3)

Convert magic layouy to std cell LEF:

width of std cell must be odd multiple of x-pitch. Similar for height.

Labels to ports:

select the layer where we want to define port -> Edit -> Text
![image](https://github.com/user-attachments/assets/17bd5650-bac2-4e81-bc91-24d5b9ddb3af)


https://github.com/nickson-jose/vsdstdcelldesign

![image](https://github.com/user-attachments/assets/e0ebcf26-7fda-4c28-8436-24e2d11fb851)

![image](https://github.com/user-attachments/assets/ece5d893-4b24-46b5-9452-0a19f37682c7)

![image](https://github.com/user-attachments/assets/6590e851-57ad-46ef-a022-4b3ff42a6bc8)

![image](https://github.com/user-attachments/assets/41673b34-4f69-4e48-be24-733fb02d366c)

![image](https://github.com/user-attachments/assets/6b6a1850-e9ec-48a5-a091-88910d630ae3)

![image](https://github.com/user-attachments/assets/47cbe962-7164-4d73-9a37-fd4562f03b80)

LEF file is ready now.

Copy lef file into src.

cp sky130_vsdinv.lef /home/vsduser/Desktop/work/tools/openlane_working_dir/openlane/designs/picorv32a/src

![image](https://github.com/user-attachments/assets/2e582dcc-32ba-4e85-8393-9015c692a15e)

Our cell is defined in lib file: 
![image](https://github.com/user-attachments/assets/e0cfa181-58d7-4d01-8d94-5b12af421e22)

slow fast typical - all three will be used during STA. Copying:
![image](https://github.com/user-attachments/assets/33c1c88c-70c2-40fe-9b0d-66a3923c62a8)


Commands to be added to config.tcl to include our custom cell in the openlane flow

set ::env(LIB_SYNTH) "$::env(OPENLANE_ROOT)/designs/picorv32a/src/sky130_fd_sc_hd__typical.lib"

set ::env(LIB_FASTEST) "$::env(OPENLANE_ROOT)/designs/picorv32a/src/sky130_fd_sc_hd__fast.lib"

set ::env(LIB_SLOWEST) "$::env(OPENLANE_ROOT)/designs/picorv32a/src/sky130_fd_sc_hd__slow.lib"

set ::env(LIB_TYPICAL) "$::env(OPENLANE_ROOT)/designs/picorv32a/src/sky130_fd_sc_hd__typical.lib"

set ::env(EXTRA_LEFS) [glob $::env(OPENLANE_ROOT)/designs/$::env(DESIGN_NAME)/src/*.lef]

![image](https://github.com/user-attachments/assets/a8003492-cf16-44f8-8ed3-9a4137231e70)

![image](https://github.com/user-attachments/assets/0a8e0a6e-cb04-41a8-a130-db3076b8d7e5)


Adiitional commands to include newly added lef to openlane flow

set lefs [glob $::env(DESIGN_DIR)/src/*.lef]

add_lefs -src $lefs

Now that the design is prepped and ready, we can run synthesis using following command

run_synthesis

![image](https://github.com/user-attachments/assets/9eaec4cc-bfc5-449d-9881-aaa817c2626f)

We have 1554 instances:
![image](https://github.com/user-attachments/assets/f47d8985-04cf-49a3-99ce-a02040ef7112)

![image](https://github.com/user-attachments/assets/75b15acc-b127-4904-8c53-c7f449356f7a)


Delay Tables
![image](https://github.com/user-attachments/assets/5b555be8-cd06-480c-b780-6b44ef03edd2)

Skew 0 because of symmetric buffers - same load / buffer at each level.
![image](https://github.com/user-attachments/assets/6e48234d-41ba-4428-9948-c4b3ab5d20dc)


Check opensta report. Violations:

tns is the total negative slack and wns is the worst negative slack.
 
![image](https://github.com/user-attachments/assets/cca97a8c-43f2-40dc-82ae-30e09ba9b97b)\


![image](https://github.com/user-attachments/assets/935c256e-ca40-4895-92e1-8eb4b380fb81)

Chip area:
![image](https://github.com/user-attachments/assets/b89712d4-1fb0-4401-9ea3-089566427991)

![image](https://github.com/user-attachments/assets/2c80c7e7-cb2d-462d-9e41-3144b29d0548)

Command to display current value of variable SYNTH_STRATEGY

echo $::env(SYNTH_STRATEGY)

Command to set new value for SYNTH_STRATEGY

set ::env(SYNTH_STRATEGY) "DELAY 3"

Above startegy basically is trade-off between area and delay. Will fix delay but increase area.

Command to display current value of variable SYNTH_BUFFERING to check whether it's enabled

echo $::env(SYNTH_BUFFERING)

reduces wire delay by inserting buffers.

Command to display current value of variable SYNTH_SIZING -> echo $::env(SYNTH_SIZING)

Basically whether cell upsizing and downsizing is enabled or not.

Command to set new value for SYNTH_SIZING -> set ::env(SYNTH_SIZING) 1

Command to display current value of variable SYNTH_DRIVING_CELL to check whether it's the proper cell or not -> echo $::env(SYNTH_DRIVING_CELL)

Now that the design is prepped and ready, we can run synthesis using following command -> run_synthesis

![image](https://github.com/user-attachments/assets/3ea7a612-ea82-43eb-81c1-86817dee9925)

Synthesis failed:
![image](https://github.com/user-attachments/assets/074c421a-3287-4d07-af48-7fa5a1f52fa9)

Overwrite and redo. Following commands:














