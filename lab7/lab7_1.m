% Lab 7.1
%%Clearing the environment
clc
clear all
close all

%% 1.1 Determine the transfer function H(z)of the system if h(n)=n(0.9.^n);
num=[10,0]; %coefficients in descending powers of numerator
den=[25,-20,4]; %coefficients in descending powers of denominator
Ts=0.1; %Sampling period
H_z=tf(num,den,Ts) %transfer function
%% 1.2 Compute and plot the zeros and the poles ofthe transfer function.
poles=pole(H_z)
zeros=zero(H_z)
pzmap(H_z)  %plot of the poles and zeros
%% 1.3 Compute and plot the step response s[n]of the system
s=dstep(num,den) %step response
figure 
subplot(3,1,1)
stem(s) %plot
xlabel("n")
ylabel("s(n)")
title("Step Response s(n)")
%% 1.4 Compute and plot the impulse response h(n]of the system
h=dimpulse(num,den) %impulse response
subplot(3,1,2)
stem(h) %plot
xlabel("n")
ylabel("h(n)")
title("Impulse Response h(n)")
%% 1.5 Compute and plot the response of the system to the input signal
n=0:30; %time interval of input signal
x=0.9.^n; %input signal
r=dlsim(num,den,x) %response to the input signal
subplot(3,1,3)
stem(r) %plot
xlabel("n")
ylabel("r(n)")
title("Response of the system to x(n)")
%% 1.6 Compute and plot the frequency response of the system
figure
freqz(num,den) %%without variable assignment, the plot is obtained 
title("Frequency response of the system")
