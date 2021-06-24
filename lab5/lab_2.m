%%
% Linear and non-linear filtering
%%
clear all
close all
clc
N =200;n=0:N-1; %Number of samples and interval
x=[2*cos(pi*n(1:100)/256) zeros(1,100)]; %input signal, half cosine and half zeros

% impulsive noise
for m = 1:N,    %Interating over each sample
    d = rand(1,1); %Generating random number from 0 to 1
    if d >= 0.95,   
        noise(m) = -1.5;%Create impulsive noise of -1.5 if d greater or equal than 0.95
    else
        noise(m) = 0 ;  %otherwise no noise in this sample 
    end
end
y1=x+noise; %Add noise to the input signal


% linear filtering
z2=averager(15,y1);

% non-linear filtering -- median filtering
%Applying median to the first two and last two samples of the signal
z1(1)=median([0 0 y1(1) y1(2) y1(3)]);  
z1(2)=median([0 y1(1) y1(2) y1(3) y1(4)]);
z1(N-1)=median([y1(N-3) y1(N-2) y1(N-1) y1(N) 0]);
z1(N)=median([y1(N-2) y1(N-1) y1(N) 0 0]);
%Applying median to the rest of the samples
for k=3:N-2,
    z1(k)=median([y1(k-2) y1(k-1) y1(k) y1(k+1) y1(k+2)]);
end

%% Added section
%Plot of input signal, noisy signal, noisy signal with linear filter and
%noisy signal with non-linear filter
subplot(4,1,1)
plot(x)
title("input signal")
xlabel("n")
ylabel("x")
subplot(4,1,2)
plot(y1)
title("Noisy sinal")
xlabel("n")
ylabel("y")
subplot(4,1,3)
plot(z1)
title("Noisy signal with non-linear filter")
xlabel("n")
ylabel("z1")
subplot(4,1,4)
plot(z2)
title("Noisy signal with linear filter")
xlabel("n")
ylabel("z2")
