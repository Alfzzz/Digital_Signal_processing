%Clear environment
clc
clear all
close all

n = 0:10; %interval
x =cos(n*pi/3); %signal
Xk=dft(x); %DFT of x
Xkshift=fftshift(Xk); %Centralize zero-frequency
Xk_fft=fft(x); %DFT of x with fft

N=length(Xk); %size of DFT

figure 
subplot(3,2,1)
stem(0:N-1,abs(Xk),'filled'); %DFT magnitude
title ('|X_k|')
ylabel("|X_k|")
xlabel("k")
subplot(3,2,2)
stem(0:N-1,angle(Xk),'filled');  %DFT phase
title ('\angle Xk')
ylabel("\angle")
xlabel("k")
subplot(3,2,3) %DFT 
stem(0:N-1,abs(Xk_fft),'filled'); %DFT magniude with fft
title ('|X_k| with fft')
ylabel("|X_k|")
xlabel("k")
subplot(3,2,4)
stem(0:N-1,angle(Xk_fft),'filled');  %DFT phase with fft
title ('\angle Xk with fft') 
ylabel("\angle")
xlabel("k")
subplot(3,2,5)
stem(-(N-1)/2:(N-1)/2,abs(Xkshift),'filled'); %DFT magnitude with fftshift
title ('|X_k| with fftshift')
ylabel("|X_k|")
xlabel("k")
subplot(3,2,6)
stem(-(N-1)/2:(N-1)/2,angle(Xkshift),'filled');%DFT phase with fftshift
title ('\angle Xk with fftshift') 
ylabel("\angle")
xlabel("k")