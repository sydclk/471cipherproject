function [ sortedFrequencyTable ] = monoFrequency( cipherText )

    %calculating frequency table for individual characters
    %acts like findBigrams and findTrigrams but more simple (only 0 - 25 letters)
    x = 0:25; % character values
    frequency = hist(cipherText, x);
    relativeFrequency = frequency/length(cipherText);
    table = [x' relativeFrequency'];
    sortedFrequencyTable = sortrows(table, -2);

end
