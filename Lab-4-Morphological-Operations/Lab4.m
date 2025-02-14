%Task1
A = imread('assets/text-broken.tif');
B1 = [0 1 0;
     1 1 1;
     0 1 0];    % create structuring element
A1 = imdilate(A, B1);
%montage({A,A1})

B2 = ones(3,3);
A2 = imdilate(A,B2);


%larger SE
B3 = [1 0 0 1;
      1 1 1 1;
      0 1 1 0;
      1 0 0 1];
A3 = imdilate(A,B3);
%Diagonal 3x3 SE
B4 = [1 0 1;
      0 1 0;
      1 0 1];
A4 = imdilate(A,B4);

figure;

subplot(1,5,1); imshow(A); title('Original Image');
subplot(1,5,2); imshow(A1); title('Plus 3x3 SE');
subplot(1,5,3); imshow(A2); title('All ones 3x3 SE');
subplot(1,5,4); imshow(A3); title('Larger 4x4 SE');
subplot(1,5,5); imshow(A4); title('Diagonal Cross 3x3 SE');

%Dilating twice with B1:
A5 = imdilate(A1,B1);
figure;
montage({A,A1,A5}, 'Size', [1 3])

SE = strel('disk',4);
SE.Neighborhood         % print the SE neighborhood contents
%Erosion
clear all
close all
A = imread('assets/wirebond-mask.tif');
SE2 = strel('disk',2);
SE10 = strel('disk',10);
SE20 = strel('disk',20);
E2 = imerode(A,SE2);
E10 = imerode(A,SE10);
E20 = imerode(A,SE20);
montage({A, E2, E10, E20}, "size", [2 2])

%Task 2
clear all
close all
f = imread('assets/fingerprint-noisy.tif');
SE = strel('square', 3);
f_e = imerode(f, SE);
fed = imdilate(f_e, SE);
fo = imopen(f, SE);

figure;
montage({f, f_e, fed, fo}, "Size", [2 2]);
subplot(2, 2, 1); imshow(f); title('Original Image');
subplot(2, 2, 2); imshow(f_e); title('Eroded Image');
subplot(2, 2, 3); imshow(fed); title('Dilated Eroded Image');
subplot(2, 2, 4); imshow(fo); title('Opened Image');

%Different sizes and shapes of strels
clear all
close all
f = imread('assets/fingerprint-noisy.tif');

SE_square_small = strel('square', 3);
SE_square_large = strel('square', 7);
SE_disk_small = strel('disk', 3);
SE_disk_large = strel('disk', 7);
SE_line = strel('line', 5, 45);

f_e_square_small = imerode(f, SE_square_small);
fed_square_small = imdilate(f_e_square_small, SE_square_small);
fo_square_small = imopen(f, SE_square_small);

f_e_square_large = imerode(f, SE_square_large);
fed_square_large = imdilate(f_e_square_large, SE_square_large);
fo_square_large = imopen(f, SE_square_large);

f_e_disk_small = imerode(f, SE_disk_small);
fed_disk_small = imdilate(f_e_disk_small, SE_disk_small);
fo_disk_small = imopen(f, SE_disk_small);

f_e_disk_large = imerode(f, SE_disk_large);
fed_disk_large = imdilate(f_e_disk_large, SE_disk_large);
fo_disk_large = imopen(f, SE_disk_large);

f_e_line = imerode(f, SE_line);
fed_line = imdilate(f_e_line, SE_line);
fo_line = imopen(f, SE_line);

figure;

subplot(4, 4, 1); imshow(f); title('Original Image');
subplot(4, 4, 2); imshow(f_e_square_small); title('Eroded (3x3 square)');
subplot(4, 4, 3); imshow(fed_square_small); title('Dilated Eroded (3x3 square)');
subplot(4, 4, 4); imshow(fo_square_small); title('Opened (3x3 square)');
subplot(4, 4, 5); imshow(f_e_square_large); title('Eroded (7x7 square)');
subplot(4, 4, 6); imshow(fed_square_large); title('Dilated Eroded (7x7 square)');
subplot(4, 4, 7); imshow(fo_square_large); title('Opened (7x7 square)');
subplot(4, 4, 8); imshow(f_e_disk_small); title('Eroded (3 disk)');
subplot(4, 4, 9); imshow(fed_disk_small); title('Dilated Eroded (3 disk)');
subplot(4, 4, 10); imshow(fo_disk_small); title('Opened (3 disk)');
subplot(4, 4, 11); imshow(f_e_disk_large); title('Eroded (7 disk)');
subplot(4, 4, 12); imshow(fed_disk_large); title('Dilated Eroded (7 disk)');
subplot(4, 4, 13); imshow(fo_disk_large); title('Opened (7 disk)');
subplot(4, 4, 14); imshow(f_e_line); title('Eroded (line)');
subplot(4, 4, 15); imshow(fed_line); title('Dilated Eroded (line)');
subplot(4, 4, 16); imshow(fo_line); title('Opened (line)');

%Adding closing operation to the previous code

clear all
close all
f = imread('assets/fingerprint-noisy.tif');
SE = strel('square', 3);
f_e = imerode(f, SE);
fed = imdilate(f_e, SE);
fo = imopen(f, SE);
fo_close = imclose(fo, SE);

montage({f, f_e, fed, fo, fo_close}, "size", [2 3]);

subplot(2, 3, 1); imshow(f); title('Original Image');
subplot(2, 3, 2); imshow(f_e); title('Eroded Image');
subplot(2, 3, 3); imshow(fed); title('Dilated Eroded Image');
subplot(2, 3, 4); imshow(fo); title('Opened Image');
subplot(2, 3, 5); imshow(fo_close); title('Closed Image');

% Compare the effects of morphological filtering (open and close) with the Gaussian filter. 
clear all;
close all;
f = imread('assets/fingerprint-noisy.tif');
SE = strel('square', 3);
f_opened = imopen(f, SE); 
f_closed = imclose(f, SE);
h = fspecial('gaussian', [5 5], 2); 
f_gaussian = imfilter(f, h);
figure;
subplot(2, 3, 1); imshow(f); title('Original Image');
subplot(2, 3, 2); imshow(f_opened); title('Opened Image');
subplot(2, 3, 3); imshow(f_closed); title('Closed Image');
subplot(2, 3, 4); imshow(f_gaussian); title('Gaussian Filtered Image');


