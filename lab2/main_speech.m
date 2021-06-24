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
load speech.dat;  

%% Computing signal parameters and conditioning input signal
% To make consistent use of variable names 
X = speech; 
fs = 8000;     % Sampling rate [Hz]
N = length(X);                          % Length of signal vector
T = 1/fs;                               % Sampling period or interval [s]
t = [0:N-1]*T;                          % Time vector from sample number [s]
X = 4.5 * X/max(abs(X));                % Normalizes speech data in the range from -4.5 to 4.5

%% Quantization process
snrValues=[]
for bits=3:15   
    
    for i=1:N;  
      [I(i), Xq(i)] = biquant(bits, -5, 5, X(i));	% Quantization index and level
    end

    eq = X-Xq;                                % Calculates the quantization error

    %% Plotting for specific bits of quantization
    if bits==3||bits==8||bits==15;       
        figure(bits);
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
    snrValues(bits-2)=snr(X,Xq);


    %%
    %%Produce quantized audio signal when using specifc bits of quantization
    if bits==4
        sound(Xq/max(abs(Xq)),8000);
    end

end

%%
%Plot SNR and show SNR values
figure
stem(3:15,log10(snrValues));  
xlabel('Bits')
ylabel('SNR (dB)')
title('SNR(dB) vs Bits')