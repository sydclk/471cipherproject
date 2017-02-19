function [ score, shift] = shiftTest()
    global monoProbability cipherText
    
    %what is the shift value that gives the plaintext
    
    monoProbabilityCharOrder = sortrows(monoProbability,1);

    frequencyTable  = sortrows(monoFrequency(cipherText),1);
    score = 0;
    shift = -1;
    %for all possible shift values, find when sum is around 0.065 if
    %correct shift value (if not correct, sum will be closer to 0)
    %page 34 - 35
    for g = 0:25
        sum = 0;
        for i = 1:26
            sum = sum + monoProbabilityCharOrder(i,2) * frequencyTable(1+mod(i+g-1,26),2);
        end
        %looks for biggest sum value, assume that the largest value is the
        %shift that we want
        %returns the sum value and shift that gives highest sum value
        if sum > score
            shift = g;
            score = sum;
        end
    end

end

