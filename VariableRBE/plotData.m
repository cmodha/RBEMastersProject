% %Creating Matrices
nScores=length(resultsAll.scores_linM(1,:));
nParam_lin=length(resultsAll.parameters_lin(1,:));
nParam_sig=length(resultsAll.parameters_sig(1,:));
plottingData.linM = zeros(size(resultsAll.scores_linM));
plottingData.linN = zeros(size(resultsAll.scores_linN));
plottingData.sigM = zeros(size(resultsAll.scores_sigM));
plottingData.sigN = zeros(size(resultsAll.scores_sigN));
%Filling Linear McMahon
plottingData.linM(:,1:nParam_lin) = resultsAll.parameters_lin;
plottingData.linM(:,nParam_lin+1:nParam_lin+nScores) = resultsAll.scores_linM;
%Filling Linear McNamara
plottingData.linN(:,1:nParam_lin) = resultsAll.parameters_lin;
plottingData.linN(:,nParam_lin+1:nParam_lin+nScores) = resultsAll.scores_linN;
%Filling Sigmoidal McMahon
plottingData.sigM(:,1:nParam_sig) = resultsAll.parameters_sig;
plottingData.sigM(:,nParam_sig+1:nParam_sig+nScores) = resultsAll.scores_sigM;
%Filling Sigmoidal McNamara
plottingData.sigN(:,1:nParam_sig) = resultsAll.parameters_sig;
plottingData.sigN(:,nParam_sig+1:nParam_sig+nScores) = resultsAll.scores_sigN;
sigLabels = {'Max TDC Change','Sigmoid Parameter','Tolerance Parameter','Uncertainty in A/B parameter','Max Hu','Mean HU', 'Variance','Grad Var'};
linLabels = {'Max TDC Change','Tolerance Parameter','Uncertainty in A/B parameter','Max Hu','mean HU', 'variance','Grad Var'};

close all
startParCoords(plottingData.sigM,sigLabels)
title("Sigmoid McMahon");
startParCoords(plottingData.sigN,sigLabels)
title("Sigmoid McNamara");
startParCoords(plottingData.linM,linLabels)
title("Linear McMahon");
startParCoords(plottingData.linN,linLabels) 
title("Linear McNamara");

%Different plotting boxclose all
% close all
% figure('Name','Max HU Change');
% tiledlayout(2,2);
% nexttile
% p1=createPlot(resultsAll.parameters_lin, resultsAll.scores_linM(:,1), 'Linear McMahon',linLabels);
% nexttile
%  p2=createPlot(resultsAll.parameters_lin, resultsAll.scores_linN(:,1), 'Linear McNamara',linLabels);
% nexttile
% p3=createPlot(resultsAll.parameters_sig, resultsAll.scores_sigM(:,1), 'Sigmoid McMahon',sigLabels);
% nexttile
% p4=createPlot(resultsAll.parameters_sig, resultsAll.scores_sigN(:,1), 'Sigmoid McNamara',sigLabels);

% figure('Name','HU Volume');
% tiledlayout(2,2);
% nexttile
% p1=createPlot(resultsAll.parameters_lin, resultsAll.scores_linM(:,2), 'Linear McMahon',linLabels);
% nexttile
% p2=createPlot(resultsAll.parameters_lin, resultsAll.scores_linN(:,2), 'Linear McNamara',linLabels);
% nexttile
% p3=createPlot(resultsAll.parameters_sig, resultsAll.scores_sigM(:,2), 'Sigmoid McMahon',sigLabels);
% nexttile
% p4=createPlot(resultsAll.parameters_sig, resultsAll.scores_sigN(:,2),
% 'Sigmoid McNamara',sigLabels)