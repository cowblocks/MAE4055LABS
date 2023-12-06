function [rotationOfRect] = DetectRectangleRot()

close all
figure(1);

cam = webcam(1);
A = snapshot(cam);

I = rgb2gray(A);
BW = im2bw(I,0.5);

x = [];
y = [];

for i = 1:length(BW)
    for j = 1:height(BW)
       if BW(j,i) ==  1
           x(end+1) = i;
           y(end+1) = j;
       end
    end
end
poly = polyfit(x,y,1);
point1 = [1,polyval(poly,1)];
point2 = [2,polyval(poly,2)];

ydif = point1(2)-point2(2);
xdif = point1(1)-point2(1);

rotationOfRect = atand(ydif/xdif);

end
