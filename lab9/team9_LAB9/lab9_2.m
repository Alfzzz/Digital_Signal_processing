%% Clear environment
clc
clear all
close all

%% Filter
Fc=2500; %Cutoff frequency
Fs=8000; %Sampling frequency
order=30; %Filter order
%FIR High Pass Filters(HPF) with different window functions
b1= fir1(order,Fc/(Fs/2),'HIGH',hann(order+1)); %Hanning Window
b2= fir1(order,Fc/(Fs/2),'HIGH',hamming(order+1)); %Hamming window
b3= fir1(order,Fc/(Fs/2),'HIGH',blackman(order+1)); %Blackman window

%% Plots
figure %Filter coefficients for each window function
subplot(3,1,1)
stem(0:length(b1)-1,b1); %Hanning Window
title("b coefficients with Hanning window")
subplot(3,1,2)
stem(0:length(b2)-1,b2); %Hamming window
title("b coefficients with Hamming window")
subplot(3,1,3)
stem(0:length(b3)-1,b3); %Blackman window
title("b coefficients with Blackman window")

%% Plots of Frequency response 
fvtool(b1,1,b2,1,b3,1);
legend("Hanning","Hamming","Blackman")
