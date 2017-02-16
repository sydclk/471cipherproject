function [ bigrams ] = findBigrams()
    global CipherText

    bigrams = zeros(1,26*26);
    
    firstcharacter = repmat(0:25, [26 1]);
    firstcharacter = firstcharacter(:);
    
    secondcharacter = repmat(0:25,1,26);
    
    bigrams(1 + CipherText(1) * 26 + CipherText(2)) = 1;

    for I = 2:length(CipherText)-1
        index = 1 + CipherText(I) * 26 + CipherText(I+1);
        bigrams(index) = bigrams(index) + 1;
    end
    y = sum(bigrams);
    bigrams(:) = bigrams(:) / y(1);
    bigrams = [firstcharacter secondcharacter' bigrams'];
    bigrams = sortrows(bigrams, -3);
end

