plasticInTheSea = [10 : .1 : 21.9] + randn(1,120);
condition1 = randn(60,1); % generate a 60 x 1 matrix
condition2 = condition1 + (randn(length(condition1),1));