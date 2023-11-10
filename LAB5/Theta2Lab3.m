function [theta2] = Theta2Lab3(xEPos,yEPos,L1,theta1)
%THETA2LAB3 Summary of this function goes here
%   Detailed explanation goes here
theta2 = atand((yEPos - L1 * sind(theta1))/(xEPos - L1 * cosd(theta1))) - theta1;

end

