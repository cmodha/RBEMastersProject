function y = densityToHU(x)
%DensityToHU Converts between tissue density and Hounsfield Unit value
%   Detailed explanation goes here
a1 =   0.0008129; a2 =      0.8648;%Fitting parameters for the HU look up table
y =(x-a2)./a1;
end