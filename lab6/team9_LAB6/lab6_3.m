%%Inverse z-transform
clc
clear all
close all

%Use symbolic MATLAB to find the inverse Z-transform x
syms n z
x= iztrans((2-z^(-1))/(2*(1+0.25*z^(-1))*(1+0.5*z^(-1))));
pretty(x)

%evaluate x(n) as n goes to infinity
x_ninf=limit(x,n,inf)