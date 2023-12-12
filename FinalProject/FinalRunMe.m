%Final Move Cmd

%Setup USB
qUSB = input('do you want to setup USB: 1 = yes 0 = no 2 = fakeS: ');
if qUSB == 1
    s = serial('COM3');
    set(s,'Terminator','CR');
    fopen(s);
else qUSB == 2
    s = fopen('source.txt')
end

%Go to neutral
MoveArm(90,-90,0,s);
%OpenEE
command = sprintf('#5 P%i T2000',500);
fprintf(s, command);

pause(1);

mainMode = input('which part do you want to execute 1,2 or 3: ');

if mainMode == 1
    objCoordx = 0;
    objCoordy = 7;
    objectRotation = (0);
    
    FinalPart1Func(objCoordx,objCoordy,objectRotation,s);
elseif mainMode == 2
    objCoordx = input('object x Location: ');
    objCoordy = input('object y Location: ');
    objectRotation = input('object rotation: ');
    FinalPart2Func()
elseif mainMode == 3
    FinalPart3Func(s);
end


