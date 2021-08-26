% Function which scores plots based on the mean of the gradient magnitude multiplied
% by the variance of the Gradient Magnitude
function y = GradVar(plot)
GMag = imgradient3(plot);
GMagMean = mean(GMag,'all','omitnan');
GMagVar = var(GMag,1,'all','omitnan');
y = GMagMean * GMagVar;
end
