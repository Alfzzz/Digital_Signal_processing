clc
clear all

n = 0:50;
x = 0.8.^n;
N = length(x);
tic
for k=0:N-1
    for n=0:N-1
        X(n+1)=x(n+1)*exp(-j*2*pi*k*n/N);
    end
    Xk(k+1)=sum(X);
end
toc

tic
Xk2 = fft(x);
toc