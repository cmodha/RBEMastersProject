function y = createPlot(plottingData,scoreData,title, xLabels)
%Create a single parallel coordinates plot.
% y = parallelplot(plottingData, 'Color',{'blue','green'});
% d=1:length(plottingData);
% d(mod(d,2)==0)=0;
% d(d~=0)=1;
% y.GroupData = d;
% plottingData=plottingData(1:7,:);
% scoreData=scoreData(1:7);
y = parallelplot(plottingData);
y.GroupData= 1:length(plottingData);
y.LegendVisible = 'off';
y.Jitter = 0.5;
y.Color='red';
y.LineAlpha=greyscale(scoreData);
y.CoordinateTickLabels = xLabels;
y.Title=title;
end