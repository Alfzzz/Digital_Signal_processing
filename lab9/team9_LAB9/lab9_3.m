%% Clear environment
clc
clear all
close all

%% Filter
%Low Pass Filter(LPF) with pass band frequency of 0.5pi rad/sample, stop 
%band frequency of 0.7 pi rad/sample, passband ripple of 1dB and stop band 
%attenuation of 80dB
lpFilt = designfilt('lowpassfir','PassbandFrequency',0.5, ...
         'StopbandFrequency',0.7,'PassbandRipple',1, ...
         'StopbandAttenuation',80) 
%% Determine the order of the filter and the design algorithm
info(lpFilt) %Design algorithm:Equiripple
order=filtord(lpFilt) %Result of order:26
     
%% Plots of Frequency response
fvtool(lpFilt);