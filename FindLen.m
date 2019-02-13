%Function to the determine the change in length of a spring
% PHYS 2022 Lab 3
%May 7 2015
function [length] = FindLen(Position, Angle)
d = size(Position,1);
xavg = sum(Position)./d;
aavg = sum(Angle)./d;
    xx = Position - xavg;
    aa = 0.25*(Angle - aavg);
    length = xx - aa;

