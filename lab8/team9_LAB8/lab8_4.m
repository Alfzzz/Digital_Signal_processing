%Clear environment
clc;
close all;
clear all;

syms w
n = 0:19; %interval
x = (0.7.^n); %signal
X_dtft = sum(x.*exp(-j*w*n)); %DTFT of signal x

X_fft=dft(x); %DFT with fft of signal x
k=n;
N=length(k);

figure
subplot(2,1,1)
hold on
ezplot(abs(X_dtft),[0 2*pi]); %DTFT magnitude
stem(2*pi*k/N,abs(X_fft)); %DTF magnitude
xlabel('\omega')
ylabel('Magnitude')
title('Magnitude')
legend('Magnitude of DTFT','Magnitude of DFT')
hold off

subplot(2,1,2)
hold on
ezplot(angle(X_dtft),[0 2*pi]);%DFT phase
stem(2*pi*k/N,angle(X_fft)); %DFT phases
xlabel('\omega')
ylabel('Phase')
title('Phase')
legend ('Phase of DTFT','Phase of DFT')
hold off