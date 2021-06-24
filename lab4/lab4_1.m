%Clearing variables, command window and close all figures
clear all
close all
clc

%Defining input signal x and impuse response h
x1=[0,0,5,2,3,0,0];
h1=[4,1,3];

y1= myConv(x1,h1);%Convolution sum function implemented by scratch
y_MATLAB= conv(x1,h1);  %Convolution sum function provided by MATLAB
fprintf("y1=yMATLAB: "+(sum(y1==y_MATLAB)==size(y1,2)))%Verify result

subplot(4,1,1)
stem(x1)
xlabel('n')
ylabel("x[n]")
title("x[n] vs n")
subplot(4,1,2)
stem(h1)
xlabel('n')
ylabel('h[n] vs n')
title("h[n] vs n")
subplot(4,1,3)
stem(y1)
xlabel('n')
ylabel('y1[n]')
title("y1 vs n")
subplot(4,1,4)
stem(y_MATLAB)
xlabel('n')
ylabel('yMATLAB[n]')
title("yMATLAB vs n")

% Triangle functions
t=-0.2:0.005:0.2;   %interval
w=0.2;
x2=tripuls(t,w);%Second input signal
h2=[ones(1,4),zeros(1,3),0.5*ones(1,4)]; %second impuse response

y2= myConv(x2,h2);  %Convolution sum of x2 and h2
figure
subplot(3,1,1)
stem(t,x2)
xlabel('t')
ylabel('x[t]')
title("x vs t")
subplot(3,1,2)
stem(h2)  %inteval of t adjusted to match size h2
xlabel('t')
ylabel('h2[t]')
title("h2 vs n")
subplot(3,1,3)
%inteval of t adjusted to match size y2
stem(-0.2:0.005:0.2+0.005*(size(y2,2)-size(x2,2)),y2)
xlabel('y2')
ylabel('y2[t]')
title("y2 vs t")