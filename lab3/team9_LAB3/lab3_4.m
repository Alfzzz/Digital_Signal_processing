% Clearing everything
clc
clear all
close all

%Load sample and produce sound
load handel.mat
sound(y,Fs)
pause(10)
subplot(2,1,1)
plot(y)
xlabel("n")
ylabel("y[n]")
title("Sound y[n] vs n")
%Calculate delay N1 and N2 for echo effect distance over velocity(345m/s)is
%the time it takes to bounce back, divide that with the sampling period to
%know at which point starts to play the echo. Fs is already define as we
%load the handel.mat
N1=round((17/345)/(1/Fs))
N2=round((34/345)/(1/Fs))

Nmax=max(N1,N2);    %Verify which delay is larger in order to know how long
%will be the total time  

%The echos must match the size of the original sound+the time of echo
echo1=[zeros(N1,1);y;zeros(Nmax-N1+1,1)];  %define echo1
echo2=[zeros(N2,1);y;zeros(Nmax-N2+1,1)];   %define echo2

%Adding original sound padded with 0 and echo effects, you can change 
%amplitudes to experiment other results 
r=1*[y;zeros(Nmax,1);0]+0.6*echo1+0.2*echo2;

%Produce the sound
sound(r,Fs)

subplot(2,1,2)
plot(r)
xlabel("n")
ylabel("r[n]")
title("Sound with echo r[n] vs n")
audiowrite("withoutEcho.wav",y,Fs)
audiowrite("withEcho.wav",r,Fs)
