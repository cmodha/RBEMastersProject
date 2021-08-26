function y = eulitzScore(plot)
% plot(plot<10)=0;
maxPIC = max(plot,[],'all');
meanPIC=mean(abs(plot),'all');
%varPIC = var(plot,1,'all');
y=[maxPIC,meanPIC];
end

