%Clearing variables, command window and close all figures
clear all
close all
clc
%% 3.1 import images using the functionimread(filename). 
%import audio file
imgA= imread("ImageA.jpg");
imgB= imread("ImageB.jpg");
imgC= imread("ImageC.jpg");
imgD= imread("ImageD.jpg");

%% 3.2 Apply the following kernels to image A and image B
%Defining different 3x3 Kernels
boxBlur_kernel=[1 1 1;1 1 1;1 1 1]/9;
vertical_kernel=[0 0 0;1 1 1;0 0 0]/3;
horizontal_kernel=[0 1 0;0 1 0;0 1 0]/3;
gaussian_blur_kernel=[1 2 1;2 4 2;1 2 1]/16;
%2D convolution for image A with different kernels
boxBlur_imgA=conv2(imgA,boxBlur_kernel);
vertical_imgA=conv2(imgA,vertical_kernel);
horizontal_imgA=conv2(imgA,horizontal_kernel);
gblur_imgA=conv2(imgA,gaussian_blur_kernel);
%showing results of convolution for image A
figure
subplot(3,2,1)
imshow(imgA,[])
title("Original image A")
subplot(3,2,2)
imshow(boxBlur_imgA,[])
title("Box Blur kernel for image A")
subplot(3,2,3)
imshow(vertical_imgA,[])
title("Vertical mean kernel for image A")
subplot(3,2,4)
imshow(horizontal_imgA,[])
title("Horizontal mean kernel for image A")
subplot(3,2,5)
imshow(gblur_imgA,[])
title("Gaussian blur kernel for image A")

%2D convolution for image B with different kernels
boxBlur_imgB=conv2(imgB,boxBlur_kernel);
vertical_imgB=conv2(imgB,vertical_kernel);
horizontal_imgB=conv2(imgB,horizontal_kernel);
gblur_imgB=conv2(imgB,gaussian_blur_kernel);
%showing results of convolution for image B
figure
subplot(3,2,1)
imshow(imgB,[])
title("Original image B")
subplot(3,2,2)
imshow(boxBlur_imgB,[])
title("Box Blur kernel for image B")
subplot(3,2,3)
imshow(vertical_imgB,[])
title("Vertical mean kernel for image B")
subplot(3,2,4)
imshow(horizontal_imgB,[])
title("Horizontal mean kernel for image B")
subplot(3,2,5)
imshow(gblur_imgB,[])
title("Gaussian blur kernel for image B")

%% 3.5 Apply the convolution more than once
vertical_imgA10=imgA;
gblur_imgA10=imgA;
vertical_imgB10=imgB;
gblur_imgB10=imgB;
for i=1:10
    vertical_imgA10=conv2(vertical_imgA10,vertical_kernel);
    gblur_imgA10=conv2(gblur_imgA10,gaussian_blur_kernel);
    vertical_imgB10=conv2(vertical_imgB10,vertical_kernel);
    gblur_imgB10=conv2(gblur_imgB10,gaussian_blur_kernel);
end
figure
subplot(3,1,1)
imshow(imgB,[])
title("Original image B")
subplot(3,1,2)
imshow(vertical_imgB10,[])
title("10th conv with vertical kernel for image B")
subplot(3,1,3)
imshow(gblur_imgB10,[])
title("10th conv with gaussian blur kernel for image B")
figure
subplot(3,1,1)
imshow(imgA,[])
title("Original image A")
subplot(3,1,2)
imshow(vertical_imgA10,[])
title("10th conv with vertical kernel for image A")
subplot(3,1,3)
imshow(gblur_imgA10,[])
title("10th conv with gaussian blur kernel for image A")

%% 3.5 Apply the following kernels for image C and image D 

laplacian_kernel=[0 1 0;1 -4 1;0 1 0];
laplacian_kernel2=[1 1 1;1 -8 1;1 1 1];
%2D convolution for image C and image D with different kernels
laplacian_imgC=abs(conv2(imgC,laplacian_kernel));
laplacian2_imgC=abs(conv2(imgC,laplacian_kernel2));
laplacian_imgD=abs(conv2(imgD,laplacian_kernel));
laplacian2_imgD=abs(conv2(imgD,laplacian_kernel2));
%showing results of convolution for image C and image D
figure
subplot(3,1,1)
imshow(imgC,[])
title("original image C")
subplot(3,1,2)
imshow(laplacian_imgC,[])
title("laplacian kernel for image C")
subplot(3,1,3)
imshow(laplacian2_imgC,[])
title("laplacian2 kernel for image C")
figure
subplot(3,1,1)
imshow(imgD,[])
title("original image D")
subplot(3,1,2)
imshow(laplacian_imgD,[])
title("laplacian kernel for image D")
subplot(3,1,3)
imshow(laplacian2_imgD,[])
title("laplacian2 kernel for image D")
