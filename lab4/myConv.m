function y=myConv(x,h)
%x:input signal
%h:impulse response
%y:convolution x*h

%Obtaing length of both inputs of the function x and h
Nx=length(x);
Nh=length(h);

%Pad x with zeros in both sides
Xk=[zeros(1,Nh-1) x zeros(1,Nh)];

%Initializing Hk with zeros
Hk = zeros(length(Xk),length(Xk));

%Generating Matrix of flipped h shifted one place in each row
Hk(1,:) = [flip(h) zeros(1,length(Xk)-Nh)];
for i=2: length(Hk)-length(h)+1
    Hk(i,:)=circshift(Hk(i-1,:),1);
end

Hk = Hk'; %transpose of Hk
y = Xk*Hk;  %Matrix multiplication, also obtaing the convolution result

y = y(1:Nx+Nh-1);  %clipping output result for interested values 
end