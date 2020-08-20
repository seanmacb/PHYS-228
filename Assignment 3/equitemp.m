function [equitemp] = equitemp(alb,s0,gam,sig)
equitemp = (((1-alb)*s0)/(4*gam*sig))^1/4;
end

