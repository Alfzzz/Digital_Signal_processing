%Clearing variables, command window and close all figures
clear all
close all
clc
%import audio file
x= audioread('SpeechDFT-16-8-mono-5secs.wav');
sound(x,8000);  %play original audio
pause(5)    %pause 9 secs to finish audio

%Impulses
h=zeros(1,30000);
h(10000)=0.8;
h(20000)=0.6;
h(25000)=0.4;

y=conv(x,h);

sound(y,8000); %play output audio

subplot(3,1,1)
plot(x)
xlabel("n")
ylabel('x')
title("x vs n")
xlim([0 size(y,1)]) %adjust size to be same as y
subplot(3,1,2)
plot(h)
xlabel('n')
ylabel('h')
title("h vs n")
subplot(3,1,3)
plot(y)
xlabel('n')
ylabel('y')
title("y vs n")

%save files
audiowrite("soundOriginal.wav",x,8000)
audiowrite("soundConv.wav",y,8000)




