resultGUI.RBEDose_M=McMahonRBE(resultGUI);
resultGUI.RBEDose_N=McNamaraRBE(ct,resultGUI);

% a = abs(resultGUI.RBEMcMahon-resultGUI.RBEMcNamara);
% a(resultGUI.physicalDose<0.01)=0;
% 
% resultGUI.RBEUncertaintyMcMahon = a./resultGUI.RBEMcMahon;
% resultGUI.RBEUncertaintyMcMahon(resultGUI.RBEUncertaintyMcMahon>0.5)=0;
% resultGUI.RBEUncertaintyMcNamara = a./resultGUI.RBEMcNamara;
% resultGUI.RBEUncertaintyMcNamara(resultGUI.RBEMcNamara==0)=0;
