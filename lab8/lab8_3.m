%Clear environment
clc
clear all
close all

n = 0:3; %interval
x =[1,-2,2,1]; %signal
Xk=dft(x); %DFT
Xk_fft32=fft(x,32); %DFT with fft of 32 length
Xkshift=fftshift(Xk); %DFT with fftshift
N=length(Xk); %length of DFT
N_fft=length(Xk_fft32); %fft 32 length
figure
subplot(3,2,1)
stem(0:N-1,abs(Xk),'filled'); %DFT magnitude
title ('|X_k|')
ylabel("|X_k|")
xlabel("k")
subplot(3,2,2)
stem(0:N-1,angle(Xk),'filled');%DFT phase
title ('\angle Xk')
ylabel("\angle")
xlabel("k")
subplot(3,2,3)
stem(0:N_fft-1,abs(Xk_fft32));
title ('|X_k| with fft of length 32') %fft magnitude with length 32 
ylabel("|X_k|")
xlabel("k")
subplot(3,2,4)
stem(0:N_fft-1,angle(Xk_fft32)); %fft phase with length 32 
title ('\angle Xk with fft of length 32')
ylabel("\angle")
xlabel("k")
subplot(3,2,5)
stem(-N/2:N/2-1,abs(Xkshift),'filled'); %DFT magnitude with fftshift
title ('|X_k| with fftshift')
ylabel("|X_k|")
xlabel("k")
subplot(3,2,6)
stem(-N/2:N/2-1,angle(Xkshift),'filled'); %DFT phase with fftshift
title ('\angle Xk with fftshift')
ylabel("\angle")
xlabel("k")