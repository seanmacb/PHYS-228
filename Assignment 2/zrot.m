function [x,y,z] = zrot(zlam,x,y,z)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
x = x*cos(deg2rad(zlam))-y*sin(deg2rad(zlam));
y = y*cos(deg2rad(zlam))+x*sin(deg2rad(zlam));
end

