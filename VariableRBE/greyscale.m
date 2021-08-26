function x = greyscale(scoreData)
    maxVal = max(scoreData);
    minVal = min(scoreData);
    x = (scoreData-minVal)./(maxVal-minVal);
%      xMax=max(scoreData);
%       xDiff=1.1^(min(scoreData)-xMax);
%       x=(1.1.^(scoreData-xMax) - xDiff)/(1-xDiff);
end
