function y = McHughSensitivityAnalysis(pln,cst,ct,dij)
%   [Dose       A/B      Time       regrowth rate]
N = [6           6         6                    6];

dose = linspace(55,65,N(1));
ratio = linspace(-1,1,N(2));
days = linspace(1,30,N(3));
regrowth = linspace(0.8,2,N(4));

newABRatio=1+0.1.*ratio;
x=(newABRatio-1)./(newABRatio+1);
for i=1:N(4)%Create a list of structs with the new alpha/beta values
    newCT(i)=ct;
    newCT(i).alpha=ct.alpha.*(1+x(i));
    newCT(i).beta=ct.beta.*(1-x(i));
end

%MRIParams=         [D [microm^2/ms],    G[mT/microm],     R [micrometers],   delta [ms],  Delta[ms]
SensitivityParams = [1.6,                 109*1e-6,              4,              4.22,        82.7];
n=1;%Counter

for j=1:N(1)% Dose loop
    % Dose optimisation
    cst{14,6}{1,1}.parameters{1} = dose(j);
    resultGUI = matRad_fluenceOptimization(dij,cst,pln);% Optimise dose
    for k = 1:N(2) %New A/B Ratio
        resultGUI.RBEDose_M=McMahonRBE(resultGUI); %calculating the RBE models with new A/B ratio
        resultGUI.RBEDose_N=McNamaraRBE(newCT(k),resultGUI);
        LQM = cellDeath(newCT(k),resultGUI,pln);
        for l = 1:N(3) %Number of days post RT
            for m = 1:N(4)  % regrowth rate
                cf = cellFraction(LQM,resultGUI,days(l),regrowth(m)); %Calculating the new cell fraction given the regrowth rate and the time post RT
                % Calculating plots
                McHugh = McHughModel(cf.cellFraction,SensitivityParams);
                plotADC = ADC(McHugh,SensitivityParams);
                McHugh_M = McHughModel(cf.cellFraction_M,SensitivityParams);
                McHugh_N = McHughModel(cf.cellFraction_N,SensitivityParams);
                plotADC_M = ADC(McHugh_M,SensitivityParams);
                plotADC_N = ADC(McHugh_N,SensitivityParams);
                plotADC_M_Extra = plotADC - plotADC_M;
                plotADC_N_Extra = plotADC - plotADC_N;
                %Scoring plots
                resultAll.plotScore(n,:) = scorePlot(plotADC,resultGUI,cst);
                resultAll.plotScore_M(n,:) = scorePlot(plotADC_M,resultGUI,cst);
                resultAll.plotScore_N(n,:) = scorePlot(plotADC_N,resultGUI,cst);
                resultAll.plotScore_M_Extra(n,:) = scorePlot(plotADC_M_Extra,resultGUI,cst);
                resultAll.plotScore_N_Extra(n,:) = scorePlot(plotADC_N_Extra,resultGUI,cst);
                %Recording plot parameters
                resultAll.parameters(n,1) = dose(j);
                resultAll.parameters(n,2) = newABRatio(k);
                resultAll.parameters(n,3) = days(l);
                resultAll.parameters(n,4) = regrowth(m);
                disp(n);
                n=n+1;
            end
        end
    end
end
    y = resultAll;% Output
end




%====Legacy Code ====%
% angles = {{[60 120 -60 -120] [0 0 0 0]},{[85,175] [0 0]},{[300 270] [80 0]},{[70 70] [300 0]}};
% McHugh_parameters = cell(N_McHugh,3);
% n=1;
% j = 1;
% for x = days
%     for y = dose
%         for z = angles
%             McHugh_parameters{n,1} = x;
%             resultAll.parameters(n,1) = x;
%             McHugh_parameters{n,2} = y;
%             resultAll.parameters(n,2) = y;
%             McHugh_parameters{n,3} = z{1,1}{1,1};
%             McHugh_parameters{n,4} = z{1,1}{1,2};
%             resultAll.parameters(n,3) = j;
%             n = n+1;
%             j = j+1;
%             if j>N(3)
%                 j=1;
%             end
%             
%         end 
%     end
% end


% for i = 1:N(3)% Beam angles
%     % Beam angles bit
%     pln.propStf.gantryAngles = angles{i}{1};
%     pln.propStf.couchAngles = angles{i}{2};
%     pln.propStf.numOfBeams = numel(pln.propStf.gantryAngles);
%     pln.propStf.isoCenter = ones(pln.propStf.numOfBeams,1) * matRad_getIsoCenter(cst,ct,0);
%     dij = matRad_calcParticleDose(ct, stf, pln, cst);


