%%Convolution sum and the z-transform
clc
clear all
close all

%Convolution of x(n) with itself 
x=ones(1,3);
yConv=conv(x,x) %show coefficients by convolution 

figure
subplot(2,1,1)
stem(0:4,[x 0 0],'filled');
title("Signal x(n)");
xlabel("n");
ylabel("x(n)");
subplot(2,1,2)
stem(0:4,yConv,'filled');
title("convolution of x(n) with x(n)");
xlabel("n");
ylabel("y(n)");

