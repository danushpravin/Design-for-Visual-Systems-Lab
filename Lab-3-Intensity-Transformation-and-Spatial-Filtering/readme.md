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

The function used for contarst enhancement is the imadjust function. I will use this to get the negative format of the original image.
![image](https://github.com/user-attachments/assets/cc0a2476-aea8-4293-ac19-90854b3b6f20)
```matlab
g1 = imadjust(f, [0 1], [1 0])
```
This makes it much easier to spot the cancer region as seen clearly from the above image. As i understood, in the above function we are reversing the colours by mapping the low input to the highest ouput and vice versa.

