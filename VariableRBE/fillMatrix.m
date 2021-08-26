%Fill matrix of alpha and beta values for the tissues, and the maximum
%permissible dose for a tissue
%Once the values have been inputted, a new copy of the relavant phantom
%should be saved, with the values as a variable
ct.alpha = ct.cubeHU{1};
ct.beta  = ct.cubeHU{1};
ct.tissueTolerance = ct.cubeHU{1};

ct.tissueTolerance(:) = 0;
ct.alpha(:) = 0;
ct.beta(:) = 0;

%AlphaBeta values for ALDERSON
%           'Skin';    'Eye(L)';  'Eye(R)'; 'Opticus(L)'; 'Opticus(R)'; 'Chiasma'; 'Brainstem'; 'Cord'; 'Temp(L)'; 'Temp(R)'; 'Parotis(L)'; 'Parotis(R)'; 'CTV';  'PTV'}
alphaValues = [0.0453,  0.0519,  0.0519,     0.0497,       0.0497,      0.0251,     0.0544,    0.0382,    0,          0,       0.0341,         0.0341,     0.035,  0.035];
betaValues  = [0.021,   0.0173,  0.0173,     0.0166,       0.0166,      0.0084,     0.0259,    0.0153,    0,          0,       0.0114,         0.0114,     0.0167, 0.0167];
tolerance   = [48.54,   44.67,   44.67,      49.34,        49.34,       49.54,      59.20,     46.89,     0,          0,       26.38,          26.38,      0,      0];
%Alpha/Beta values for LIVER




tissueToleranceValues = alphaValues;

for i=1:height(cst)
    if  ~isequal(lower(cst{i,2}),'skin')
        ct.alpha(cst{i,4}{1,1}(:)) = alphaValues(i);
        ct.tissueTolerance(cst{i,4}{1,1}(:)) = tolerance(i);        
        ct.beta(cst{i,4}{1,1}(:)) = betaValues(i);
    end
end
ct.alpha(ct.alpha==0)=0.0350;
ct.beta(ct.beta==0)=0.0167;
ct.tissueTolerance(ct.tissueTolerance==0)=58.56;
ct.tissueTolerance = LQM(ct.tissueTolerance,ct);
ct.sigmaAlpha = 0.1*ct.alpha;
ct.sigmaBeta = 0.1*ct.beta;

ct.density=HUToDensity(ct.cubeHU{1});

