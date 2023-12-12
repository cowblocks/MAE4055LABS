% Camera Picture Taking
close all
figure(1);

cam = webcam(1);
A = snapshot(cam);
imshow(A)
% Sets the picture to A