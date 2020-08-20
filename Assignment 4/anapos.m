function [pos] = anapos(grav,length,time,init)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
pos = init * cos(time*sqrt(grav/length));
end

