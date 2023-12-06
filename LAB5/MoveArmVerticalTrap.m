function [] = MoveArmVerticalTrap(x,y,distance,s)

%trapazoidalCalc
y1 = y + distance/8;
y2 = y + distance/3;
y3 = y + 2*distance/3;
y4 = y + 7*distance/8;
y5 = y + distance;

%move Arm to y1-5
thetaJoint = Lab3Func(x,y1,-90);
MoveArm(thetaJoint(1),thetaJoint(2),thetaJoint(3),s);
pause(1);

thetaJoint = Lab3Func(x,y2,-90);
MoveArm(thetaJoint(1),thetaJoint(2),thetaJoint(3),s);
pause(1);

thetaJoint = Lab3Func(x,y3,-90);
MoveArm(thetaJoint(1),thetaJoint(2),thetaJoint(3),s);
pause(1);

thetaJoint = Lab3Func(x,y4,-90);
MoveArm(thetaJoint(1),thetaJoint(2),thetaJoint(3),s);
pause(1);

thetaJoint = Lab3Func(x,y5,-90);
MoveArm(thetaJoint(1),thetaJoint(2),thetaJoint(3),s);
pause(1);

end

