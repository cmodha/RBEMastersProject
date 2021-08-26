function CF = cellFraction(LQM,resultGUI,t,tr,tp)
%Calculates the (time dependent) cell fractions for the different RBE
%models
CF.cellFraction=calcCellFraction(LQM.cellSurvival,resultGUI,t,tr,tp);
CF.cellFraction_M=calcCellFraction(LQM.cellSurvival_M,resultGUI,t,tr,tp);
CF.cellFraction_N=calcCellFraction(LQM.cellSurvival_N,resultGUI,t,tr,tp);
end