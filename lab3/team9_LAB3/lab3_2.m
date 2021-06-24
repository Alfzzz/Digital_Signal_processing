% Clearing everything
clc
clear all
close all

%% Defining the function
Ts=0.25;    %Sampling period
n= linspace(-1,1,2/0.25+1); %Interval with by sampling period step
u=[zeros(1,4) ones(1,5)];  %defining unit to make negative values 0
X=(1-n).*u; %defining function X[n]
subplot(5,1,1)
stem(n,X)   %plot the function X[n] with stem
xlabel("n")
ylabel("X[n]")
title("X[n]")

minusN= linspace(1,-1,2/0.25+1); %interval reversal
minusU=[ones(1,5) zeros(1,4)]; %unit step reversal
minusX=(1-minusN).* minusU; %defining function X[-n]
subplot(5,1,2)
stem(n,minusX)  %plot the function X[-n] with stem
xlabel("n")
ylabel("X[-n]")
title("X[-n]")
%% Even and odd components
X_even=0.5*(X+minusX);   %even component of X[n]
X_odd=0.5*(X-minusX);    %odd component of X[n]
subplot(5,1,3)
stem(n,X_even)
xlabel("n")
ylabel("X[n](even)")
title("X[n](even) vs n")
subplot(5,1,4)
stem(n,X_odd)
xlabel("n")
ylabel("X[n](odd)")
title("X[n](odd) vs n")

X_sum=X_even+X_odd;  %sum even and odd component
subplot(5,1,5)
stem(n,X_sum)
xlabel("n")
ylabel("X[n](sum)")
title("X[n](sum) vs n")

%% Energy 
%Initialize energy values
E_x_even=0;
E_x_odd=0;
E_x_sum=0;
E_x=0;
%Iterate over size of X and sum squared value at each step
for i=1:size(minusX,2)
    E_x_even = E_x_even+(X_even(1,i))^2;
    E_x_odd= E_x_odd+(X_odd(1,i))^2;
    E_x_sum = E_x_sum+(X_sum(1,i))^2;
    E_x = E_x+(X(1,i))^2;
end 

fprintf("The value of E_x_even is: "+E_x_even+"\n")
fprintf("The value of E_x_odd is: "+E_x_odd+"\n")
fprintf("The value of the sum of E_x_even and E_x_odd is: "+E_x_sum+"\n")
fprintf("The value of original E_x is: "+E_x+"\n")
