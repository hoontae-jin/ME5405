clear all; close all; clc;
%% Pre-Processing 
archive = fopen('chromo.txt');
a = fscanf(archive,'%s',[64, 64]);
fclose(archive);

char2num = [zeros(1,'0'-1), 0:9, zeros(1,'A'-'9'-1), (0:('V'-'A')) + 10];
img = 32*mat2gray(char2num(a'),[0 32]);

Basic_Global_T = Basic_Global_Threshold(img);
Otsu_T = Otsu_T(img);
Gaus_T = Gaus_T(img);
Adap_M_T = Adap_M_T(img);
%% 1. Display the original image on screen.
show_img(img)
%% 2. Threshold the image and convert it into binary image.
figure();
subplot(2,2,1)
imshow(img>Basic_Global_T,'InitialMagnification','fit') %Global threshold image
title(['Basic Global T at ', num2str(Basic_Global_T)])
subplot(2,2,2)
imshow(img>Otsu_T,'InitialMagnification','fit') %Otsu threshold image
title(['Otsu T at ', num2str(Otsu_T)])
subplot(2,2,3)
imshow(Gaus_T,'InitialMagnification','fit') % Adaptive Gaussian threshold image
title(['Adaptive Gaussian T'])
subplot(2,2,4) 
imshow(Adap_M_T, 'InitialMagnification', 'fit'); %Adaptive Mean threshold image
title('Adaptive Mean T')
%% 3.Determine an one-pixel thin image of the objects (Zhang-Suen (ZS) thinning algorithm)
Zhang_Suen_Thinning(img, Basic_Global_T)
%% 4.Determine the outlines.
Sobel_Operator(img)
%% 5. Label the different objects (4 & 8-connectivity)
binary_Basic = img<Basic_Global_T;
CCL4(binary_Basic)
CCL8(binary_Basic)