function [xi,yi,zi] = rungelorenz(xinit,yinit,zinit,sigma,r,b,delt)
[xa,ya,za] = lorenzfunction(xinit,yinit,zinit,sigma,r,b);
[xb,yb,zb] = lorenzfunction(xinit+xa*delt/2,yinit+ya*delt/2,zinit+za*delt/2,sigma,r,b);
[xc,yc,zc] = lorenzfunction(xinit+xb*delt/2,yinit+yb*delt/2,zinit+zb*delt/2,sigma,r,b);
[xd,yd,zd] = lorenzfunction(xinit+xc*delt,yinit+yc*delt,zinit+zc*delt,sigma,r,b);

xi = xinit + delt * (xa+2*xb+2*xc+xd)/6;
yi = yinit + delt * (ya+2*yb+2*yc+yd)/6;
zi = zinit + delt * (za+2*zb+2*zc+zd)/6;
end