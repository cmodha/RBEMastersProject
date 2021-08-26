function zeros = bessel(r)
%Returns the zeros of the function fun(), between the values of 1,100. r is
%given in micrometers
h=0.1/r;%Step
a=1:h:200;%Possible a values to calculate over
dj=@(x,r) besselj(0.5,x*r)-1.5*besselj(1.5,x*r)./x;%Derivative of besselj(1.5,a*r) function
fun=@(x,r) r*x.*dj(x,r)-0.5*besselj(1.5,x*r);
S=fun(a,r);
% plot(a,S);
zeros=[];
for i=1:length(S)-1
    r=S(i)/S(i+1);
    if r<0%If S crosses 0 in this step
        zeros(end+1)=a(i)-r*h/(1-r);%Performs a linear interpolation
    end
end
end

