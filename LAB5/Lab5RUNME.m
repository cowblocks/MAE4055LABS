%Lab 5

%Setup USB
qUSB = input('do you want to setup USB: 1 = yes 0 = no:');
if qUSB == 1
    s = serial('COM3');
    set(s,'Terminator','CR');
    fopen(s);
end

%Go to neutral
MoveArm(90,-90,0,s);

%TODO

%Calculate Each theta for each joint for each position 1-2-3-4-5-6
%initialise the positions
position2 = [12,4.5,0];
position3 = [10, 1.5, -90];
position4 = [9.4,7.5,-40];
position5 = [5,13,0];

%Neutral Position 
thetaPos1 = [90,-90,0];

%thetaPos# = [joint1 angle, joint2 angle, joint3 angle]
thetaPos2 = Lab3Func(position2(1),position2(2),position2(3));
thetaPos3 = Lab3Func(position3(1),position3(2),position3(3));
thetaPos4 = Lab3Func(position4(1),position4(2),position4(3));
thetaPos5 = Lab3Func(position5(1),position5(2),position5(3));

%Calculate Polynomial equation for each movement and each joint 1-2-3-4-5-6
%I am in physical Pain over doing this
%yes I am aware there are better ways to code this
%I like my code to be as unmaintanable as possible, keeps me employed
%also its not like its easy to do a vector3 matrix in matlab
%Why is there to static types, would make debugging soooo much easier
%I swear, wtf, why do I have to do all my debugging at runtime
%I hate matlab
%its too late for me to be doing this

%Nomenclature
%operation = the position before it
%polynomial(operation)(joint) =
%GeneratePolynomial(thetaBeforePos(joint),thetaAfterPos(joint))

%operation 1
polynomial11 = GeneratePolynomialLab5(thetaPos1(1),thetaPos2(1));
polynomial12 = GeneratePolynomialLab5(thetaPos1(2),thetaPos2(2));
polynomial13 = GeneratePolynomialLab5(thetaPos1(3),thetaPos2(3));

%operation 2
polynomial21 = GeneratePolynomialLab5(thetaPos2(1),thetaPos3(1));
polynomial22 = GeneratePolynomialLab5(thetaPos2(2),thetaPos3(2));
polynomial23 = GeneratePolynomialLab5(thetaPos2(3),thetaPos3(3));

%operation 3
polynomial31 = GeneratePolynomialLab5(thetaPos3(1),thetaPos4(1));
polynomial32 = GeneratePolynomialLab5(thetaPos3(2),thetaPos4(2));
polynomial33 = GeneratePolynomialLab5(thetaPos3(3),thetaPos4(3));

%operation 4
polynomial41 = GeneratePolynomialLab5(thetaPos4(1),thetaPos5(1));
polynomial42 = GeneratePolynomialLab5(thetaPos4(2),thetaPos5(2));
polynomial43 = GeneratePolynomialLab5(thetaPos4(3),thetaPos5(3));

%operation 5
polynomial51 = GeneratePolynomialLab5(thetaPos5(1),thetaPos1(1));
polynomial52 = GeneratePolynomialLab5(thetaPos5(2),thetaPos1(2));
polynomial53 = GeneratePolynomialLab5(thetaPos5(3),thetaPos1(3));

%now that we have the polynomials we just use them to output a table of
%theta values for each operation

%number of commands sent to the robot (should take 5 sec to move, so 1
%operation every 1 sec? (5 points?)
opIT = 1:5;


%NOMENCLATURE operation# = [joint1 angle matrix;joint2 angle
%matrix;joint3 angle matrix;]

operation1 = [polyval(polynomial11,opIT);polyval(polynomial12,opIT);polyval(polynomial13,opIT)];
operation2 = [polyval(polynomial21,opIT);polyval(polynomial22,opIT);polyval(polynomial23,opIT)];
operation3 = [polyval(polynomial31,opIT);polyval(polynomial32,opIT);polyval(polynomial33,opIT)];
operation4 = [polyval(polynomial41,opIT);polyval(polynomial42,opIT);polyval(polynomial43,opIT)];
operation5 = [polyval(polynomial51,opIT);polyval(polynomial52,opIT);polyval(polynomial53,opIT)];

%BING BANG BOOM
%Plug the operations into the Robot using More Spagettiii, YUMM I LOVE
%SPAGETIII
positiontext = ('position1')
pause(5);
for i = opIT
    %Send Cmnd To ROBOTO
    MoveArm(operation1(1,i),operation1(2,i),operation1(3,i),s);
    %pause for a second
    pause(5/length(opIT));
end
positiontext = ('position2')
pause(5);
%operation2
for i = opIT
    %Send Cmnd To ROBOTO
    MoveArm(operation2(1,i),operation2(2,i),operation2(3,i),s);
    %pause for a second
    pause(5/length(opIT));
end
positiontext = ('position3')
pause(5);
%operation3
for i = opIT
    %Send Cmnd To ROBOTO
    MoveArm(operation3(1,i),operation3(2,i),operation3(3,i),s);
    %pause for a second
    pause(5/length(opIT));
end
positiontext = ('position4')
pause(5);
%operation4
for i = opIT
    %Send Cmnd To ROBOTO
    MoveArm(operation4(1,i),operation4(2,i),operation4(3,i),s);
    %pause for a second
    pause(5/length(opIT));
end
positiontext = ('position5')
pause(5);
%operation 5
for i = opIT
    %Send Cmnd To ROBOTO
    MoveArm(operation5(1,i),operation5(2,i),operation5(3,i),s);
    %pause for a second
    pause(5/length(opIT));
end
positiontext = ('position6')
pause(5);
thEnd = 'end'

%Trapazoidal Movement

%TODO
