


% Values in Degrees testing final will use Rads(?)
%theta initial for joint X
thetaXinit = 30;
%theta final for joint X
thetaXfin = 80;
%max angular accleration allowed
thetaXacc = 30;
%max angular velocity allowed
thetaXvel = 10;

% Assuming the Lecture times
timeinit = 0; % msec
timefinal = 5; % msec
t = linspace(timeinit,timefinal);

accsq = thetaXacc^2;
tfsq = timefinal^2;

timea =  (timefinal/2) - (sqrt((accsq * tfsq) - ...
    (4*thetaXacc*(thetaXfin-thetaXinit))) / (2*thetaXacc));
% Functions for the 3 different sections of the trapezoid

sec1 = thetaXinit + ((thetaXvel)/(2*timea)).*t.^2;
sec2 = thetaXinit + ((thetaXvel).*(t-(timea/2)));
sec3 = thetaXfin - ((thetaXvel/(2*timea)).*(timefinal - t).^2);

figure(1); clf
plot(t,sec1,"red");
hold on
plot(t,sec2,"blue");
plot(t,sec3,"black");
hold off
ylim([-100 100]);
title('Degrees vs Sec')


