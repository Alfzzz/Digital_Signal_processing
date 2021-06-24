%Clear environment
clc
clear all
close all

syms w
n = 0:10; %interval
x = cos(n*pi/3); %defining signal x
X = sum(x.*exp(-j*w*n)); %calculating the DTFT of x

figure
subplot(2,1,1)
ezplot(abs(X),[-pi pi])  %DTFT magnitude form -pi to pi
title('Magnitude of DTFT')
xlabel('\omega')
ylabel('|H(\omega)|')
subplot(2,1,2)
ezplot(angle(X),[-pi pi]) %DTFT phase from -pi to pi
title('Phase of DTFT')
xlabel('\omega')
ylabel('\angleH(\omega)')

figure
subplot(2,1,1)
ezplot(abs(X),[-3*pi 3*pi]) %DTFT magnitude form -3pi to 3pi
title('Magnitude of DTFT')
xlabel('\omega')
ylabel('|H(\omega)|')
subplot(2,1,2)
ezplot(angle(X),[-3*pi 3*pi]) %DTFT phase from -3pi to 3pi
title('Phase of DTFT')
xlabel('\omega')
ylabel('\angleH(\omega)')