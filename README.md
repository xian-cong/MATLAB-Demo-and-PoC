# Simscape Electrical SIMetrix Cosimulation
You can build your SIMetrix schematic and Simscape model independently. However, the number, name, and type of the ports of the SIMetrix Cosimulation Interface block depend on the options you select for the Cosimulation Interface in SIMetrix. To prepare the models for cosimulation, you therefore need to update the SIMetrix schematic first. To use the SIMetrix Cosimulation Interface block in your Simscape model, you first need to save your SIMetrix schematic, with a predefined interface with Simulink, as a netlist:

1. Build a schematic of the electronics that you want to simulate in SIMetrix.
2. Create a Cosimulation Interface in the SIMetrix schematic — In the Command Shell, enter Simulink_create_interface_symbol.
3. Configure the Cosimulation Interface and connect it to your circuit — How you do this depends on what information you want SIMetrix and Simscape to exchange. For more information about completing this step, see Create Virtual Connections
4. Convert the schematic into a netlist — In the SIMetrix Command Shell, enter netlist followed by the name of your netlist. For example, netlist yourNetlistName.net.

After you save your netlist in SIMetrix, you build the block diagram or electrical network that you want to simulate in Simscape. You then use the SIMetrix Cosimulation Interface block to create virtual connections between your SIMetrix and Simscape models. Specify the file path of the SPICE netlist using the Netlist file path parameter of the SIMetrix Cosimulation Interface block or click the Browse button to select the SPICE netlist using your system browser. Then, to build the input/output device, click the Build I/O button. This action creates the virtual connections between SIMetrix and Simscape and enables the correct ports in the SIMetrix Cosimulation Interface block.

## Prerequisite
- SIMetrix Pro or SIMetrix Elite 9.1 and beyond
- Simscape Electrical

## Working with LTSpice Library
You should be able to use the LTSpice Library by just removing the quotation “” in the .LIB netlist. </br>
Example: </br>
<img width="293" height="89" alt="image" src="https://github.com/user-attachments/assets/857d4146-b2ac-41d7-8157-bb8353040549" /> </br>
<img width="474" height="273" alt="image" src="https://github.com/user-attachments/assets/a69b8028-a3ee-4340-ae4e-02a4dd296975" /> </br>
Make sure that you put the LTSpice library in the correct directory: </br>
```
C:\LTC_Library\lib\...
```
<img width="523" height="248" alt="image" src="https://github.com/user-attachments/assets/cac6be50-509e-49f8-afc0-4fe0916a279e" /> </br>

## Additional Information
https://www.mathworks.com/help/sps/ref/simetrixcosimulationinterface.html
