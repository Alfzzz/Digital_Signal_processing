function [I, Xq]= biquant(m, Xmin, Xmax, X)
% function [I, Xq] = biquant(m, Xmin, Xmax, value)
% This function is created for simulation of uniform quantizer
%
%   m:      number of bits used in quantization
%   Xmax:   maximum value
%   Xmin:   minimum value
%   X:      input to be quantized
%   Xq:     quantization level
%   I:      quantization index

L = 2^m;                    % Number of quantization levels
delta = (Xmax-Xmin)/L;      % Step size or resolution
I = round((X-Xmin)/delta);  % Index 

if (I==L)
    I = I-1;
end

if I<0
    I=0;
end

Xq = Xmin + I*delta;        % Quantized value
