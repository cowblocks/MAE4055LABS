function [] = FinalPart2Func(objCoordx,objCoordy,objectRotation,s)
lengthLink1 = 4.5;
heightLink1 = 0.5;

%calculate the log distance from base
distFromBase = hypot(objCoordx,objCoordy);

%calculate the rotation of the base
baseRot = atand(objCoordy/objCoordx)-90;

%rotate the base
RotateBase(baseRot,s);

%move arm to above log
thetaMove = Lab3Func(distFromBase,heightLink1-3,-90);
MoveArm(thetaMove(1),thetaMove(2),thetaMove(3),s);


%calculate end effector rotation
modifiedEERot = objectRotation + (90 - baseRot);
%Rotate end effector to
RotateEndEffector(-modifiedEERot,s);

pause(3);

%moveArmDown to the log
thetaMove = Lab3Func(distFromBase,-3,-90);
MoveArm(thetaMove(1),thetaMove(2),thetaMove(3),s);


%CloseTheEE
command = sprintf('#5 P%i T2000',2000);
fprintf(s, command);

pause(2);

%moveArmVertical
MoveArmVerticalPoly(distFromBase,-3,lengthLink1,s);

pause(3);

%MoveArmDown
MoveArmVerticalPoly(desObjDist,lengthLink1-3,-lengthLink1,s);

pause(1)

%openEE
command = sprintf('#5 P%i T2000',500);
fprintf(s, command);

pause(2);

%closeEE
command = sprintf('#5 P%i T2000',2000);
fprintf(s, command);

pause(2);

%moveArmVerticalTrap
MoveArmVerticalTrap(desObjDist,-3,lengthLink1,s);

pause(3);

%moveArmDownTrap
MoveArmVerticalTrap(desObjDist,lengthLink1-3,-lengthLink1,s);

pause(1);

%openEE
command = sprintf('#5 P%i T2000',500);
fprintf(s, command);

%done?
end


