%%Brandon Najera Jimenez A01336657
%Problem 2
%%
clc;
clear all;
close all;
%%
%%Main Calculations
syms n
num1 = [1 0];
den1 = [1 -0.9];
ts1 = 0.1;

h = ((0.9)^n)*heaviside(n);
h1 = ztrans(h);
disp 'H[Z] = ';
pretty(h1);

transh = tf(num1, den1, ts1)
polesh = pole(transh)
zerosh = zero(transh)
stepzh = stepz(num1, den1);
dimpulseh = dimpulse(num1, den1);

freqzh = freqz(num1, den1);
%%
%%Arrays for plottings
stepzh1 = zeros(1, 21);
dimpulseh1 = zeros(1, 21);
dlsimh1 = zeros(1, 31);

for cont = 1:22
    if cont > 1 && cont<=21
        stepzh1 (cont-1) = stepzh1 (cont) + stepzh (cont-1);
        dimpulseh1 (cont-1) = dimpulseh1 (cont) + dimpulseh (cont-1);
    end
end
tam = linspace(0, 20, length(stepzh1));
%%
%%Plotting
figure("Name", "Problem 2 Plottings");
subplot (2, 4, [1, 2, 5, 6]);
pzmap(transh);
axis([-1 1 -1 1])
title("Poles-Zeros Map");

subplot (2, 4, [3, 4]);
plot (tam, stepzh1, "Color", "Red");
hold on
stem(tam, stepzh1,'MarkerFaceColor','red', 'MarkerEdgeColor','blu');
axis([0 19 0 10])
title("Step Response");
xlabel("n");
grid on;

subplot (2, 4, [7, 8])
plot (tam, dimpulseh1, "Color", "Blu");
hold on
stem(tam, dimpulseh1,'MarkerFaceColor','red', 'MarkerEdgeColor','blu');
axis([0 19 0 10])
title("Impulse Response");
xlabel("n");
grid on;

figure("Name", "Problem 2 Frequency Responses");
freqz(num1, den1);
title("Frequency Responses");
grid on;