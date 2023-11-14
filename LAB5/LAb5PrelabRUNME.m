%Prelab for LAb 5
% Theta start = 30 deg
%Theta end = 75 deg
%Time = 5 sec

%Find 5th order polynomial and plot joint position

%Generates polynomial using generate polynomial func
%then plots and lables it
prelabPoly = GeneratePolynomialLab5(30,75);
t = linspace(0,5);
plot(t,polyval(prelabPoly,t));
title('Plot of 5th deg polynomial for theta for 5 sec movement');
xlabel('Time (sec)');
ylabel('Theta (Degree)');
grid("on");
figure();

%plots the Velocity of Theta over 5 sec
plot(t,polyval(polyder(prelabPoly),t));
title('Plot velocity of theta for 5 sec interval for 5 deg polynomial');
xlabel('Time (sec)');
ylabel('dTheta (Degree)');
grid("on");
figure();

%plots the acceleration of Theta over 5 sec
plot(t,polyval(polyder(polyder(prelabPoly)),t));
title('Plot acceleration of theta for 5 sec interval for 5 deg polynomial');
xlabel('Time (sec)');
ylabel('dTheta (Degree)');
grid("on");
figure();

%Find Trapazoidal Path for Robot Arm