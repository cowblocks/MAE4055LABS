function [] = FinalPart3Func(s)

%Ask Locations of 2 objects and desired location
obj1X = input('object 1 x location: ');
obj1Y = input('object 1 y location: ');

obj2X = input('object 2 x location: ');
obj2Y = input('object 2 y location: ');

%MoveArmto look at Change
MoveArm(90,-90,-90,s);
%queryAmountOfChange
Phototaking;
ChangeCalculator;

%Pick up object 1 or 2 and query to move to desired location
if totalCash == 50
    FinalPart1Func(obj1X,obj1Y,s);
elseif totalCash == 80
    FinalPart1Func(obj2X,obj2Y,s);
end

end

