LQM=calcCellDeath(ct, resultGUI, pln);
for i =1:10:90
    resultGUI.(['N' num2str(i)])=cellFraction2(LQM.cellSurvival_M,i);
    resultGUI.(['N' num2str(i)])(1,1,1)=0;
    resultGUI.(['N' num2str(i)])(2,1,1)=1;
end