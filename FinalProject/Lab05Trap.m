

%Trapazoidal Function, essentially what I do is I set the time between
%sections on the trapazoid function (2 sec for acceleration/decceleration, 1 sec for constant).
% Then I solve for the area using the desired change in theta.
%Using the area and time (5 sec) I solve for the max velocity of theta
%Then I find the equation for each line of the trapazoid, and I have my 3
%polynomials.

%theta initial for joint X
thetaXinit = 30;
%theta final for joint X
thetaXfin = 80;

timeinit = 0;
timefinal = 5;
timeFirstSegment = 2;
timeLastSegment = 3;

tSpaceSeg1 = linspace(timeinit,timeFirstSegment);
tSpaceSeg2 = linspace(timeFirstSegment,timeLastSegment);
tSpaceSeg3 = linspace(timeLastSegment,timefinal);

changeInDeg = thetaXfin - thetaXinit;

thetaMax = changeInDeg / timeLastSegment;

slopeOfDerPol = thetaMax / timeFirstSegment;
yInterceptDerPol = timefinal * slopeOfDerPol;

derOfPolynomialFirstSeg = [slopeOfDerPol,0];
derOfPolynomialSecondSeg = thetaMax;
derOfPolynomialThirdSeg = [-slopeOfDerPol,yInterceptDerPol];

%plot the three Velocity polynomials (one for each segment)

plot(tSpaceSeg1,polyval(derOfPolynomialFirstSeg,tSpaceSeg1));
hold on

plot(tSpaceSeg2,polyval(derOfPolynomialSecondSeg,tSpaceSeg2));
hold on

plot(tSpaceSeg3,polyval(derOfPolynomialThirdSeg,tSpaceSeg3));
title('Plot Velocity of theta for 5 sec interval for 5 deg polynomial');
xlabel('Time (sec)');
ylabel('dTheta (Degree)');
xlim([0,5]);
grid("on");
figure();

%Now plot the integral of the velocity (displacement)
%since we are doing integral, we have to do initial condition
initialCondition = [0,0,thetaXinit];

%solve for initial condition for second segment
secondSegYValue = polyval(polyint(derOfPolynomialFirstSeg)+initialCondition,timeFirstSegment);
secondSegInitialCond = secondSegYValue - polyval(polyint(derOfPolynomialSecondSeg),timeFirstSegment);
%put the initial condition into polynomial form
secondSegInitialCond = [0,secondSegInitialCond];

%solve for initial condition for third segment
thirdSegYValue = polyval(polyint(derOfPolynomialSecondSeg)+secondSegInitialCond,timeLastSegment);
thirdSegInitialCond = thirdSegYValue - polyval(polyint(derOfPolynomialThirdSeg),timeLastSegment);
%put initial condition into polynomial form
thirdSegInitialCond = [0,0,thirdSegInitialCond];

%plot the three polynomials
plot(tSpaceSeg1,polyval(polyint(derOfPolynomialFirstSeg)+initialCondition,tSpaceSeg1));
hold on

plot(tSpaceSeg2,polyval(polyint(derOfPolynomialSecondSeg)+secondSegInitialCond,tSpaceSeg2));
hold on

plot(tSpaceSeg3,polyval(polyint(derOfPolynomialThirdSeg)+thirdSegInitialCond,tSpaceSeg3));
title('Plot Displacement of theta for 5 sec interval for Trapadoid');
xlabel('Time (sec)');
ylabel('Theta (Degree)');
xlim([0,5]);
grid("on");
figure();

%Plot the acceleleration on the trap curve using our trusty friend
%polyder()
plot(tSpaceSeg1,polyval(polyder(derOfPolynomialFirstSeg),tSpaceSeg1));
hold on

plot(tSpaceSeg2,polyval(polyder(derOfPolynomialSecondSeg),tSpaceSeg2));
hold on

plot(tSpaceSeg3,polyval(polyder(derOfPolynomialThirdSeg),tSpaceSeg3));
title('Plot Acceleration of theta for 5 sec interval for Trapazoid');
xlabel('Time (sec)');
ylabel('d^2Theta (Degree)');
xlim([0,5]);
grid("on");
