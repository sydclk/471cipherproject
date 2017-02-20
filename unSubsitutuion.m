function unSubsitutuion()
global cipherText monoFrequencyTable tempPlainTextNum

monoFrequencies = monoFrequencyTable(:,2);
letterNumber = monoFrequencyTable(:,1) + 'a';
letter = char(letterNumber);
userInput = 'I';
tempPlainTextNum = cipherText + 'a';
tempPlainText = char(tempPlainTextNum);
cellstr(letter);

table(letter, monoFrequencies)

while(userInput ~= 'q')
    fprintf(tempPlainText);
    fprintf('\n');
    userInput = input('Please enter letter you want to change and letter you want to replace it with, separated by a space (Enter "q" to quit): ', 's');
    
    if(userInput == 'q')
        break 
    end
    
    changeLetter(userInput(1), userInput(3));
    tempPlainText = char(tempPlainTextNum);
    fprintf(tempPlainText);
    fprintf('\n')
end

end

