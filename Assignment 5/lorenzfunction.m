function [xdot,ydot,zdot] = lorenzfunction(x,y,z,sigma,r,b)
xdot = sigma*(y-x);
ydot = -x*z-y+r*x;
zdot = x*y-b*z;
end

