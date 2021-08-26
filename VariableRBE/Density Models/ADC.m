function y = ADC(MRI,parameters)
%ADC Summary of this function goes here
%   Detailed explanation goes here
gamma = 42.58; %[kHz/mT]
G = parameters(2);%[mT/microm]
delta = parameters(4);%[ms]
Delta = parameters(5);%[ms]
b = gamma^2 * G^2 *delta^2 *(Delta-delta/3)*1e3;%[s/mm^2]
ADC = -log(MRI)/b;
y = ADC;
end

