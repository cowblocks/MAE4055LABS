function [] = FinalPart1Func(objCoordx,objCoordy,objectRotation,s);

desObjCoordx = input('desired object x');
desObjCoordy = input('desired object y');
desObjRot = input('desired object rotation');

desObjDist = hypot(objCoordx,objCoordy);
desObjBaseRot = atand(desObjCoordy/desObjCoordx);


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

%FindObjRotation
objectRotation = DetectRectangleRot();


%calculate end effector rotation
modifiedEERot = 90 - objectRotation;
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

%MoveArm to position
%rotateBase
RotateBase(desObjBaseRot);

%moveArm
thetaMove = Lab3Func(desObjDist,lengthLink1-3,-90);
MoveArm(thetaMove(1),thetaMove(2),thetaMove(3));

%calculate end effector rotation
modifiedEERot = desObjRot + (90 - desObjBaseRot);
%Rotate end effector to
RotateEndEffector(-modifiedEERot,s);

pause(3);

%MoveArmDown
MoveArmVerticalPoly(desObjDist,lengthLink1-3,-lengthLink1,s);

pause(1)

%openEE
command = sprintf('#5 P%i T2000',500);
fprintf(s, command);

pause(2);

%done?
end

