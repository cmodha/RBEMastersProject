function y = getIndividualSpots(resultGUI,planScore);
for i=1:numel(planScore.spots.visiblePixelIdxList)
        isolatedSpot = zeros(planScore.spots.ImageSize);
        isolatedSpot(planScore.spots.visiblePixelIdxList{i,1}) = planScore.spots.plan(planScore.spots.visiblePixelIdxList{i,1});
        resultGUI.(['blob', num2str(i)]) = isolatedSpot;
end

y = resultGUI;
end
