%% Clear environment
clc
clear all
close all

%% Filter
Fc=1000; %Cutoff frequency
Fs=8000; %Sampling frequency

%FIR Low Pass Filters(LPF) with different orders
b1= fir1(20,Fc/(Fs/2),'low'); %20th-order
b2= fir1(30,Fc/(Fs/2),'low'); %30th-order
b3= fir1(40,Fc/(Fs/2),'low'); %40th-order

%% Plots
figure %Filter coefficients for each order bk vs k
subplot(3,1,1)
stem(0:length(b1)-1,b1); %20th-order
title("20th-order b coefficients")
subplot(3,1,2)
stem(0:length(b2)-1,b2);  %30th-order
title("30th-order b coefficients") %20th-order 
subplot(3,1,3)
stem(0:length(b3)-1,b3); %40th-order
title("40th-order b coefficients") %20th-order 

fvtool(b1,1,b2,1,b3,1);
legend("20th-order","30th-order","40th-order")