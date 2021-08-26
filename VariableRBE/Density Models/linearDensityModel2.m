function y = linearDensityModel2(cellFraction,ct)
%Linear density model. Inputs the cell death and outputs the change in
%HU Value
HU=ct.cubeHU{1};
newDensity = cellFraction.*ct.density;
newHU= densityToHU(newDensity);
HUChange = HU-newHU;
HUChange(HU>500)=0;
HUChange(HU<-500)=0;
y=HUChange;
end