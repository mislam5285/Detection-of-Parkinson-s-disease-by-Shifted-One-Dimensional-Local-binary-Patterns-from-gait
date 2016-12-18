function result=ekstfitur(hist)
    N = numel(hist); % NUMber of ELement in histogram 'hist'
    
    P = hist / sqrt(sum(power(hist,2)))+0.0001;
    aritmean = sum(hist)/N;                                 % Arithmetic mean
    stdeviation = sqrt(sum(power(hist-aritmean,2),2)/N);      % Standard deviation
    
    entropyval = sum(P .* log(P));                            % Value of Entropy
    energyval = sum(power(hist,2));                         % Value of Energy
    correlationval = sum((hist-aritmean)/stdeviation);      % Value of Correlation
    covval = stdeviation/aritmean;                          % Value of Coefficient of Variation
    kurtosisval = (sum(power(hist-aritmean,4))/N) / power(stdeviation,4);             % Value of Kurtosis
    skewnessval = sum (power((hist-aritmean)/stdeviation,3)) * N/(N-1)*(N-2);   % Value of Skewness 
    
    result=[entropyval, energyval, correlationval, covval, kurtosisval, skewnessval];
end