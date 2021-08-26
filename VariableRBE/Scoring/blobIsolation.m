function y = blobIsolation(plot)
thresh = multithresh(plot,12);
seg_I = imquantize(plot,thresh);
seg_I(seg_I<7) = 0;
mask = logical(seg_I);
blobs = mask .* plot;
planScore = spotScore(blobs);
for i = 1:numel(planScore.visiblePixelIdxList)
    if length(planScore.visiblePixelIdxList{i,1})>1000
        isolatedBlob = zeros(size(plot));
        isolatedBlob(planScore.visiblePixelIdxList{i,1}) = plot(planScore.visiblePixelIdxList{i,1});
        blobs = blobs - isolatedBlob;
        splitBlob = blobIsolation(isolatedBlob);
        blobs = blobs + splitBlob;
     end
 end
y = blobs;
end