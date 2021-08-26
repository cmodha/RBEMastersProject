function y=calcCellFraction(cellSurvival,resultGUI, t ,tr,tp)
%Models how the cell fraction in irradiated tissue changes over time
% t given in number of days;
t2_rs=tr;%      Short repopulation half life
% t2_rl=t2_rs;% Long repopulation half life
t2_p=tp;%     Phagocytosis half life
% a=cellSurvival./(1-cellSurvival);
% N=a./(a+exp(-t*log(2)/t2_r));%N
% 
% y=N+(1-cellSurvival)*exp(-t*log(2)/t2_p);

id=cellSurvival<0.05;%Id for all voxels with less than 5% of cells
id=id&(resultGUI.physicalDose~=0);% Only calculate in dosed regions
%These voxels should undergo long repopulation

cellSurvival(id)=0.01;% Set
cellDeath=1-cellSurvival;
a=cellSurvival./cellDeath;
% Short repopulation
Ns=a./(a+exp(-t*log(2)/t2_rs));%N
% 
% % Long repopulation
% Nl=a./(a+exp(-t*log(2)/t2_rl));%N

% y=Ns.*(1-id)+cellDeath*exp(-t*log(2)/t2_p);
y=Ns+cellDeath*exp(-t*log(2)/t2_p);
y(isnan(y))=0;
end
