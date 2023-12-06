% Taking the Image infrom the camera
% Run the Camera Script

% Convert to grayscale
B = rgb2gray(A);

% Converting GryScl to a double for better precision
figure(2); clf
Doub = im2double(B);
imshow(Doub);

%Measureing the distance of coins
dist = imdistline;
%% finding the coins based on distance
delete(dist);
% Radiusing all circles
pennyRad = [20,280]; 
[cenPen,radPen] = imfindcircles(Doub, pennyRad);
totalCash = 0;
% Finding each coin
nickleRad = 48: 53;
radPen = round(radPen);
nickles = radPen(radPen>=min(nickleRad) & radPen<=max(nickleRad));
dimeRad = 41:43;
dimes = radPen(radPen>=min(dimeRad) & radPen<=max(dimeRad));
QuartRad = 56:60;
quarters = radPen(radPen>=min(QuartRad) & radPen<=max(QuartRad));
pennyRad = 44:47;
pennies = radPen(radPen>=min(pennyRad) & radPen<=max(pennyRad));
% Calculating the total value of the coins
totalCash = totalCash + numel(pennies) + 10 * numel(dimes) + ...
    5 * numel(nickles) + 25 * numel(quarters);



