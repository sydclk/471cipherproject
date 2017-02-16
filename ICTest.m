function [ IC ] = ICTest(NumberOfRows )
    global CipherText
    
    if length(CipherText) >= NumberOfRows
        
        for I=1:(length(CipherText) / NumberOfRows)
            CipherTextColumns(1: NumberOfRows, I) = CipherText(((I-1) * NumberOfRows + 1):(I*NumberOfRows));
        end
        
        x = 0:25; % character values
        
        for I = 1:NumberOfRows
            frequency = hist(CipherTextColumns(I,:), x);
            sum1 = 0;
            for J = 1:26
                sum1 = sum1 + frequency(J) * (frequency(J)-1);
            end
            IC1(I) = sum1 / (length(CipherTextColumns(I,:)) * (length(CipherTextColumns(I,:)) - 1));          
        end
        
        if length(IC1) > 1
            IC = sum(IC1)/length(IC1);
        else
            IC = IC1;
        end
    else
        IC = 0;
    end 
end

