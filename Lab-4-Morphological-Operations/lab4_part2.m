%Task 3: Boundary Detection
clear all
close all
I = imread('assets/blobs.tif');
I = imcomplement(I);
level = graythresh(I);
BW = imbinarize(I, level);
SE = strel('square', 3);
BW_eroded = imerode(BW, SE);
boundary = BW - BW_eroded;

montage({I, BW, BW_eroded, boundary});

%Improve the result
clear all
close all
I = imread('assets/blobs.tif');
I = imcomplement(I);
level = graythresh(I);
BW = imbinarize(I, level);
SE = strel('square', 3);

% Apply opening and closing before boundary detection
BW_opened = imopen(BW, SE);
BW_closed = imclose(BW_opened, SE);

BW_eroded = imerode(BW_closed, SE);
boundary = BW_closed - BW_eroded;

montage({I, BW, BW_opened, BW_closed, BW_eroded, boundary});

%Task 4 Function bwmorph
clear all
close all
f = imread('assets/fingerprint.tif');
f = imcomplement(f);
level = graythresh(f);
BW = imbinarize(f, level);
g1 = bwmorph(BW, 'thin', 1);
g2 = bwmorph(BW, 'thin', 2);
g3 = bwmorph(BW, 'thin', 3);
g4 = bwmorph(BW, 'thin', 4);
g5 = bwmorph(BW, 'thin', 5);
g_inf = bwmorph(BW, 'thin', inf);
montage({BW, g1, g2, g3, g4, g5,g_inf}, "Size", [1 7]);

%Reversing the colour sof fingerprint
f_complement = imcomplement(f); % Convert to black lines on white background
figure;
imshow(f_complement);

%task 5
clear all
close all
t = imread('assets/text.png');
imshow(t)
CC = bwconncomp(t);
numPixels = cellfun(@numel, CC.PixelIdxList);
[biggest, idx] = max(numPixels);
t(CC.PixelIdxList{idx}) = 0;
figure
imshow(t)

%task 6: Morphological Reconstruction
clear all
close all
f = imread('assets/text_bw.tif');
se = ones(17,1);
g = imerode(f, se);
fo = imopen(f, se);     % perform open to compare
fr = imreconstruct(g, f);
montage({f, g, fo, fr}, "size", [2 2])

ff = imfill(f);
figure
montage({f, ff})

%task 7; Morphological operation on grayscale images
clear all; close all;
f = imread('assets/headCT.tif');
se = strel('square',3);
gd = imdilate(f, se);
ge = imerode(f, se);
gg = gd - ge;
montage({f, gd, ge, gg}, 'size', [2 2])

