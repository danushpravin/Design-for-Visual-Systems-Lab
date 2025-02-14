## Lab 3: Intensity Transformation and Spatial Filtering

## Task 1: Contrast Enhancement with the function imadjust

First step was to import the breastxray image onto the code and display it. The dimensions of the imported image are as below.
![image](https://github.com/user-attachments/assets/b12a4cda-d474-425f-ba30-a7d87895bb4b)

![image](https://github.com/user-attachments/assets/45a9daae-31c8-4e89-ac8f-089faadb493e)

We can find out the intensity of any pixel by just specifying it as below:
```matlab
f(3,10)
```
The answer is 28 for this case.
To find the minimum and maximum instensities of the image we can use the following code:
```matlab
[fmin, fmax] = bounds(f(:))
```
![image](https://github.com/user-attachments/assets/3361e1e6-bf0c-4789-bcd1-c2a4c8cf7c6a)

To display any specefic part of the image we can specify the rows and columns we require. For example if i need only the right half of the image.
```matlab
imshow(f(:,241:482))
```
![image](https://github.com/user-attachments/assets/ac0f749e-610d-4c60-90e8-226827079e7c)

The function used for contrast enhancement is the imadjust function. I will use this to get the negative format of the original image.
![image](https://github.com/user-attachments/assets/cc0a2476-aea8-4293-ac19-90854b3b6f20)
```matlab
g1 = imadjust(f, [0 1], [1 0])
```
This makes it much easier to spot the cancer region as seen clearly from the above image. As i understood, in the above function we are reversing the colours by mapping the low input to the highest ouput and vice versa.

Gamma Correction
```matlab
g2 = imadjust(f, [0.5 0.75], [0 1]);
g3 = imadjust(f, [ ], [ ], 2);
```
![image](https://github.com/user-attachments/assets/cc07cc8e-c12a-402e-a1ea-d2cb13904551)

This is another efficient method of spotting the cancerous region. Here as i understood we are reducing the low end even more while simultaneously expanding the high end of the grayscale. Due to this we see more details in the g3 image.

## Task 2: Contrast Stretching Transformation

Now we get rid of the function and use a transformation function formula to perform the Contrast Enhancement.

![image](https://github.com/user-attachments/assets/c6fc4806-bfa2-461a-9753-e1247975f374)

As observed this image has much better details. This image is more helpful in viewing the complete bone structure. The darker areas are made much lighter and brighter areas are more distinct.
All the edges are clear and details are really fine and precise.
For a better comparison i tried out the gamma correction method of the previous task for the bone scan image.
![image](https://github.com/user-attachments/assets/a00b7ef7-d115-406b-be9d-9c282decd45b)

As seen the image is not as clear and well defined as the formula based one. Therefore it is observed that all these different methods can be used for different cases.

## Task 3: Contrast Enhancement using Histogram

For the histogram method first we import the pollen image and plot the hisotgram using the imhist function. The output can be seen as below:
![image](https://github.com/user-attachments/assets/3bfa89ab-48d8-4130-a8a0-d660a672de79)

![image](https://github.com/user-attachments/assets/9c0fc836-82d7-450e-86ae-87f70d381f5a)

Now we try stretching the intensity using the imadjust function.

![image](https://github.com/user-attachments/assets/e3402370-23b4-4f44-95d1-56104a82dceb)

![image](https://github.com/user-attachments/assets/572eac9c-898d-4d51-b225-809102f7f723)
We can see that by strecthing the intensity we get a much better image but still not the perfect one.
Now we calculate the probability distributive and cumulative distribution fucntion and plot them to improve the image even more.

![image](https://github.com/user-attachments/assets/8b8cea74-abf8-4b9f-b841-c6f9df1f34de)

After this we perform histogram equalization with the above computed data. 

![image](https://github.com/user-attachments/assets/59535623-b91f-4bbf-9095-64b30f6ef01e)

What we have done above is we computed the CDF an used it as the intensity transformation function in order to flatten the histogram.
![image](https://github.com/user-attachments/assets/9555951f-9d9d-4ec6-bbb5-31bac782da01)

As we can see the bottom left image is the best image obtained after performing histogram equalization.

## Task 4: Noise Reduction with Low pass filter

![image](https://github.com/user-attachments/assets/5b3103cf-5d66-4d36-8fc9-32b8859fc614)
In this taks we'll be denoising the above PCB image using matlab's builtin fspecial function.

![image](https://github.com/user-attachments/assets/7831059f-cbd1-4d8e-9ca8-0c9cf14fa172)
The above is the output for the code that was already provided and as you can the image is much clear with features and less noisy.
I have played around by changing the values of the kernel and sigma as you can see below:

Case 1: Small kernel size and low sigma
![image](https://github.com/user-attachments/assets/9df11ca3-438a-44a1-bce2-0536796e9441)

Here the edges are more defined but the image is still a bit noisy.

Case 2: Medium kernel size and medium sigma
![image](https://github.com/user-attachments/assets/10063b9e-6f18-4ce0-a3d6-b17a8f363462)

Here the noise is reduced further but edges are slightly blurred.

Case 3: Large kernel size with high sigma
![image](https://github.com/user-attachments/assets/75dd6391-482c-49d7-a7da-6550ea86d6ca)

Here it is smoothed out properly with almost no noise but all the edges and details are blurred out and lost.

## Task 5: Median Filtering

The result of the provided median filter function is as below:
![image](https://github.com/user-attachments/assets/3e98e6cc-0fa9-4bfe-b505-938a25df7f4c)

The problem with the previous method was that we reduced noise at the cost of losing edges and details of the image. To prevent we use median filter. As observed
the image displayed above has reduced noise while keeping all the important details.

## Task 6: Sharpening the image with Laplacian, Sobel and Unsharp filters

Using Laplace filter:
![image](https://github.com/user-attachments/assets/e9f3ec5b-8646-4071-bfe9-13030a0ee62b)

This creates a really dark image and we can barely see the craters on the moon. I have given the alpha as 0.5.

Using Sobel filter:
![image](https://github.com/user-attachments/assets/b4f29a5c-8c60-4d7b-ade6-0a3cf6d7a739)

The output of the sobel filter is much better in visualizing the craters. This even highlited some features i didnt know existed on the original moon image. The feature detection is much better in the sobel filter.

Using Unsharp filter:
![image](https://github.com/user-attachments/assets/f5a8dbc0-8788-4b3e-9826-7e3c3c092b16)

The unsharp filter provides a higher definition image of the original image. This image is more useful and will help in getting more accurate filtering.

Final Crater Image:
![image](https://github.com/user-attachments/assets/6b78a2bb-8bd6-4e8e-a3b7-2cc2bebf0141)

I first applied the unsharp filter to enhance image quality and the used sobel followed by laplace filter. The output of the laplace filter is unsatisfactory and i think the sobel filter's output is good enough for crater detection.

## Task 7
![image](https://github.com/user-attachments/assets/1c3cfe77-eadb-402a-9b19-382dab823e99)

I used hitrogram equalization function for the above image for contrast enhancement.

![image](https://github.com/user-attachments/assets/4de62905-0a26-4b07-9639-59aa10ce2705)

For the above image, i used unsharp filter to pre process the image and render a better quality with more precise edges and details. Then applied a sobel filter on the output of the previous filter which gave the perfect edge detection of all the circles.

![image](https://github.com/user-attachments/assets/810b0b86-ffd1-469b-bce5-c4523de2545c)

For the above image i applied the following techniques in order to improve lighting and colour.
1)Unsharp Mask: Improved edges and details of the image.
2)Histogram Equalization: Enhanced the contrast, making dark areas more visible.
3)Gamma Correction: Adjusted the brightness to make the image clearer and improve visibility in darker regions.
