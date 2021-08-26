% Function which applies the McHugh MRI model
% With an input of an array of parameters
% parameters(1) = fi;
% parameters(2) = D;
% parameters(3) = G;
% parameters(4) = R;
% parameters(5) = delta;
% parameters(6) = Delta;
% parameters(7) = alphaMVals;
function McHugh = McHughModel(cellFraction, parameters)

D = parameters(1);%[microm^2/ms]
G = parameters(2);%[mT/microm]
R = parameters(3);%[microm]
delta = parameters(4);%[ms]
Delta = parameters(5);%[ms]
alpha = bessel(R);%[1/microm]
gamma = 42.58; %[kHz/mT][1/msmT]
f0=0.8;%Initial intercellualr volume fraction 
fi=f0*cellFraction;
resolution=2;%[mm] Spacial resolution of MRI scanner (possibly less than CT scanner)

a=alpha.^2*D;
summation= sum(1./(alpha.^2./(alpha.^2*(R^2)-2)).*...
              (2*delta./a+(2*exp(-a.*delta)+2*exp(-a.*Delta)...
              -exp(-a.*(Delta-delta))-exp(-a.*(Delta+delta))-2)./a.^2));


Si = exp(-2*gamma^2*G^2*summation);
Se = exp(-gamma^2*delta^2*G^2*(Delta - delta/3)*D./(1+fi/2));

McHugh = Si*fi + Se.*(1-fi);
McHugh=imgaussfilt3(McHugh,resolution);

end