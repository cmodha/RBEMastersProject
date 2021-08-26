function y = linearDensityModel(cellDeath,ct, parameters)
%Linear density model. Inputs the cell death and outputs the change in
%HU Value
HU=ct.cubeHU{1};
newCellFraction = cellDeath-ct.tissueTolerance.*parameters(2);
newCellFraction(newCellFraction<0)=0;
newDensity = (parameters(1)*newCellFraction+1).*ct.density;
newHU= densityToHU(newDensity);
HUChange = HU-newHU;
HUChange(HU>500)=0;
HUChange(HU<-500)=0;
y=HUChange;
end

