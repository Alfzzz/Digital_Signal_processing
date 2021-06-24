clear all
close all
clc

%Do
A=5;    %Amplitude
Duration= 1;
Fs= 44100;  %Sampling frequency The standard for audio is 44,100 samples/second
SamplingP=1/Fs; %Sampling period 1/Fs
t=0:SamplingP:1;    
fdo=1046.05;   %F_do=v/lambda_do=343/0.3279=1046.05
do= A*sin(2*pi*fdo*t);
subplot(6,2,1);
tPlot = 0:SamplingP:0.002;
plot(tPlot,A*sin(2*pi*fdo*tPlot));
ylabel("Do Amplitude");
xlabel("time");
%Re
fre=1174.25;    %F_re=v/lambda_re=343/0.3095=1174.25
re= A*sin(2*pi*fre*t);
subplot(6,2,2);
plot(tPlot,A*sin(2*pi*fre*tPlot));
ylabel("Re Amplitude");
xlabel("time");

%Mi
fmi=1317.71;    %F_mi=v/lambda_mi=343/0.2603=1317.71
mi= A*sin(2*pi*fmi*t);
subplot(6,2,3);
plot(tPlot,A*sin(2*pi*fmi*tPlot));
ylabel("Mi Amplitude");
xlabel("time");

%fa
ffa=1396.01;    %F_fa=v/lambda_fa=343/0.2457=1396.01
fa= A*sin(2*pi*ffa*t);
subplot(6,2,4);
plot(tPlot,A*sin(2*pi*ffa*tPlot));
ylabel("Fa Amplitude");
xlabel("time");

%sol
fsol=1566.92;   %F_sol=v/lambda_sol=343/0.2189=1566.92
sol= A*sin(2*pi*fsol*t);
subplot(6,2,5);
plot(tPlot,A*sin(2*pi*fsol*tPlot));
ylabel("Sol Amplitude");
xlabel("time");

%la
fla=1758.97; %F_la=v/lambda_la=343/0.195=1758.97
la= A*sin(2*pi*fla*t);
subplot(6,2,6);
plot(tPlot,A*sin(2*pi*fla*tPlot));
ylabel("La Amplitude");
xlabel("time");
%si
fsi=1974.66; %F_si=v/lambda_si=343/0.1731=1974.66
si= A*sin(2*pi*fsi*t);
subplot(6,2,7);
plot(tPlot,A*sin(2*pi*fsi*tPlot));
ylabel("Si Amplitude");
xlabel("time");
%do#
fdo2=1108.23; %F_do#=v/lambda_do#=343/0.3095=1108.23
do2= A*sin(2*pi*fdo2*t);
subplot(6,2,8);
plot(tPlot,A*sin(2*pi*fdo2*tPlot));
ylabel("Do# Amplitude");
xlabel("time");
%re#
fre2=1244.10;   %F_re#=v/lambda_re#=343/0.2757=1244.10
re2= A*sin(2*pi*fre2*t);
subplot(6,2,9);
plot(tPlot,A*sin(2*pi*fre2*tPlot));
ylabel("Re Amplitude");
xlabel("time");
%fa#
ffa2=1479.08; %F_fa#=v/lambda_fa#=343/0.2319=1479.08
fa2= A*sin(2*pi*ffa2*t);
subplot(6,2,10);
plot(tPlot,A*sin(2*pi*ffa2*tPlot));
ylabel("Fa# Amplitude");
xlabel("time");
%fsol#
fsol2=1660.21;  %F_sol#=v/lambda_sol#=343/0.2066=1660.21
sol2= A*sin(2*pi*fsol2*t);
subplot(6,2,11);
plot(tPlot,A*sin(2*pi*fsol2*tPlot));
ylabel("Sol# Amplitude");
xlabel("time");
%fla#
fla2=1864.13; %F_do=v/lambda=343/0.184=1864.13
la2= A*sin(2*pi*fla2*t);
subplot(6,2,12);
plot(tPlot,A*sin(2*pi*fla2*tPlot));
ylabel("La# Amplitude");
xlabel("time");

%Stack each note as a new row
notes_seq=[mi;mi;mi;do2;mi;sol2;do;sol;mi;la;si;la;sol;mi;sol;la;
    fa;sol;mi;do;re;si;do;sol;mi;la;si;si;la2;la;sol;mi;sol;la;fa;
    sol;mi;do;re;si;sol;fa2;fa;re2;mi;sol;la;do;la;do;re;sol;fa2;
    fa;re2;mi;do;do;do];

for n=1:size(notes_seq,1)   %For each note(row) in notes_seq
    sound(notes_seq(n,:),Fs)    %produce note
    pause(0.4) 
end
