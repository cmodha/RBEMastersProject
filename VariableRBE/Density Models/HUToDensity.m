function y = HUToDensity(x)
%DensityToHU Converts between tissue density and Hounsfield Unit value
%   Detailed explanation goes here
a1 =   0.0008129; a2 =      0.8648;%Fitting parameters for the HU look up table
y =a2+a1*x;
end

