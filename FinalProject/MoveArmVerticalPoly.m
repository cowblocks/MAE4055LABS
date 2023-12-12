function [] = MoveArmVerticalPoly(x,y,distance,s)

endY = y + distance;
poly = GeneratePolynomialLab5(y,endY);

moveTimes = 1:5;

polyPoints = polyval(poly,moveTimes);

for i = moveTimes
    thetaJoint = Lab3Func(x,polyPoints(i),-90);
    MoveArm(thetaJoint(1),thetaJoint(2),thetaJoint(3),s);
    pause(1);
end
end

