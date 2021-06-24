%%MATLAB partial fraction expansion
clc
clear all
close all

%Use symbolic MATLAB to find the inverse Z-transform x
syms n z

%obtain inverse transform
x= iztrans((2*z^(-1))/((1-z^(-1))*(1-2*z^(-1))))
