function y = McMahonRBE(resultGUI)
%Returns the McMahon RBE weighted dose
y = resultGUI.LET*0.055 +1;
y=y.*resultGUI.physicalDose;
end

