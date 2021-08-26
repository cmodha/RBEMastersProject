plottingData.Eulitz(:,1:3) = resultsAll.parameters_eulitz;
plottingData.Eulitz(:,4:5) = resultsAll.scores_eulitz;
eulitzLabels = {'Parameter A','Parameter B','Parameter C','Max PIC','Mean PIC'};
close all;
title("Eulitz");
startParCoords(plottingData.Eulitz,eulitzLabels);

