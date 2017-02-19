function [ ic ] = icTest(numberOfRows )
    global cipherText
    %calculates the index of coincidence, returns index of coincidence for 
    %given (numberOfRows) length (numberOfRows is the key length)
    
    %guard to make sure calculation of IoC is possible (can't have
    %ciphertext smaller than key length)
    if length(cipherText) >= numberOfRows
        %creates columnar matrix given the key length (numberOfRows)
        %1 4 etc if key length is 3
        %2 5
        %3 6
        for i=1:(length(cipherText) / numberOfRows)
            cipherTextColumns(1: numberOfRows, i) = cipherText(((i-1) * numberOfRows + 1):(i*numberOfRows));
        end
        %initializes an array from 0 to 25
        x = 0:25; % character values
        %index of coincidence calculation
        %for each row, creating a histogram (determines frequencies of each
        %character in that row)
        %inner j loop calculation page 33 (ICX formula)
        for i = 1:numberOfRows
            frequency = hist(cipherTextColumns(i,:), x);
            sum1 = 0;
            for j = 1:26
                sum1 = sum1 + frequency(j) * (frequency(j)-1);
            end
            %index of coincidence for row
            ic1(i) = sum1 / (length(cipherTextColumns(i,:)) * (length(cipherTextColumns(i,:)) - 1));          
        end
        %average index of coincidence for all rows
        if length(ic1) > 1
            ic = sum(ic1)/length(ic1);
        else
            ic = ic1;
        end
    else
        ic = 0;
    end 
end

