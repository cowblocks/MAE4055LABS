function [] = RotateEndEffector(theta,s)
%ROTATEENDEFFECTOR Summary of this function goes here
%   Detailed explanation goes here
th1_deg = theta;
th1_pw=(round((-925/90)*th1_deg)+1075); %base rotation equation

BaseCom = sprintf('#4 P%i T1000', th1_pw);

fprintf(s, BaseCom);

end

