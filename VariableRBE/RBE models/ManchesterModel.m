function bixelRBE = ManchesterModel(bixelLET,bixelDose);
    a=0.1966; b=0.008; c=0.0736; d=1.149; e=24.1; f=4.879e-4; g = 2.84e-3; h = 5.13e-2;
    gam_r=1.726; gam_m=0.0427;
    bixelRBE = bixelDose.*((d*bixelLET+e)*c+(d*bixelLET+e).*(a*(f*bixelLET.^2+g*bixelLET+h)+b)*(1-c)/(gam_r+gam_m));
end
