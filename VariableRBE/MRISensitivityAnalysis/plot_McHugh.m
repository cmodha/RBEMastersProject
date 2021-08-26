function plot_McHugh(resultAll)
%Plot the results for McHugh sensitivity analysis

[plottingData,plottingData_M,plottingData_N,plottingData_M_Extra,plottingData_N_Extra] = McHughPlottingData(resultAll);
labels={'Tumour Dose','a/b Ratio','Days Post RT','Cell Division Half Life','Phagocytosis Rate','Max', 'Mean','Variance', 'Gradient*Variance'};
% close all;
% figure; title('Physical Dose');
% startparcords(plottingData,labels);


% startParCoords(plottingData_M,labels);
% title('McMahon RBE Dose');

startParCoords(plottingData_M_Extra,labels);
title('McMahon RBE Dose Extra');


% startParCoords(plottingData_N,labels);
%  title('McNamara RBE Dose');
 

startParCoords(plottingData_N_Extra,labels);
title('McNamara RBE Dose Extra');
end

