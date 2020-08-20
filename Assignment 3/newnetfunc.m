function [net] = newnetfunc(temp)

sigma = 5.67*10.^-8;
radius = 6.3*10.^6;
s0 = 1000;
gamma = 0.6;
alb = albedo(temp);

net = (radius^2)*(4*pi*gamma*sigma*temp.^4-(1-alb)*pi*s0);

end