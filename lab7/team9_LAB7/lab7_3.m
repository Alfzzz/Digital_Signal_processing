% Lab 7.3
%%Clearing the environment
clc
clear all
close all
%% 1.1 Determine the transfer function H(z)of the system.
num=[1,0]   %Coefficients of the numerator
den=[1,0.9]; %Coefficients of the denominator
Ts=0.1; %Sample period
H_z=tf(num,den,Ts) %transfer function
%% 1.2 Compute and plot the zeros and the poles ofthe transfer function.
poles=pole(H_z)
zeros=zero(H_z)
pzmap(H_z) %Pole-Zero Map
%% 1.3 Compute and plot the step response s[n]of the system
s=dstep(num,den) %step response
figure
subplot(2,1,1)
stem(s) %plot
xlabel("n")
ylabel("s(n)")
title("Step Response s(n)")
%% 1.4 Compute and plot the impulse response h(n]of the system
h=dimpulse(num,den) %impulse response
subplot(2,1,2)
stem(h) %plot
xlabel("n")
ylabel("h(n)")
title("Impulse Response h(n)")
%% 1.5 Compute and plot the frequency response of the system
figure
freqz(num,den) %without variable assignment, the plot is obtained 
title("Frequency response of the system")