function y = EulitzSensitivityAnalysis(physicalDose,LET)
tic
N = [20 20 20];
N_eulitz = N(1)*N(2)*N(3);
parameter_A = linspace(-5,-1.84,N(1));
parameter_B = linspace(-0.2,0.2,N(2));
parameter_C = linspace(-0.4,0.2029,N(3));
parameters_eulitz = zeros(N_eulitz,3);
n=1;
for x=parameter_A
    for y =parameter_B
        for z=parameter_C
            parameters_eulitz(n,1)=x;
            parameters_eulitz(n,2)=y;
            parameters_eulitz(n,3)=z;
            resultsAll.parameters_eulitz(n,:)=[parameters_eulitz(n,:)];
            n=n+1;
        end
    end
end
for i = 1:N_eulitz
   PIC = eulitz(physicalDose,LET,resultsAll.parameters_eulitz(i,:));
   scorePIC = eulitzScore(PIC);
  resultsAll.scores_eulitz(i,:) = scorePIC;
end
y= resultsAll
end