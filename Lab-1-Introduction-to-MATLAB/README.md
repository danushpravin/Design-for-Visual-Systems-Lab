##Lab 1: Introduction to MATLAB

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

### Formulas Used:

1. **Forward Mapping**:
   <div style="display: flex; justify-content: space-around;">
     <img src="https://github.com/user-attachments/assets/60242367-8f64-462c-acc7-631ad6b3ca13" alt="Forward Mapping Image 1" width="45%">
     <img src="https://github.com/user-attachments/assets/04f8f853-e11a-4a1a-a9c5-29f6ffcee991" alt="Forward Mapping Image 2" width="45%">
   </div>

2. **Reverse Mapping**:
   <img src="https://github.com/user-attachments/assets/c1b5392f-dd35-4452-8ccf-be6f64dd4266" alt="Reverse Mapping Image" width="90%">

### Approach:

1. **Find the Center of the Image**:
   Since the rotation happens around the center of the image, the first thing I did was calculate the center point.

2. **Create the Transformation Matrices**:
   I used the rotation angle (Theta) to create both the forward and reverse transformation matrices. The forward matrix helps with the rotation, and the reverse matrix is used to map pixels from the output back to the input.

3. **Loop Through the Pixels**:
   I then went through each pixel in the output image. For each pixel, I applied the reverse transformation to find where it came from in the original image and copied that pixel's value.

4. **Handle Boundary Conditions**:
   Lastly, I checked if any pixel falls outside the image bounds. If it does, I set it to black, as the task specifies.
![image](https://github.com/user-attachments/assets/060e4914-e015-4f5a-9478-464e37db2033)

### Example Command:
To view the rotated image, use the following command:
```matlab
imshow(rotate(X, 30), [])
```
where the angle is 30 degrees.

### Results:
I have played around by changing the theta (45, 30, 90) and got different outputs.

<div style="display: flex; justify-content: space-around;">
  <img src="https://github.com/user-attachments/assets/97953ab3-2ba2-48c0-bafd-2966a39c75ae" alt="Image 1" width="30%">
  <img src="https://github.com/user-attachments/assets/4facf486-c6da-46b5-800d-7bd6b601712f" alt="Image 2" width="30%">
  <img src="https://github.com/user-attachments/assets/d1d77920-211b-458f-9d7a-d5ed92cda2e4" alt="Image 3" width="30%">
</div>

## Task 2: Image Shearing

The second coding task was to implement image shearing using the same method but different formulas and variables. This time there is no theta but the variables are xshear and yshear. 

### Inputs:
- **In**: The input grayscale image (2D matrix).
- **Xshear**: The shear factor for the x-axis determines how much the image will be sheared horizontally.
- **Yshear**: The shear factor for the y-axis determines how much the image will be sheared vertically.

### Outputs:
- **Out**: The sheared grayscale image, which should have the same size as the original.

### Format of the function:
```matlab
function [Out] =  Shear(In, Xshear, Yshear)

```

### Formulas Used:

### Formulas Used:

1. **Forward Mapping**:
   <img src="https://github.com/user-attachments/assets/a5e29162-73ae-4cf3-b19e-a1cc2af720ac" alt="Reverse Mapping Image" width="90%">

### Approach:

1. **Find the Center of the Image**:
   Since the shear operation is performed about the center of the image, the first step was to calculate the center point of the image. This allows the image to be sheared symmetrically.

2. **Create the Transformation Matrices**:
   Using the shear factors xshear (horizontal shear) and yshear (vertical shear), I created the transformation matrix. The matrix defines how much each pixel should be shifted horizontally and vertically.

3. **Loop Through the Pixels**:
   Next, I looped through each pixel in the output image. For each pixel, I applied the reverse transformation to map it back to its corresponding position in the input image. The nearest pixel from the source image was    used to determine the color value.

4. **Handle Boundary Conditions**:
   Finally, I checked if any calculated pixel position fell outside the image bounds. If so, I set the corresponding pixel in the output image to black (0), as specified in the task, ensuring that there are no invalid      pixels in the output.

![image](https://github.com/user-attachments/assets/afcea88c-784e-4586-b9c6-9cb209cd9b3e)


### Results:
Case1: When xshear is 0.5 and yshear is 0.2.
<img src="https://github.com/user-attachments/assets/766cd065-d9a5-4ee3-8e2a-3f11c8d946d4" alt="Reverse Mapping Image" width="90%">

Case2: When xshear is 1 and yshear is 0.6.
<img src="https://github.com/user-attachments/assets/e909a482-e743-4ddc-bb37-3b4e262edb60" alt="Reverse Mapping Image" width="90%">



```


