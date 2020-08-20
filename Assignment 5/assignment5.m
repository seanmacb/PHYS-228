clear

format long

g= 9.8;
L= 1;
delt=0.01; % Delta t value

t=0;
v=0;
s=0.1;
sinit = s;
slist =[];
vlist = [];
sanalist = [];
tlist =[];

count = 1;

slist(count) = s;
vlist(count) = v;
tlist(count) = t;
sanalist(count) = anapos(g,L,t,sinit);
count = count+1;

while t<30
    tnew = t+delt;
    [snew,vnew] = pendulumrunge(s,v,g,L,delt);
    sanalist(count) = anapos(g,L,tnew,sinit);
    slist(count) = snew;
    vlist(count) = vnew;
    tlist(count) = tnew;
    v=vnew;
    s=snew;
    t=tnew;
    count = count+1;
end

plot(tlist,slist,tlist,sanalist)
xlabel("Time");
ylabel("Position (m)");
grid on

% Question 1 - Using the Runge-Kutta Method, this shows a pendulum that
% actually behaves like a pendulum. It shows damping, and tweaking g
% results in what you would expect (more or less motion). This is in stark
% contrast to the Euler method, where everything goes off the rails

clear

sigma = 20;
delt = 0.01;
b = 8/3; 
r = 25;
t = 0;
count = 1;
x=1;
y=0;
z=0;
xlist(count) = x;
ylist(count) = y;
zlist(count) = z;
tlist(count) = t;



while t<30
    count = count + 1;
    [x,y,z] = rungelorenz(x,y,z,sigma,r,b,delt);
    t=t+delt;
    xlist(count) = x;
    ylist(count) = y;
    zlist(count) = z;
    tlist(count) = t;
end

plot(tlist,xlist) % X list graph
xlabel("t")
ylabel("x")
plot(tlist,ylist) % Y list graph
xlabel("t")
ylabel("y")
plot(tlist,zlist) % Z list graph
xlabel("t")
ylabel("z")

plot3(xlist,ylist,zlist) % 3D graph
xlabel("x")
ylabel("y")
zlabel("z")

% Question 2 - shows a turbulent system that flows from two separate nodes.
% Looks really damn neat in 3d. No real regular pattern in any of the time
% vs x, y, or z graphs. Somewhat sinusoidal but pretty chaotic.

% Question 3 - Changed yinitial to 0.01. Starts to diverge a little, but
% keeps the general binodal flow. Keeps binodal distribution but starts to
% really get screwy around 0.04.

% Question 4 - r is the strength of the ground heating. As a result,
% increasing r makes for a much more chaotic system. It seems to be
% reaching a non-chaotic system at r=~24, and is stable as you decrease r
% after that.