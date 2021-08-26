N = 4;
phago = linspace(1,2,N);
len = length(resultAllPlan1.parameters);
i = 1;
for n = 1:len
        resultAllPlan1.parameters(n,5) = phago(i);
        i = i+1;
        if i>N
            i=1;
        end
end
