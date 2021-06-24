%Clearing variables, command window and close all figures
clear all
close all
clc

N= 100; %number of values
n=0:N-1; %interval

x=cos(pi*n/16); %input function
noise = 0.3*randn(1,N); %random noise
y= x+noise; %add noise to the input signal

%Apply averager filter with length M to input signal y
z1=averager(5,y);
z2=averager(10,y);
z3=averager(15,y);

%Plot all the signals in the same figure
hold on
plot(y)
plot(z1)    %noisy signal filtered with averager of length 5
plot(z2)    %noisy signal filtered with averager of length 10
plot(z3)    %noisy signal filtered with averager of length 15
legend('Noisy signal', 'Averaged signal(5th order)','Averaged signal(10th order)','Averaged signal(15th order)')

