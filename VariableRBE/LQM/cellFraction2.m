function y=cellFraction2(cellSurvival, t)
%Models how the cell fraction in irradiated tissue changes over time
% t given in number of days;
t2_r=1;%Repopulation half life
t2_rl=t2_r*5;%Long repopulation half life
t2_p=0.05;%Phagocytosis half life

% a=cellSurvival./(1-cellSurvival);
% N=a./(a+exp(-t*log(2)/t2_r));%N
% 
% y=N+(1-cellSurvival)*exp(-t*log(2)/t2_p);

id=cellSurvival<0.05;%Id for all voxels with less than 5% of cells
cellSurvival(id)=0;
% Short repopulation
% a=cellSurvival./(1-cellSurvival);
% Ns=a./(a+exp(-t*log(2)/t2_r));%N
% Ns=Ns.*(1-id);
% ys=Ns+(1-cellSurvival)*exp(-t*log(2)/t2_p).*(1-id);

for i=1:(t/t2_r)
    %Loop throught the days of the plot
    cellSurvival=imgaussfilt3(cellSurvival,0.5);
    a=cellSurvival./(1-cellSurvival);
    N=a./(a+0.5);%N
end
y=N+(1-cellSurvival)*exp(-t*log(2)/t2_p).*(1-id);
y(isnan(y))=0;







end