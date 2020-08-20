function [xout,yout,zout] = rotate(xlam,ylam,zlam,xin,yin,zin)
y1=yin*cos(deg2rad(xlam))-zin*sin(deg2rad(xlam));
z1=zin*cos(deg2rad(xlam))+yin*sin(deg2rad(xlam));
x1=xin*cos(deg2rad(ylam))+z1*sin(deg2rad(ylam));
zout=z1*cos(deg2rad(ylam))-xin*sin(deg2rad(ylam));
xout=x1*cos(deg2rad(zlam))-y1*sin(deg2rad(zlam));
yout=y1*cos(deg2rad(zlam))+x1*sin(deg2rad(zlam));
end

