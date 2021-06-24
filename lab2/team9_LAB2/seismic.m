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
disp('Loading data... ');
% File must be in the current folder
load seismic.dat       

%% Computing signal parameters and conditioning input signal
% To make consistent use of variable names
X = seismic;  
fs = 15;     % Sampling rate [Hz]
N = length(X);                          % Length of signal vector
T = 1/fs;                               % Sampling period or interval [s]
t = [0:N-1]*T;                          % Time vector from sample number [s]
X = 4.5 * X/max(abs(X));                % Normalizes speech data in the range from -4.5 to 4.5


%% Prompting user to inpup number of bits 
%% Quantization process
for bits=13:31 
    
    for i=1:N
      [I(i), Xq(i)] = biquant(bits, -5, 5, X(i));	% Quantization index and level
    end

    eq = X-Xq;                                % Calculates the quantization error

    %% Plotting for specific bits of quantization   
    if bits==13||bits==18||bits==25||bits==31    
        figure(bits)
        subplot(3,1,1);
        plot(t, X);     % Original signal
        xlabel('Time (s)') 
        ylabel('x(t)')
        title('Original signal')                   
        grid on

        subplot(3,1,2);
        stairs(t, Xq); % Quantized signal
        xlabel('Time (s)') 
        ylabel('x_{q}(t)')
        title("Quantized signal with "+bits+" bits")
        grid on

        subplot(3,1,3);
        stairs(t, eq); %Quantization error
        xlabel('Time (s)')
        ylabel('e_{q}(t)')
        title("Quantization error with "+bits+" bits")
    end


    %% Computing SNR
    disp('Signal power to quantization error noise:');
    snrValues(bits-12)=snr(X,Xq);


end


%%
%Plot SNR()
figure
stem(13:31,log10(snrValues));  
xlabel('Bits')
ylabel('SNR (dB)')
title('SNR(dB) vs Bits')