function [meanVal,ciLimits] = CalcMean_CI(numVect)

meanVal = mean(numVect);

sd = std(numVect);

sqrt_n = sqrt(length(numVect));

sem = sd/sqrt_n;

ci = 1.96 * sem;

ciLimits(1) = meanVal - ci;
ciLimits(2) = meanVal + ci;