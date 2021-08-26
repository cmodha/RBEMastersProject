function y = McNamaraRBE(ct, resultGUI)
%McNamaraRBE is calculated from LET and alpha and beta values. Returns the
%RBE weighted dose.
p0 = 0.999064 ;p1=0.35605;p2=1.1012;p3=0.0038703;
d=resultGUI.physicalDose; LET =resultGUI.LET;
ab = ct.alpha./ct.beta;
y = 0.5.*(sqrt(ab.^2+4*d.*ab.*(p0+p1*LET./ab)+4*d.^2.*(p2-p3*sqrt(ab).*LET-ab).^2)-ab);
end

