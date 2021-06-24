% Clearing everything
clc
clear all
close all

%Defining the function
nvalues=21;
n= linspace(-10,9,nvalues);   %Interval
X=cos(2*pi*n/7); 
subplot(3,1,1)
stem(n,X)
xlabel("n")
ylabel("X[n]")
title("X[n](original) vs n")

%% Compression(Downsampling)
%Iterate over X by step of 2 and take sample with n value 
for i=1:2:size(X,2)
    X_compression((i+1)/2)=X(i);
    n_compression((i+1)/2)=n(i);
end
   
subplot(3,1,2)
stem(n_compression,X_compression)
xlabel("n")
ylabel("X[2n]")
title("X[2n](compression) vs n")

%% Upsample
%Iterate over X and add 0 for each sample
X_expansion=[];
n_expansion= linspace(-10,9,size(n,2)*2);
for i=1:size(X,2)
    X_expansion=[X_expansion X(i) 0];
end
   
subplot(3,1,3)
stem(n_expansion,X_expansion)
xlabel("n")
ylabel("X[n/2]")
title("X[n/2](expansion) vs n")


