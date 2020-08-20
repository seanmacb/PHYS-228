function [x,y,z] = xrot(xlam,x,y,z)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
y=y*cos(deg2rad(xlam))-z*sin(deg2rad(xlam));
z=z*cos(deg2rad(xlam))+y*sin(deg2rad(xlam));
end