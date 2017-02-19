function kasiskiTest()
    
    %extra functionality
    %top 5 trigrams - 
    trigrams = findTrigrams();
    for I = 1:5
        %print out actual trigram (slice out first 3 elements of matrix at
        %row I and convert to string (+A)
        fprintf('%s\n', char(trigrams(I,1:3) + 'A'));
        %where the trigrams are located, intervals returns array of the
        %locations of all trigrams
        trigramIntervalList = trigramIntervals(trigrams(I,1:3));
        %print out Locations
        fprintf('Locations:');
        fprintf(' %i', trigramIntervalList);
        fprintf('\n');
        %compute the GCD of the intervals
        kasiskiCipherLength = gcdList(trigramIntervalList);
        %print out GCD
        fprintf('GCD = %i\n', kasiskiCipherLength);
    end
    
end

