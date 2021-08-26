tic
N=[7       6        6       6];%Number of iterations to perform the parameters over
% TDC    Sig    Tolerance   A/B
N_lin = N(1)*N(3)*N(4); N_sig = N(1)*N(2)*N(3)*N(4);
maxTDCParameter = linspace(0.05,0.2,N(1));%Represents the maximum TDC at 100% cell death
sigmoidParameter = linspace(6.6,30,N(2));%Represents the slope of the sigmoid curve
tissueToleranceParameter=linspace(0.5,1,N(3));%The fraction of the tolerance after which the density starts to change
alphaBetaParameter=linspace(-1,1,N(4));%The fraction of 1sigma away from the alpha/beta values
%Parameter matrix for the two models
parameters_lin=zeros(N_lin,2);
parameters_sig=zeros(N_sig,3);
resultsAll.parameters_lin=zeros(N_lin,3);
resultsAll.parameters_sig=zeros(N_sig,4);
%Fill the sig parameter matrix
n=1;%Counter
for i=alphaBetaParameter
    for x=maxTDCParameter
        for y =sigmoidParameter
            for z=tissueToleranceParameter
               parameters_sig(n,1)=x;
               parameters_sig(n,2)=y;
               parameters_sig(n,3)=z;
               resultsAll.parameters_sig(n,:)=[parameters_sig(n,:), i];
               n=n+1;
            end
        end
    end
end
%Fill the lin parameter matrix
n=1;%Counter
for i=alphaBetaParameter
    for x=maxTDCParameter
        for y =tissueToleranceParameter
               parameters_lin(n,1)=x;
               parameters_lin(n,2)=y;
               resultsAll.parameters_lin(n,:)=[parameters_lin(n,:) i];
               n=n+1;
        end
    end
end


%A/B ratio parameters
newABRatio=1+0.1.*alphaBetaParameter;
x=(newABRatio-1)./(newABRatio+1);
for i=1:N(4)%Create a list of structs with the new alpha/beta values
    newCT(i)=ct;
    newCT(i).alpha=ct.alpha.*(1+x(i));
    newCT(i).beta=ct.beta.*(1-x(i));
end

a=scorePlot(resultGUI.physicalDose,resultGUI,cst);
n=length(a);%Number of scoring outputs

scores_linM=zeros(N_lin,n);
scores_linN=zeros(N_lin,n);
scores_sigM=zeros(N_sig,n);
scores_sigN=zeros(N_sig,n);

%Run sensitivity analysis
n=1;m=1;%Counters
for j=1:N(4)
    j%To track progress
    resultGUI.RBEDose_N=McNamaraRBE(newCT(j),resultGUI);
    LQM = cellDeath(newCT(j), resultGUI,pln);%Calc cell death with the new alpha/beta values

    %Apply linear models
    for i=1:N(1)*N(3)
        matrix1=linearDensityModel(LQM.cellDeath, newCT(j), parameters_lin(n,:));
        matrix=linearDensityModel(LQM.cellDeath_M, newCT(j), parameters_lin(n,:))-matrix1;
        scores_linM(n,:) = scorePlot(matrix,resultGUI,cst);
        
        matrix=linearDensityModel(LQM.cellDeath_N, newCT(j), parameters_lin(n,:))-matrix1;
        scores_linN(n,:) = scorePlot(matrix,resultGUI,cst);
        n=n+1;
    end
    %Apply sigmoid model
    for i=1:N(1)*N(2)*N(3)
        [matrix, matrix1]=sigmoidTDC(LQM, newCT(j), parameters_sig(m,:),1);
        scores_sigM(m,:)=scorePlot(matrix,resultGUI,cst);
        scores_sigN(m,:)=scorePlot(matrix1,resultGUI,cst);
        m=m+1;
    end
end
resultsAll.scores_linM=scores_linM;
resultsAll.scores_linN=scores_linN;
resultsAll.scores_sigM=scores_sigM;
resultsAll.scores_sigN=scores_sigN;
toc

%Search for the most itneresting plot and display it
% [maxvalue, maxHUIndex_linM]=max(resultsAll.scores_linM(:,1));
% [maxvalue, maxHUIndex_linN]=max(resultsAll.scores_linN(:,1));
% [maxvalue, maxHUIndex_sigM]=max(resultsAll.scores_sigM(:,1));
% [maxvalue, maxHUIndex_sigN]=max(resultsAll.scores_sigN(:,1));
% 
% [maxvalue, maxHUVolIndex_linM]=max(resultsAll.scores_linM(:,2));
% [maxvalue, maxHUVolIndex_linN]=max(resultsAll.scores_linN(:,2));
% [maxvalue, maxHUVolIndex_sigM]=max(resultsAll.scores_sigM(:,2));
% [maxvalue, maxHUVolIndex_sigN]=max(resultsAll.scores_sigN(:,2));
% % Display these plots
% 
% resultGUI.maxHU_linM =ct.cubeHU{1}+ linearDensityModel(resultGUI.cellDeathMcMahon,ct,parameters_lin(maxHUIndex_linM,:));
% resultGUI.maxHU_linN =ct.cubeHU{1}+ linearDensityModel(resultGUI.cellDeathMcNamara,ct,parameters_lin(maxHUIndex_linN,:));
% [resultGUI.maxHU_sigM,resultGUI.maxHU_sigN] =sigmoidTDC(resultGUI,ct,parameters_sig(maxHUIndex_sigN,:),0);
% resultGUI.maxHU_sigM = resultGUI.maxHU_sigM + ct.cubeHU{1}; resultGUI.maxHU_sigN=resultGUI.maxHU_sigN +ct.cubeHU{1};
% 
% resultGUI.maxHUVol_linM = ct.cubeHU{1}+linearDensityModel(resultGUI.cellDeathMcMahon,ct,parameters_lin(maxHUVolIndex_linM,:));
% resultGUI.maxHUVol_linN = ct.cubeHU{1}+linearDensityModel(resultGUI.cellDeathMcNamara,ct,parameters_lin(maxHUVolIndex_linN,:));
% [resultGUI.maxHUVol_sigM,resultGUI.maxHUVol_sigN] = sigmoidTDC(resultGUI,ct,parameters_sig(maxHUVolIndex_sigN,:),0);
% resultGUI.maxHUVol_sigM = resultGUI.maxHUVol_sigM+ct.cubeHU{1}; resultGUI.maxHUVol_sigN=resultGUI.maxHUVol_sigN +ct.cubeHU{1};
% 