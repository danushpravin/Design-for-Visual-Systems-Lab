## Lab 4: Morphological Operations

## Task 1: Dilation and Erosion
Dilation Operation:

I performed the dilation operation on the given text wit different structutal elements.
![image](https://github.com/user-attachments/assets/fd25afe3-25eb-4241-8b0f-752313f99381)
In this experiment, I applied morphological dilation to a broken text image using different structuring elements (SE) to see how it affected the image.
-Original Image (A): The image had broken text with visible gaps.
-Plus 3x3 SE (A1): This SE slightly closed the gaps, making the text more continuous.
-All ones 3x3 SE (A2): This one filled the gaps more effectively and made the text thicker and bolder.
-Larger 4x4 SE (A3): The larger SE caused a more noticeable expansion, closing most gaps but also blurring the text a bit.
-Diagonal Cross 3x3 SE (A4): This SE mainly filled the diagonal gaps while leaving the horizontal and vertical parts less affected.

Dilating twice with B1:
The result of dilating the image with B1 twice is text which is much thicker and bolder with the same sharpness.
![image](https://github.com/user-attachments/assets/50f21f89-a726-44e2-8ea5-ccb0ec8d63e9)

Erosion Operation:

![image](https://github.com/user-attachments/assets/9db3ee0c-ac9d-407b-af14-d92c375ef7f0)

As observed the erode function removes certain features of the original image to focus on the more important aspects of the image and remove distarctions. The erosion again depends on the structural element. Here the structural element is created using the strel function rather than typing in a matrix manually. 
As we move from E2 (smalles SE) to E20 (largest SE) we can see the feature erosion increases as the size of the structuring element increases.

## Task 2: Morphological Filtering with open and close
![image](https://github.com/user-attachments/assets/82ad4ae0-4715-4f90-ae8b-09dab0d3fd04)
-Original Image (f): The initial image shows a noisy structure with some unwanted artifacts.
-Erosion (f_e): After applying erosion with a 3x3 structuring element, the details of the image shrink, and the noise is reduced, but some edges become blurred and less defined.
-Dilation (fed): The dilation step expands the eroded features, making them more prominent. However, it also causes the noise to reappear and make the image slightly less clear.
-Opening (fo): Opening the image with the same structuring element smooths out the noise while preserving the essential structures, showing a cleaner image compared to the original noisy input.

Different types of strel sizes and shapes:
![image](https://github.com/user-attachments/assets/65fe5e7e-3915-43ab-91e5-ac590d5d4d8e)
The 3x3 square structuring element worked best as it reduced noise effectively without losing too much detail. Larger elements like 7x7 or disk shapes smoothed the image too much, while smaller ones didn’t remove enough noise. Therefore, 3x3 square is the ideal choice for preserving details while cleaning up the image.

Adding the closing operation:
![image](https://github.com/user-attachments/assets/ced955ac-93b0-4034-924e-de1162eca81f)
I didn't see much difference between the opened and closed images. This could be because the image didn't have many small gaps or noise. But I understand that the closing operation fills small holes, while opening removes small objects or noise. Since there wasn't much to clean up or join in my image, both operations looked similar. 

Comparison of Morphological Filtering using Open + Close to spatial filter with a Gaussian filter:
![image](https://github.com/user-attachments/assets/5989195b-fb4e-4f03-9c55-0256a448f4ba)
The Gaussian filter helps smooth the image and reduce noise, but it can blur the edges. On the other hand, morphological filters do a better job of preserving the shapes and structures while removing noise or filling in gaps.

## Task 3: Boundary Detection

![image](https://github.com/user-attachments/assets/77e813f3-660d-4a36-9da3-63549c438e66)

I first converted the inverted grayscale image to a binary one using Otsu's method. The blobs turned white, and the background became black. After that, I applied erosion with a 3x3 structuring element to shrink the white areas. Subtracting the eroded image from the original binary image showed the boundaries of the blobs, making the edges of the blobs clearer. The boundary detection highlighted the shapes of the blobs and helped separate them from the background.
