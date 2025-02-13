## Lab 2 : Colours and Perception 

## Part 1 : Seeing Colours and Shapes
## Task 1: Blind Spot Test

This test was very interesting as I could test my blind spot. The lack of light absorbing cells on the blind spot is covered up by the brain which fills the area using the surrounding background as a reference.

## Task 2: Ishihara Colour Test

I took the Ishihara color vision test, which is designed to detect deficiencies in the long and medium cones of the eye. The test consists of a series of images containing color dots arranged in a way that reveals numbers to those with normal color vision. I passed all the tests, although a few of them were tricky and easy to misread.

## Task 3: American Flag Illusion

This illusion was a bit tricky to understand. First, I assumed it is the brain fixing the colors as I have already seen the American flag before, but I learnt that the image was tailored to have the exact opposite color scheme which is why I was able to see the correct colors and it wasn’t the brain fixing it. It was because our eyes were getting overstimulated while focusing too long and when I look away the after image slowly fades away while showing the correct colors. I tried the same experiment with the normal American flag image and was able to see an afterimage of green which made perfect sense.

## Task 4: Troxler’s Fading

This was the most fascinating illusion as the whole ring of circles disappeared from my field of vision. I have understood the explanation to be as the neurons get accustomed to the limited sensory information while focusing on the point too long, the brain fills the rest of the space. This apparently works better with low contrast stimulus.

## Task 5: Shepard’s Tables

I have understood the reason for why we think one of the tables are longer than the other is because our brain cannot interpret 3D visualization of 2D images and assumes one is longer than the other.
In the next illusion it is seen that A and B are both the same color when compared next to each other. This is because the B tile falls under the cylinders shadow hence our brain assumes that whatever falls in the shadow will be a different shade which is not correct.

## Task 6: The Grid Illusion

This illusion was interesting. When I looked at the center of the grid, I could see black dots appearing and disappearing at the intersections. This happens because our brain tries to fill in missing information, so we think there are dots when there actually aren’t. It felt strange because the dots seemed to shift in and out of view as I kept focusing on the center.

## Task 7: Cafe Wall Illusion

At first, the layers of the brick wall seemed to be misaligned, but when I used a ruler to measure the edges, I saw that they were actually parallel. The illusion happens because of the strong contrast between the black and white tiles, which makes the lines look slanted. When the contrast is lower, the illusion is not as strong. This shows how our brain can be tricked by contrast in patterns.

## Task 8: The Silhouette Illusion

I watched the video of the spinning dancer, and I saw the dancer spinning in one direction at first. After focusing for a while, the direction seemed to change and the dancer looked like she was spinning the other way. This happens because our brain has trouble understanding spinning shapes in 2D. It can switch between seeing the dancer spin clockwise or counterclockwise, depending on how we focus. It was cool to see my brain change its perception like that.

## Task 9: The Incomplete Triangles

In this image, I thought there were 5 triangles at first, but when I looked more carefully, I realized there are actually 6 triangles. The incomplete shapes tricked my brain into thinking there were fewer triangles. This task shows how our brain tries to fill in missing parts of shapes, even when they are not fully there.

## Part 2 : Exploring Colours in MATLAB

## Task 10: Convert RGB to grayscale

In this task i used multiple library functions to manipulate and play with images. The first function was to get the details of an image. This function is as below:

```matlab
imfinfo('peppers.png')
```
Matlab returned some basic details and information of this image.
![image](https://github.com/user-attachments/assets/9f2a7d69-5ec1-4d23-a184-5d828bb0911f)

The next function to convert from rgb to grayscale is below:
```matlab
I = rgb2gray(RGB);
figure              
imshow(I)
```
![image](https://github.com/user-attachments/assets/a722a4e3-861c-4cef-b7f7-eeaaa95d1887)

To compare the images side by side we use the following code:
```matlab
imshowpair(RGB, I, 'montage')
title('Original colour image (left) grayscale image (right)');
```
![image](https://github.com/user-attachments/assets/5663a93e-9f7a-4174-a8b2-99aab1e08ff7)

## Task 11: Splitting an RGB image into seperate channels

In this task we split the peppers image into seperate red, blue and green channels. We can display this and show how the image can be split.
```matlab
[R,G,B] = imsplit(RGB);
montage({R, G, B},'Size',[1 3])
```
![image](https://github.com/user-attachments/assets/9a1823be-6a80-4b3d-9211-aedc6d184582)
As we can see the red peppers are predominant in the red channel, the green peppers in the green channel while the garlic is predominant in all 3 channels. All channels have the same dimensions and the data type is unit8.
Another thing i did was to choose a pixel and get the values from all different channels to compare them. 
```matlab
row = 100;
col = 150;
disp(['Pixel value in Red channel at (100,150): ', num2str(R(row, col))]);
disp(['Pixel value in Green channel at (100,150): ', num2str(G(row, col))]);
disp(['Pixel value in Blue channel at (100,150): ', num2str(B(row, col))]);
```
![image](https://github.com/user-attachments/assets/c6e7635a-83ab-4579-ba89-b17df8ab9820)

![image](https://github.com/user-attachments/assets/8d266d00-b60e-42c5-8292-128f947eabe9)

## Task 12: Map RGB image to HSV space and into separate channels

Now the seperate channels to split the image are the H,S and V channels.
```matlab
HSV = rgb2hsv(RGB);
[H,S,V] = imsplit(HSV);
montage({H,S,V}, 'Size', [1 3]))
```
![image](https://github.com/user-attachments/assets/e5f83fe8-ad96-48f0-af3f-2c16996c22a1)

Hue (H): This shows the color itself, like red, blue, or green.
Saturation (S): This shows how strong or faded the color is. High saturation means the color is bright and pure; low saturation means the color is dull.
Value (V): This shows how bright or dark the color is. A high value means bright, and low means dark.

## Task 13: Map RGB image to XYZ space

Now the final task is to map the rgb image to xyz space. The function format is the same as all the previous functions.
```matlab
XYZ = rgb2xyz(RGB);
[X,Y,Z] = imsplit(XYZ);
montage({X,Y,Z}, 'Size', [1 3]);
```
![image](https://github.com/user-attachments/assets/b941a3d8-8329-4853-9c7a-b96c0f0bbb60)

My observations and learnings based on the above results are:

X channel: This channel represents colors that are made by mixing red and green light.

Y channel: This one shows the brightness of the image, which is mostly related to the green light.

Z channel: This channel is linked to the blue light in the image.




