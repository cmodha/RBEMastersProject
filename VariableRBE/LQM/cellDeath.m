function LQM=cellDeath(ct,resultGUI,pln)
%Implements the linear quadratic model for cell survival

%Cell sruvival for const RBE of 1.1 without regeneration
LQM.cellSurvival =calcLQM(resultGUI.RBExDose,ct,pln);
LQM.cellDeath = 1-LQM.cellSurvival;

% #############   McMahon RBE ##########################################
%For McMahon RBE wihtout regeneration
LQM.cellSurvival_M = calcLQM(resultGUI.RBEDose_M, ct,pln);
LQM.cellDeath_M = 1-LQM.cellSurvival_M;



% #############   McNamara RBE ##########################################
%For McNamara RBE wihtout regeneration
LQM.cellSurvival_N = calcLQM(resultGUI.RBEDose_N, ct,pln);
LQM.cellDeath_N = 1-LQM.cellSurvival_N;
end

