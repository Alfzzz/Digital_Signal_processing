function snr = calcsnr(X, Xq)
% function snr = calcsnr(X, Xq)
% This script computes the signal-to-noise ratio
%
%  X:   Original signal
%  Xq:  Quantized signal
%  snr: SNR in dB
%

eq = X - Xq;        

snr = 10 * log10(sum(X.^2)/sum(eq.^2))

