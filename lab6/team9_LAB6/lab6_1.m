%%LTI	systems:	difference	equations	and	the	convolution	sum
clc
clear all
close all
%% 1.1 Solving the	difference	equation
n=0:10; %interval from 0 to 10
%define y(0) and y(1), matlab does not have index 0, so they are shifted
%one index
y(0+1)=1;  
y(1+1)=1; 
x=4*cos(n*pi/8); %define x(n)
%define y(n)
for i=(2+1):11
    y(i)=y(i-1)+2*y(i-2)+x(i-2)
end

subplot(2,1,1)
stem(n, x);   
title("Input signal");
xlabel("n");
ylabel("x(n)=4*cos((n*pi)/8)");
subplot(2,1,2)
stem(n, y);
title("Output signal");
xlabel("n");
ylabel("y(n)=y(n-1)+2*y(n-2)+x(n-2)");

%% 1.2 Solving the	difference	equation
n2=0:10; %interval of n from 0 to 10

%Define input signal x(n),impuse response h(n) and output signal
%y(n) as the convolution of x(n) and h(n) 
x2=(0.8.^n2).*(ones(1,11)-[zeros(1,5) ones(1,11-5)]); 
h2=(0.5.^n2).*(ones(1,11)-[zeros(1,10) ones(1,11-10)]);
y2=conv(x2,h2);

figure
subplot(3,1,1)
stem(n2, x2);
title("Input signal");
xlabel("n");
ylabel("x(n)");
subplot(3,1,2)
stem(n2, h2);
title("Impulse response");
xlabel("n");
ylabel("h(n)");
subplot(3,1,3)
stem(0:(length(y2)-1), y2);
title("Output signal");
xlabel("n");
ylabel("y(n)");