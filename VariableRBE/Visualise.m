LQM=cellDeath(ct, resultGUI, pln);
resultGUI.cellDeath=LQM.cellDeath;
resultGUI.cellDeath_M=LQM.cellDeath_M;
resultGUI.cellDeath_N=LQM.cellDeath_N;
resultGUI.RBE_M=resultGUI.RBEDose_M./resultGUI.physicalDose;
resultGUI.RBE_N=resultGUI.RBEDose_N./resultGUI.physicalDose;
resultGUI.extraHUChange_linM=linearDensityModel(LQM.cellDeath_M,ct,[0.1 0.5])-linearDensityModel(LQM.cellDeath,ct,[0.1 0.5]);
resultGUI.extraHUChange_linM2=linearDensityModel2(LQM.cellDeath_M,ct)-linearDensityModel2(LQM.cellDeath,ct);
 
% resultGUI.extraMRIChange_M=MRIModel(LQM.cellDeath_M,ct,[5 2 0.2])-MRIModel(LQM.cellDeath,ct,[5 2 0.2]);
parameters = [0.1,1,1];
[resultGUI.ExtraSigmoidM,resultGUI.ExtraSigmoidN] = sigmoidTDC(LQM,ct,parameters,1);
% MRIParams= [D [microm^2/ms],    G[mT/microm],     R [micrometers],   delta [ms],  Delta[ms]
MRIParams = [1.6,                 56.4*1e-6,              10,              10.6,        23.2];
%MRIParams = [1.6,                 109*1e-6,              10,              4.22,        82.7];
% MRIParams = [1.6,                 297*1e-6,              10,              4.28,        16.3];
% MRIParams = [1.6,                 38.9*1e-6,              10,              24.8,        62.2];

t=60;%Time [days]

% resultGUI.cellFraction=cellFraction(LQM.cellSurvival,t);
% resultGUI.MRI = McHughModel(LQM.cellSurvival, MRIParams,t);
% resultGUI.MRI_M=McHughModel(LQM.cellSurvival_M, MRIParams, t);
% resultGUI.MRIextra_M=resultGUI.MRI_M-resultGUI.MRI;
% resultGUI.ADC = ADC(resultGUI.MRI,MRIParams);
% resultGUI.ADCextra_M=resultGUI.ADC-ADC(resultGUI.MRI_M,MRIParams);

MRIParams = [1.6,                 109*1e-6,              10,              4.22,        82.7];

resultGUI.MRI1 = McHughModel(LQM.cellSurvival, MRIParams,t);
resultGUI.MRI_M1=McHughModel(LQM.cellSurvival_M, MRIParams, t);
resultGUI.MRIextra_M1=resultGUI.MRI_M1-resultGUI.MRI1;
resultGUI.ADC1 = ADC(resultGUI.MRI1,MRIParams);
resultGUI.ADCextra_M1=resultGUI.ADC1-ADC(resultGUI.MRI_M1,MRIParams);

 MRIParams = [1.6,                 297*1e-6,              10,              4.28,        16.3];

 resultGUI.MRI2 = McHughModel(LQM.cellSurvival, MRIParams,t);
resultGUI.MRI_M2=McHughModel(LQM.cellSurvival_M, MRIParams, t);
resultGUI.MRIextra_M2=resultGUI.MRI_M2-resultGUI.MRI2;
resultGUI.ADC2 = ADC(resultGUI.MRI2,MRIParams);
resultGUI.ADCextra_M2=resultGUI.ADC2-ADC(resultGUI.MRI_M2,MRIParams);

