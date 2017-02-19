function [ bigrams ] = findBigrams()
    global cipherText
    %initialize bigram array to 0s (this means 26^2 long
    bigrams = zeros(1,26*26);
    %create char arrays, char1 moves least frequently (like outer loop
    %changes least frequently (aka AA AB AC -> char1 = A)
    %repmat creates a matrix and the char1 flattens it to a single array
    char1 = repmat(0:25, [26 1]);
    char1 = char1(:);
    % char2 creates an array that represents the inner loop (aka AA AB AC
    % -> char2 is A, B, C)
    char2 = repmat(0:25,1,26);
    %count the bigrams
    %this is the first bigram in the text
    %located in the bigrams array
    bigrams(1 + cipherText(1) * 26 + cipherText(2)) = 1;
    %incrementing the bigram array at the index of the specific bigram by 1
    %looping through every bigram in the ciphertext
    for I = 2:length(cipherText)-1
        index = 1 + cipherText(I) * 26 + cipherText(I+1);
        bigrams(index) = bigrams(index) + 1;
    end
    %y is the total number of bigrams in the text
    y = sum(bigrams);
    %normalize bigrams (sum of frequencies is 1)
    bigrams(:) = bigrams(:) / y(1);
    %create the matrix which is the first char in first column
    %second char in second column
    %bigram relative frequency in third column
    bigrams = [char1 char2' bigrams'];
    %sort in decreasing relative frequency
    bigrams = sortrows(bigrams, -3);
    
    %first two columns returned are letter codes, third column is the
    %letter relative frequency
end

