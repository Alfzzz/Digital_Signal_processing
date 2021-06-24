function y = averager(M,x)
% Moving average of signal x
% M: order of averager
% x: input signal
%

b = (1/M)*ones(1,M);
y = filter(b,1,x);