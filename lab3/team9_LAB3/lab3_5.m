% Clearing everything
clc
clear all
close all
N=6;

n=-10:10; %Define interval
x1=n.*heaviside(n);  %Define X1 function
w=heaviside(n)-heaviside(n-N);  %Window function
w(find(n==0 | n==N))=1; %set w[0] and w[N] to 1
y1=x1.*w;   %define output y1 of the windowing system

x2=(n-5).*heaviside(n-5);   %let input x2 be x[n-5]
y2=x2.*w;   %compute output y2 when using x2

%% Plotting all 
subplot(5,1,1)
stem(n,x1)
xlabel("n")
ylabel("x1[n]")
title("x1[n] vs n")
subplot(5,1,2)
stem(n,w)
xlabel("n")
ylabel("w[n]")
title("w[n] vs n")
subplot(5,1,3)
stem(n,y1)
xlabel("n")
ylabel("y1[n]")
title("y1[n] vs n")
subplot(5,1,4)
stem(n,x2)
xlabel("n")
ylabel("x2[n]")
title("x2[n] vs n")
subplot(5,1,5)
stem(n,y2)
xlabel("n")
ylabel("y2[n]")
title("y2[n] vs n")