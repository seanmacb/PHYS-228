function [sdot,vdot] = pendulum(s,v,g,L)
sdot = v;
vdot = -g*sin(s/L);
end

