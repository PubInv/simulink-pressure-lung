# simulink-pressure-lung
Our modification of the MIT MatLab/Simulink lung/breathing circuit model which supports pressure sources (as well as flow)

# What We Did

MIT published an initial and very sophisticated MatLab/Simulink model of a human lung and an entire breathing circuit. Because they are developing a bag-squeezing ventilator, they drove this model with a volume/flow source.

For some academic paper we were doing we had to use a pressure model.  For subtle reasons we do not fully understand, using a pressure source in the 
model made the differential equations mathematically intractiable for the MatLab system. By removing the trachea and mask we were able to restore
efficient computation, with no apparent impact on the accuracy of the model for our purposes.


# The Files

[MITLungWorking_NC.slx](https://github.com/PubInv/simulink-pressure-lung/blob/master/model/Lung%20Sim%20PVC/MITLungWorking_NC.slx), .slx.original, and .slxc all correspond to the modified MIT lung model. 

[RunLungSimulation.m](https://github.com/PubInv/simulink-pressure-lung/blob/master/model/Lung%20Sim%20PVC/RunLungSimulation.m): Code to run iterations of the lung model with parameters specified in the first block of code.

[MatlabVentFunction.slx](https://github.com/PubInv/simulink-pressure-lung/blob/master/model/Lung%20Sim%20PVC/MatlabVentFunction.slx): Pressure driver for the lung circuit, outputs periodic pressure inputs according to specified rise time, I:E ratio, and respiratory rate.

# The Contributors

The changes in model were made primarily by Juan Enrique Villacres and Megan Cadena with supervision from Robert L. Read.


