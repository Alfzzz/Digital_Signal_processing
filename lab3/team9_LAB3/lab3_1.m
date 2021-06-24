% Clearing everything
clc
clear all
close all

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%a) Creating the discrete signal by the definition
%Defining x[n]=(0.5^n)*u[n] from n=-5 to 20
    %1.Defining the size of point
n = linspace(-5,20,26);

    %2. unit step
%Since te function has unit step(u[n]), initialize 0 values for
%first 5 negative values and 1 for the rest of the values
u = [zeros(1,5) ones(1,21)];
%It can be also done by using the next line
%u =[0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1];
        
    %3. Define descrete signal  
%Discrete Signal (With the addition of n+6 for adjusting the graph
%to the desirable location, starting from -5 and having 26 points.
x(6+n) = (0.5.^n).*u(6+n);

    %4.Plotting with Stem
stem(n ,x)
xlabel("n")
ylabel("x[n]")
title("x[n] vs n")
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%b) Computing infinite sum by definition
%Iterate over the size and add squared of the magnitude 
E_x = 0;
for (z=1:1:26)
    E_x = E_x+(abs(x(z)))^2;
end 
fprintf("The values of energy by definition is : "+E_x+"\n")

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%c) - Use SymSum to verify point b)  

syms k;
test_Ex= double( symsum(((.5)^k)^2,k,0,20));
fprintf("The values of energy using symsum is : "+test_Ex+"\n")
fprintf("The values are the same: "+(E_x==test_Ex))