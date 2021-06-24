%% Clear environment
clc
clear all
close all

%% Filter
%Butterworth Low Pass Filter(LPF) with passband frequency of 0.5 pi
%rad/sample and order of 26(Obtaind from lab9_3.m)
[b,a] = butter(26,0.5,'LOW'); %Obtaining coefficients 'a' and 'b' of filter
     
%% Plots of Frequency Response
freqz(b,a);
title("Butterworth LPF")