%% Clear environment
clc
clear all
close all

%% Filter
%Low Pass Filter(LPF) with pass band frequency of 300Hz, stop band 
%frequency of 100Hz, passband ripple of 1dB, stop band attenuation of 60dB
%and sample rate of 2kHz
hpFilt_butter = designfilt('highpassiir','PassbandFrequency',300, ...
         'StopbandFrequency',100,'PassbandRipple',1, ...
         'StopbandAttenuation',60,'DesignMethod','butter','SampleRate',2000);
hpFilt_chebyshevI = designfilt('highpassiir','PassbandFrequency',300, ...
         'StopbandFrequency',100,'PassbandRipple',1, ...
         'StopbandAttenuation',60,'DesignMethod','cheby1','SampleRate',2000);
hpFilt_chebyshevII = designfilt('highpassiir','PassbandFrequency',300, ...
         'StopbandFrequency',100,'PassbandRipple',1, ...
         'StopbandAttenuation',60,'DesignMethod','cheby2','SampleRate',2000);
%% Determine the order of the filter and the design algorithm
hpFilt_butter_order=filtord(hpFilt_butter) %Result of order Butterworth
hpFilt_chebyshevI_order=filtord(hpFilt_chebyshevI) %Result of order ChebyshevI
hpFilt_chebyshevII_order=filtord(hpFilt_chebyshevII) %Result of order ChebyshevII
%% Plots of Frequency response
fvtool(hpFilt_butter,hpFilt_chebyshevI,hpFilt_chebyshevII);
legend("Butterworth","Chebyshev Type I","Chebyshev Type II")