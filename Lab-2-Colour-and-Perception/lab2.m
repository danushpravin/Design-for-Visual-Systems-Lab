RGB = imread('peppers.png');  
imshow(RGB)
I = rgb2gray(RGB);
figure              % start a new figure window
imshow(I)
imshowpair(RGB, I, 'montage')
title('Original colour image (left) grayscale image (right)');
[R, G, B] = imsplit(RGB);
%montage({R, G, B}, 'Size', [1 3]);

row = 100;
col = 150;
disp(['Pixel value in Red channel at (100,150): ', num2str(R(row, col))]);
disp(['Pixel value in Green channel at (100,150): ', num2str(G(row, col))]);
disp(['Pixel value in Blue channel at (100,150): ', num2str(B(row, col))]);

HSV = rgb2hsv(RGB);
[H,S,V] = imsplit(HSV);
montage({H,S,V}, 'Size', [1 3]);

XYZ = rgb2xyz(RGB);
[X,Y,Z] = imsplit(XYZ);
montage({X,Y,Z}, 'Size', [1 3]);