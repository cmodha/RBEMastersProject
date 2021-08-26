function [x,y] = sigmoidTDC(LQM,ct,parameters,option)
newTolerance=ct.tissueTolerance.*parameters(3);
if option==0
    %Gives the new HU distribution due to the sigmoid model
    %Calculate for the McMahon model
    newCellDeath = LQM.cellDeath_M-newTolerance;
    newCellDeath(newCellDeath<0)=0;
    x=applySig(newCellDeath,ct,parameters);
    
    %Calculate for the McNamara model
    newCellDeath = LQM.cellDeath_N-newTolerance;
    newCellDeath(newCellDeath<0)=0;
    y=applySig(newCellDeath,ct,parameters);
    
end
if option==1
    %Gives the 'extra' HU change due to an RBE distrubtion compared to
    newCellDeath = LQM.cellDeath-newTolerance;
    newCellDeath(newCellDeath<0)=0;
    HUChangePhysicalDose=applySig(newCellDeath,ct,parameters);
     
    %Calculate for the McMahon model
    newCellDeath = LQM.cellDeath_M-newTolerance;
    newCellDeath(newCellDeath<0)=0;
    x=applySig(newCellDeath,ct,parameters)-HUChangePhysicalDose;
    
    %Calculate for the McNamara model
    newCellDeath = LQM.cellDeath_N-newTolerance;
    newCellDeath(newCellDeath<0)=0;
    y=applySig(newCellDeath,ct,parameters)-HUChangePhysicalDose;
end
x(ct.cubeHU{1}>500)=0; x(ct.cubeHU{1}<-500)=0;%Cut the HU change for bone
y(ct.cubeHU{1}>500)=0; y(ct.cubeHU{1}<-500)=0;
end
function y=applySig(newCellDeath,ct,parameters) 
    %Returns the newHU after the sigmoid model has been applied
    a=parameters(1); b=parameters(2); c=(log(19)/b)-0.95;%Sigmoid model parameters
    sigmoidTDC = a./(1+exp(-b.*(newCellDeath+c)));%Apply sigmoid model
    newDensity = ct.density.*(1+sigmoidTDC); 
    newHU=densityToHU(newDensity);
    y = newHU;
end
