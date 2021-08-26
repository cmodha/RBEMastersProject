function y =  eulitz(dose,LET)
% a = parameters(1); b = parameters(2); c = parameters(3);
a = -2.672; b =0.2 ; c = 0.2029;
y = 1/(1+exp(-(a + b*dose + c*LET.*dose)));
end