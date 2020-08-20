function [value] = energy(velocity,grav,length,theta)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
value = 0.5*velocity^2+grav*length*(1-cos((theta)));
end

