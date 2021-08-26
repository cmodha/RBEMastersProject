function y = calcLQM(dose, ct,pln)
%LQM model, y is the cell survival, x is the dose
y = exp(-dose.*(ct.alpha+ct.beta.*dose)).^(pln.numOfFractions);
end

