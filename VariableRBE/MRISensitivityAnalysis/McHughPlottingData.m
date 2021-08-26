% Function which formats the sensitivity analysis data in a manner
% which can then be plotted
function [plottingData,plottingData_M,plottingData_N,plottingData_M_Extra,plottingData_N_Extra] = McHughPlottingData(resultAll)
%------------NO RBE MODEL ---------------------%
plottingData(:,1:5) = resultAll.parameters(:,1:5);
plottingData(:,6:9) = resultAll.plotScore(:,1:4);

%----------McMahon Model------------------------%
plottingData_M(:,1:5) = resultAll.parameters(:,1:5);
plottingData_M(:,6:9) = resultAll.plotScore_M(:,1:4);


plottingData_M_Extra(:,1:5) = resultAll.parameters(:,1:5);
plottingData_M_Extra(:,6:9) = resultAll.plotScore_M_Extra(:,1:4);
%------------McNamara Model------------------------%
plottingData_N(:,1:5) = resultAll.parameters(:,1:5);
plottingData_N(:,6:9) = resultAll.plotScore_N(:,1:4);

plottingData_N_Extra(:,1:5) = resultAll.parameters(:,1:5);
plottingData_N_Extra(:,6:9) = resultAll.plotScore_N_Extra(:,1:4);
end
