function [s,v] = pendulumrunge(sinit,vinit,g,L,delt)

[sdota,vdota] = pendulum(sinit,vinit,g,L);
[sdotb,vdotb] = pendulum(sinit+sdota*delt/2,vinit+vdota*delt/2,g,L);
[sdotc,vdotc] = pendulum(sinit+sdotb*delt/2,vinit+vdotb*delt/2,g,L);
[sdotd,vdotd] = pendulum(sinit+sdotc,vinit+vdotc,g,L);

s = sinit+((sdota+2*sdotb+2*sdotc+sdotd)/6)*delt;
v = vinit+((vdota+2*vdotb+2*vdotc+vdotd)/6)*delt;
end

