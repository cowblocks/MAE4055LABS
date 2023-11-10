L1 = 5.75;
L2 = 7.25;
L3 = 4.5;

xFinalPos = input('x end effector pos = ');
yFinalPos = input('y end effector pos = ');
thetaEE = input('End effector angle (degrees) = ');


xEPos = xFinalPos - L3 * cosd(thetaEE);
yEPos = yFinalPos - L3 * sind(thetaEE);

revTan = ReverseTanPositionLab3(xEPos,yEPos);
theta1 = Theta1Lab3(xEPos,yEPos,L1,L2,revTan)
theta2 = Theta2Lab3(xEPos,yEPos,L1,theta1)
theta3 = Theta3Lab3(theta1,theta2,thetaEE)

pointsX = [0,xFinalPos,L1 * cosd(theta1),L1 * cosd(theta1) + L2 * cosd(theta1 + theta2)];
pointsY = [0,yFinalPos,L1 * sind(theta1),L1 * sind(theta1) + L2 * sind(theta1 + theta2)];
plot(pointsX,pointsY,'o');