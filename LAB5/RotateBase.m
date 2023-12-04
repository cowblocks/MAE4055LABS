function [] = RotateBase(theta,s)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
th1_deg = theta;
th1_pw=(round((850/90)*th1_deg)+1500); %base rotation equation

BaseCom = sprintf('#0 P%i T1000', th1_pw);

fprintf(s, BaseCom);

end

