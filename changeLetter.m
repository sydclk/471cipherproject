%Author: Brett Bushnell

function changeLetter(cipherLetter , guessLetter)
global tempPlainTextNum cipherText

%cipherLetterNum = str2num(cipherLetter);
%guessLetterNum = str2num(guessLetter);

%Go through ciphertext and find letters to change
for i = 1:length(cipherText)
    if cipherText(i) + 'a' == cipherLetter; 
        tempPlainTextNum(i) = guessLetter;
    end 
end




