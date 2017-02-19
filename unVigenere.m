function unVigenere(keyLength)
    global cipherText
    global monoProbability
    
    %given the key length finds the key and decrypts ciphertext
    
    %putting the ciphertext into columns according to keylength (as in
    %icTest) 
    for i = 1:(length(cipherText) / keyLength)
        cipherTextColumns(1: keyLength, i) = cipherText(((i-1) * keyLength + 1):(i*keyLength));
    end
    %instead of increasing probability order, sorts into character order
    %(A, B, C, D...)
    monoProbabilityCharOrder = sortrows(monoProbability,1);
    vigenereKey(1:keyLength) = -1;
    %for each position 
    for j = 1:keyLength
        %calculate frequency of characters for each row
        %sort this frequency into character order
        frequencyTable  = sortrows(monoFrequency(cipherTextColumns(j,:)),1);
        %computer the mg function in book page 35
        for g = 0:25
            sum = 0;
            for i = 1:26
                sum = sum + monoProbabilityCharOrder(i,2) * frequencyTable(1+mod(i+g-1,26),2);
            end
            mg(j,g+1) = sum;
            %if the value is around .065 then the correct shift has been
            %found for that key
            %save this as being the shift for jth character in Vigenere key
            if sum > 0.055
                vigenereKey(j) = g;
            end
        end
    end
    
    %if this a Vigenere cipher, there must be a shift for every character
    %there should not be a -1 (initialized), if some did not get assigned
    %then there isn't a valid key, and thus it not Vigenere cipher
    if not(isempty(find(vigenereKey == -1, 1)))
        fprintf('Could not find key of length %i\n', keyLength);
        return
    end
    %otherwise output the key as string
    fprintf('Vigenere Key = %s\n',char(vigenereKey + 'A'));
    %call decryptVigenere with found key
    decryptVigenere(char(vigenereKey + 'A'));

end

