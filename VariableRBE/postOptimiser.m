rbeModels;
LQM = cellDeath(ct,resultGUI,pln);
CF = cellFraction(LQM,resultGUI,30,1,1.4);
% sensitivityAnalysis;
% plotData;
%sigmoidRBE;
%resultGUI.extraHUChange_linM = linearDensityModel(CF.cellFraction_M,ct,0.1)-linearDensityModel(LQM.cellDeath,ct,0.1);
%resultGUI.extraLinHUChangeMcNamara = linearDensityModel(resultGUI.cellDeathMcNamara,ct,0.1)-linearDensityModel(resultGUI.cellDeath,ct,0.1);
%resultGUI.LinHUChangeMcMahon = linearDensityModel(resultGUI.cellDeathMcMahon,ct,0.1);
%resultGUI.LinHUChange = linearDensityModel(resultGUI.cellDeath,ct,0.1);