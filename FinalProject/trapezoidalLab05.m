function [trapez] = trapezoidalLab05(thetaStart,thetaEnd)
%trapezoidalLab05 takes theta start and end, and dopes a trapezoid path

% Values in Degrees testing final will use Rads(?)
%theta initial for joint X
thetaXinit = thetaStart;
%theta final for joint X
thetaXfin = thetaEnd;
%max angular accleration allowed
thetaXacc = 30;
%max angular velocity allowed
thetaXvel = 10;

% Assuming the Lecture times
timeinit = 0; % msec
timefinal = 5; % msec
t = linspace(timeinit,timefinal,20);

accsq = thetaXacc^2;
tfsq = timefinal^2;

timea =  (timefinal/2) - (sqrt((accsq * tfsq) - ...
    (4*thetaXacc*(thetaXfin-thetaXinit))) / (2*thetaXacc));
% Functions for the 3 different sections of the trapezoid

sec1 = thetaXinit + ((thetaXvel)/(2*timea)).*t.^2;
sec2 = thetaXinit + ((thetaXvel).*(t-(timea/2)));
sec3 = thetaXfin - ((thetaXvel/(2*timea)).*(timefinal - t).^2);

% take first 4 from sec1, and middle sec2 and last 4 sec3
trapez = [sec1(1:4), sec2(5:16), sec3(17:20)];

% Spits out a set of 20 theta positions for 4 a second or 1 every
% 0.25 seconds/250ms
% This vector is spit out and them needs to be applyed to the move

end


