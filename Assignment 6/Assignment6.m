format long

clear
sidelength = 50; % SIDELENGTH DEFINED HERE 
dx = 1; % DELTA X DEFINED HERE

x = 1:dx:sidelength;
tic;
[Tg,rg,ng] = initializer(dx,sidelength);

[Tg,rg] = GaussSeidel(ng,Tg,rg,dx);
toc;
surf (x,x,Tg) % Gauss-Seidel Plot
zlabel("Temperature")

[Tj,rj,nj] = initializer(dx,sidelength);

[Tj,rj] = Jacobi(Tj,rj,nj,dx,sidelength);

surf(x,x,Tj)  %Jacobian plot
zlabel("Temperature")

% To find the temp on a 20x20 grid, set sidelength to 20

% For 50x50 grid of dx=1 - time=0.015711s
% For 100x100 grid of dx=1 - time=0.183058s
% For 200x200 grid of dx=1 - time=2.559735s
% For 400x400 grid of dx=1 - time=35.956511s
time = [0.015711, 0.183058, 2.559735,35.956511];
size = [50,100,200,400];
% loglog(size,time);
% xlim ([50,1000])
% ylim ([10^-2,10^4])
% I would estimate, that for a 1000x1000 grid, it would take roughly 10^3
% seconds, as it is a log-log relationship, shown by the plot above