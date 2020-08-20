function [x,y,z] = polarConv(lat,lon) ;
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
x = cos(deg2rad(lon)).*cos(deg2rad(lat));
y = sin(deg2rad(lat));
z = -sin(deg2rad(lon)).*cos(deg2rad(lat));
end
