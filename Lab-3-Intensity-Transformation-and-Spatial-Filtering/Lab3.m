clear all
imfinfo('assets/breastXray.tif')
f = imread('assets/bonescan-front.tif');
%imshow(f)
f(3,10)
[fmin, fmax] = bounds(f(:))
imshow(f(:,241:482))
g1 = imadjust(f, [0 1], [1 0])
figure                          % open a new figure window
%imshowpair(f, g1, 'montage')

g2 = imadjust(f, [0.5 0.75], [0 1]);
g3 = imadjust(f, [ ], [ ], 2);
%figure
%montage({g2,g3})

%clear all       % clear all variables
%close all       % close all figure windows
f = imread('assets/bonescan-front.tif');
r = double(f);  % uint8 to double conversion
k = mean2(r);   % find mean intensity of image
E = 0.9;
s = 1 ./ (1.0 + (k ./ (r + eps)) .^ E);
g = uint8(255*s);
%imshowpair(f, g, "montage")

clear all       % clear all variable in workspace
close all       % close all figure windows
f=imread('assets/pollen.tif');
imshow(f)
figure          % open a new figure window
imhist(f);      % calculate and plot the histogram
close all
g=imadjust(f,[0.3 0.55]);
montage({f, g})     % display list of images side-by-side
figure
imhist(g);

g_pdf = imhist(g) ./ numel(g);  % compute PDF
g_cdf = cumsum(g_pdf);          % compute CDF
close all                       % close all figure windows
imshow(g);
subplot(1,2,1)                  % plot 1 in a 1x2 subplot
plot(g_pdf)
subplot(1,2,2)                  % plot 2 in a 1x2 subplot
plot(g_cdf)

x = linspace(0, 1, 256);    % x has 256 values equally spaced
                            %  .... between 0 and 1
figure
plot(x, g_cdf)
axis([0 1 0 1])             % graph x and y range is 0 to 1
set(gca, 'xtick', 0:0.2:1)  % x tick marks are in steps of 0.2
set(gca, 'ytick', 0:0.2:1)
xlabel('Input intensity values', 'fontsize', 9)
ylabel('Output intensity values', 'fontsize', 9)
title('Transformation function', 'fontsize', 12)
h = histeq(g,256);              % histogram equalize g
close all
%montage({f, g, h})
%figure;
%subplot(1,3,1); imhist(f);
%subplot(1,3,2); imhist(g);
%subplot(1,3,3); imhist(h);

%Task 5
clear all
close all
f = imread('assets/noisyPCB.jpg');
imshow(f)

w_box = fspecial('average', [9 9])
w_gauss = fspecial('Gaussian', [7 7], 1.0)

g_box = imfilter(f, w_box, 0);
g_gauss = imfilter(f, w_gauss, 0);
figure
montage({f, g_box, g_gauss})

w_box_small = fspecial('average', [3 3]);
w_gauss_small = fspecial('Gaussian', [3 3], 0.5);

g_box_small = imfilter(f, w_box_small, 0);
g_gauss_small = imfilter(f, w_gauss_small, 0);

%figure;
%montage({f, g_box_small, g_gauss_small});

w_box_medium = fspecial('average', [7 7]);
w_gauss_medium = fspecial('Gaussian', [7 7], 1.0);

g_box_medium = imfilter(f, w_box_medium, 0);
g_gauss_medium = imfilter(f, w_gauss_medium, 0);

%figure;
%montage({f, g_box_medium, g_gauss_medium});
w_box_large = fspecial('average', [15 15]);
w_gauss_large = fspecial('Gaussian', [15 15], 2.5);

g_box_large = imfilter(f, w_box_large, 0);
g_gauss_large = imfilter(f, w_gauss_large, 0);

%figure;
%montage({f, g_box_large, g_gauss_large});

g_median = medfilt2(f, [7 7], 'zero');
figure; montage({f, g_median})

%Task 6

clear all
close all
f = imread('assets/moon.tif');
imshow(f) 

moonlap = fspecial('laplacian', 0.1); 
filtered_image = imfilter(f, moonlap, 'replicate'); 

figure;
montage({f,filtered_image}); 

%sobel filter
clear all
close all
f = imread('assets/moon.tif');
imshow(f) 

moonlap = fspecial('sobel'); 
filtered_image = imfilter(f, moonlap, 'replicate'); 

figure;
montage({f,filtered_image}); 

%unsharp filter
clear all
close all
f = imread('assets/moon.tif');
imshow(f) 

moonlap = fspecial('unsharp',0.5); 
filtered_image = imfilter(f, moonlap, 'replicate'); 

figure;
montage({f,filtered_image}); 

%CLearestMoonCraters

clear all
close all
f = imread('assets/moon.tif');
imshow(f) 

moonsharp = fspecial('unsharp',0.2); 
filtered_image1 = imfilter(f, moonsharp, 'replicate'); 
moonsob = fspecial('sobel'); 
filtered_image2 = imfilter(filtered_image1, moonsob, 'replicate');
moonlap = fspecial('laplacian', 0.1); 
filtered_image_final = imfilter(filtered_image2, moonlap, 'replicate');
figure;
montage({f, filtered_image1, filtered_image2, filtered_image_final}, 'Size', [1 4]);

%Task 7
clear all
close all
f = imread('assets/lake&tree.png');
imshow(f) 
f_equalized = histeq(f);
montage({f,f_equalized});

clear all
close all

f = imread('assets/circles.tif');
imshow(f);

us = fspecial('unsharp', 0.2); 
filtered_image1 = imfilter(f, us, 'replicate'); 

sob = fspecial('sobel'); 
filtered_image2 = imfilter(filtered_image1, sob, 'replicate');

figure;
montage({f, filtered_image1, filtered_image2}, 'Size', [1 3]);

clear all
close all
f = imread('assets/office.jpg');
imshow(f);
us = fspecial('unsharp', 0.2); 
f_us = imfilter(f, us, 'replicate');
f_eq = histeq(f_us);
gamma = 0.7;
f_gamma = imadjust(f_eq, [], [], gamma);
figure;
montage({f,f_us f_eq, f_gamma}, 'Size', [1 4]);



