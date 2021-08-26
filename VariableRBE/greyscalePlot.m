
score = resultsAll.scores_linN(:,1);
s=greyscale(score);
s1=greyscale1(score);
x=1:length(score);
x(:)=0;
scatter(s,x,'bx');
scatter(s1,x+0.1,'rx');
axis([ 0 1 -0.5 0.5]);
function x = greyscale1(scoreData)
%     maxVal = log(max(scoreData));
%     minVal = log(min(scoreData));
%     x=(log(scoreData)-minVal)/(maxVal-minVal);
    
%      maxVal = exp(max(scoreData));
%     minVal = exp(min(scoreData));
%     x=(exp(scoreData)-minVal)/(maxVal-minVal);
      xMax=max(scoreData);
      xDiff=exp(min(scoreData)-xMax);
      x=(exp(scoreData-xMax) - xDiff)/(1-xDiff);


%     maxVal = max(scoreData);
%     minVal = min(scoreData);
%     x = (scoreData-minVal+0.1)/(maxVal-minVal+0.1);

      xMax=max(scoreData);
      xDiff=1.1^(min(scoreData)-xMax);
      x=(1.1.^(scoreData-xMax) - xDiff)/(1-xDiff);
end