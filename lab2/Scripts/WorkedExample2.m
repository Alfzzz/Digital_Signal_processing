%% WORKED EXAMPLE 2
% This script performes the following operations:
%  1. Loads speech data from file we.dat;
%  2. Quantizes x(t) using m bits (user defined) to obtain xq(t), assuming the signal range is between -5 and 5V.
%  3. Computes the quantization error, eq(t)
%  4. Plots the x(t), xq(t) and eq(t)
%  5. Calculates the SNR due to quantization

%% Clearing the working environment
clc
clear all
close all

%% Loading data
disp('Loading speech data... ');
load we.dat                             % File 'we.dat' must be in the current folder

%% Computing signal parameters and conditioning input signal
X = we;                                 % To make consistent use of variable names
fs = 8000;                              % Sampling rate [Hz]
N = length(X);                          % Length of signal vector
T = 1/fs;                               % Sampling period or interval [s]
t = [0:N-1]*T;                          % Time vector from sample number [s]
X = 4.5 * X/max(abs(X));                % Normalizes speech data in the range from -4.5 to 4.5


%% Prompting user to inpup number of bits 
m = input('Input number of bits and hit Enter: ');

%% Quantization process
for i=1:N
  [I(i), Xq(i)] = biquant(m, -5, 5, X(i));	% Quantization index and level
end

eq = X-Xq;                                % Calculates the quantization error

%% Plotting
subplot(3,1,1);
plot(t, X);     % Original signal
xlabel('Time (s)') 
ylabel('x(t)')
title('Original speech')                   
grid on

subplot(3,1,2);
stairs(t, Xq); % Quantized signal
xlabel('Time (s)') 
ylabel('x_{q}(t)')
title('Quantized speech')
grid on

subplot(3,1,3);
stairs(t, eq); %Quantization error
xlabel('Time (s)')
ylabel('e_{q}(t)')
title('Quantization error')


%% Computing SNR
disp('Signal power to quantization error noise:')
snr(X,Xq);