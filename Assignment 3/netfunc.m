function [net] = netfunc(temp);

sigma = 5.67*10.^-8;
radius = 6.3*10.^6;
s0 = 1367;
gamma = 0.6;
alb = 0.3;

net = (radius^2)*(4*pi*gamma*sigma*temp.^4-(1-alb)*pi*s0);

end

