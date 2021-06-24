%% WORKED EXAMPLE 1
% This script performes the following operations:
%  1. Generates the signal x(t)=4.5sin(2*pi*f*t) with f=100 Hz and sampled at fs=8kHz;
%  2. Quantizes x(t) using m bits (user defined) to obtain xq(t), assuming
%       the signal range is between -5 and 5V;
%  3. Computes the quantization error, eq(t)
%  4. Plots the x(t), xq(t) and eq(t)
%  5. Calculates the SNR due to quantization


%% Clearing the working environment
clc
clear all
close all

%% Generating the signal x(t)=4.5sin(2*pi*f*t) with f=100 Hz and sampled at fs=8kHz.  
fs = 8000;                                     % Sampling rate or frequency [Hz]
Ts = 1/fs;                                     % Sampling interval [s]
t = 0:Ts:0.02;                                 % Time vector with 0.02-s duration
X = 4.5*sin(2*pi*100*t);                       

%% Prompting user to inpup number of bits 
m = input('Input number of bits and hit Enter: ');

%% Quantization process
N = length(X);                                % Length of signal vector 

for i = 1:N
  [I(i)  Xq(i)] = biquant(m, -5, 5, X(i));   % Computes quantization index and level
end

eq = Xq - X;                                 % Calculates quantization error

%% Plotting
subplot(2,1,1)
plot(t,X); % Original signal
hold on
stairs(t,Xq) % Quantized signals
grid on;  
xlabel('Time (s)') 
ylabel('x(t) & x_{q}(t)')
legend('Original', 'Quantized')
title('Original and quantized signals')

subplot(2,1,2)
stairs(t,eq)
xlabel('Time (s)') 
ylabel('e_{q}(t)')
title('Quantization error')

%% Computing SNR
disp('Signal power to quantization error noise:')
snr(X,Xq);
