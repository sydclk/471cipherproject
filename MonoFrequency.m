% Author: Sydney Clark
function [ sortedFrequencyTable ] = MonoFrequency( cipherText )

    x = 0:25; % character values
    frequency = hist(cipherText, x);
    relativeFrequency = frequency/length(cipherText);
    table = [x' relativeFrequency'];
    sortedFrequencyTable = sortrows(table, -2);

end