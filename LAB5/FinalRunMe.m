%Final Move Cmd

%Setup USB
qUSB = input('do you want to setup USB: 1 = yes 0 = no:');
if qUSB == 1
    s = serial('COM3');
    set(s,'Terminator','CR');
    fopen(s);
end

%Go to neutral
MoveArm(90,-90,0,s);

objCoordx = 10;
objCoordy = 10;
objectRotation = (theta);

lengthLink1 = 5;
heightLink1 = 0.5;

%calculate the log distance from base
distFromBase = hypot(objCoordx,objCoordy);

%calculate the rotation of the base
baseRot = atand(objCoordy/objCoordy);

%rotate the base
RotateBase(baseRot,s);

%move arm to above log
thetaMove = Lab3Func(distFromBase,heightLink1,-90);
moveArm(thetaMove(1),thetaMove(2),thetaMove(3));

%calculate end effector rotation
modifiedEERot = objectRotation + (90 - baseRot);
%Rotate end effector to
RotateEndEffector(modifiedEERot,s);

pause(2);

%moveArmDown to the log
thetaMove = Lab3Func(distFromBase,0,-90);
moveArm(thetaMove(1),thetaMove(2),thetaMove(3));

%CloseTheEE
command = sprintf('#5 P%i T1000',500);

pause(2);

%moveArmVertical
thetaMove = Lab3Func(distFromBase,lengthLink1,-90);
moveArm(thetaMove(1),thetaMove(2),thetaMove(3));
