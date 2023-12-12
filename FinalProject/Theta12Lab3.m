function [theta1] = Theta12Lab3(xEPos,yEPos,L1,L2,revTan)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
theta1 = revTan + acosd((xEPos * xEPos + yEPos * yEPos + L1 * L1 - (L2 * L2))/ ...
    (2 * L1 * sqrt(xEPos * xEPos + yEPos * yEPos)));
end