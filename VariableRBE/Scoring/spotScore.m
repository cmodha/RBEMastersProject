%Function that takes a TDC matrix as its input and returns the Spot count
%as well as a cell of pixel indexes.
function spots = spotScore(plan)
%plan(abs(plan)<meanHU+0.5*varHU)=0;
%BWplot = logical(plan);
spots = bwconncomp(plan);
% spots.plan = plan; %Use for debug purposes only (will take up a lot of memory)
s=spots.PixelIdxList;
n=0;
for i=1:numel(s)
    if length(s{i})>8
        n=n+1;
        spots.lengths(n)=length(s{i});
        spots.brightness(n)=mean(plan(s{i}),'all');
        spots.visiblePixelIdxList{n,1} = s{1,i};
    end
end
spots.NumObjects=n;
end