% Author: Sydney Clark

function [ trigrams ] = findTrigrams()
    global CipherText

    trigrams = zeros(1,26*26*26);
    
    firstcharacter = repmat(0:25, [26 1]);
    firstcharacter = firstcharacter(:);
    
    thirdcharacter = repmat(0:25,1,26*26);
    
    trigrams(1 + CipherText(1) * 26 * 26 + CipherText(2) * 26 + CipherText(3)) = 1;

    for I = 2:length(CipherText)-3
        index = 1 + CipherText(I) * 26 * 26 + CipherText(I+1) * 26 + CipherText(3);
        trigrams(index) = trigrams(index) + 1;
    end
    y = sum(trigrams);
    trigrams(:) = trigrams(:) / y(1);
    trigrams = [firstcharacter secondcharacter' thirdcharacter' trigrams'];
    trigrams = sortrows(trigrams, -4);

end

