%Author: Brett Bushnell

function changeLetter(cipherLetter , guessLetter)
global tempPlainTextNum

%cipherLetterNum = str2num(cipherLetter);
%guessLetterNum = str2num(guessLetter);

%Go through ciphertext and find letters to change
for i = 1:length(tempPlainTextNum)
    if tempPlainTextNum(i) == cipherLetter; 
        tempPlainTextNum(i) = guessLetter;
    end 
end




