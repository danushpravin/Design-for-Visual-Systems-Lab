Lab 1: Introduction to MATLAB

## Task 0: Learning MATLAB Basics

The first task was to complete the introductory course on MATLAB Academy, which covers all the essential basics needed to use MATLAB effectively. This course was really helpful in refreshing my MATLAB knowledge. Although I had used MATLAB for signal processing during my undergraduate course, I needed a revision. The course covered everything I needed, including arrays, plots, matrices, and other key concepts, helping me get back up to speed with MATLAB coding.

The next step involved performing some image manipulations, so I uploaded the image into the MATLAB folder and loaded it using the following command:
```matlab
>> load clown
```
After loading, I attempted to check the values of a specific pixel using the command:
```matlab
>> clown(20,319)
```
However, I noticed that this command didn’t work. After investigating further using the variable window, I discovered that when the image was loaded, it was stored in the file as `X`. As a result, the only valid command was:
```matlab
>> X(20,319)
```
![image](https://github.com/user-attachments/assets/392b6e83-a11a-4375-bc94-a3ee807d99ca)

## Task 1: Image Rotation

The first coding task was to implement image rotation using forward and reverse mapping formulas.

### Inputs:
- **In**: The input grayscale image (2D matrix).
- **Theta**: The angle by which the image needs to be rotated (in radians).

### Outputs:
- **Out**: The rotated grayscale image, which should have the same size as the original.

### Format of the function:
```matlab
function [Out] = Rotate(In, Theta)
```

### Formulas Used:

1. **Forward Mapping**:
   (Include your forward mapping formula here)

2. **Reverse Mapping**:
   (Include your reverse mapping formula here)

### Approach:

1. **Find the Center of the Image**:
   Since the rotation happens around the center of the image, the first thing I did was calculate the center point.

2. **Create the Transformation Matrices**:
   I used the rotation angle (Theta) to create both the forward and reverse transformation matrices. The forward matrix helps with the rotation, and the reverse matrix is used to map pixels from the output back to the input.

3. **Loop Through the Pixels**:
   I then went through each pixel in the output image. For each pixel, I applied the reverse transformation to find where it came from in the original image and copied that pixel's value.

4. **Handle Boundary Conditions**:
   Lastly, I checked if any pixel falls outside the image bounds. If it does, I set it to black, as the task specifies.

### Example Command:
To view the rotated image, use the following command:
```matlab
imshow(rotate(X, 30), [])
```
where the angle is 30 degrees.

### Results:
I have played around by changing the theta (45, 30, 90) and got different outputs.
```

Feel free to copy and paste this into your README file on GitHub! If you need any more adjustments, just let me know.
