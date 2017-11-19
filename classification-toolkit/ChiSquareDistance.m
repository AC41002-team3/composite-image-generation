function [ chi ] = ChiSquareDistance( lHistogram, rHistogram )
%CHISQUAREDISTANCE Summary of this function goes here
%   Detailed explanation goes here
    s = lHistogram + rHistogram;
    s(s==0) = 1;
    chi = 0.5*sum((lHistogram-rHistogram).^2./s);
end

