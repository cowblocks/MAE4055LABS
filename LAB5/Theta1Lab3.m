function [theta1] = Theta1Lab3(xEPos,yEPos,L1,L2,revTan)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
testIfReal = (xEPos * xEPos + yEPos * yEPos + L1 * L1 - (L2 * L2))/ ...
    (2 * L1 * sqrt(xEPos * xEPos + yEPos * yEPos));
if testIfReal > 1
    theta1 = 90;
else
    theta1 = revTan - acosd((xEPos * xEPos + yEPos * yEPos + L1 * L1 - (L2 * L2))/ ...
    (2 * L1 * sqrt(xEPos * xEPos + yEPos * yEPos)));
end