function [x,y,z] = yrot(ylam,x,y,z);
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
x=x*cos(deg2rad(ylam))+z*sin(deg2rad(ylam));
z=z*cos(deg2rad(ylam))-x*sin(deg2rad(ylam));
end

