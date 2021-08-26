%script to run the sensitivity analysis for multiple different beam angles
tic
%=======Plan 1=======%
customPlan;
resultAllPlan1 = McHughSensitivityAnalysis2(pln,cst,ct,dij);
save('Plan 1 results','resultAllPlan1');
clear;
%=======Plan 2=======%
customPlan2;
resultAllPlan2 = McHughSensitivityAnalysis2(pln,cst,ct,dij);
save('Plan 2 results','resultAllPlan2');
clear;
%=======Plan 3=======%
customPlan3;
resultAllPlan3 = McHughSensitivityAnalysis2(pln,cst,ct,dij);
save('Plan 3 results','resultAllPlan3');
clear;
%=======Plan 4=======%
customPlan4;
resultAllPlan4 = McHughSensitivityAnalysis2(pln,cst,ct,dij);
save('Plan 4 results','resultAllPlan4');
clear;
toc