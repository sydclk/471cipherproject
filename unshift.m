%Author: Sydney Clark

function [ plainText ] = unshift( cipherText, CipherFrequency, FrequencyTable )

    shifts = mod(FrequencyTable(:,1) - CipherFrequency(:,1), 26);
    mostFrequentShift = mode(shifts);

    plainTextNumbers = mod(cipherText + mostFrequentShift, 26) + 'a';
    plainText = char(plainTextNumbers)';
end

