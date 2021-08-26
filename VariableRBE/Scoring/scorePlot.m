function scores = scorePlot(plot,resultGUI,cst)
plot(isnan(plot)) = 0;
idxF=false(size(plot));
for i =2:(height(cst)-2)
    %Loop returns the idex for only OARs and dosed regions
    idx1=false(size(plot));
    idx1(cst{i,4}{1,1}(:))=true;
    idxF=idxF|idx1;
end
idxF=idxF&(resultGUI.physicalDose~=0);
p=plot(idxF);% Look only at the relevant indeces
scores = [max(p,[],'all'), mean(p(p~=0),'all'),var(p(p~=0),1,'all'),GradVar(p)];
end