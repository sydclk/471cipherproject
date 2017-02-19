function [ trigrams ] = findTrigrams()
    global cipherText
    %this is the same as findBigrams with the exception of an extra column
    %of characters
    %trigrams array initialized to all 0s
    trigrams = zeros(1,26*26*26);
    %char1 is the outer most "loop"
    %repmat builds repeating matrix according to given parameters
    char1 = repmat(0:25, [26*26 1]);
    char1 = char1(:);
    %char2 is the middle "loop"
    %this is lengthy initialization for middle "loop"
    %constructing the trigrams at each index in the trigram array
    %for each index the trigram can be recovered easily
    char2part = repmat(0:25,[26 1]);
    char2part = char2part(:)';
    char2 = char2part;
    for I = 2:26
        char2 = horzcat(char2, char2part);
    end
    %char3 is the inner "loop"
    char3 = repmat(0:25,1,26*26);
    %same indexing scheme
    trigrams(1 + cipherText(1) * 26 * 26 + cipherText(2) * 26 + cipherText(3)) = 1;
    %same sort as found in findBigrams
    for I = 2:length(cipherText)-3
        index = 1 + cipherText(I) * 26 * 26 + cipherText(I+1) * 26 + cipherText(I+2);
        trigrams(index) = trigrams(index) + 1;
    end
    %same construction of matrix as in findBigrams
    y = sum(trigrams);
    trigrams(:) = trigrams(:) / y(1);
    trigrams = [char1 char2' char3' trigrams'];
    trigrams = sortrows(trigrams, -4);

end

