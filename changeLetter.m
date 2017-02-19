%Author: Brett Bushnell

function changeLetter(cipherLetter , guessLetter)
global ciphertext


%Go through ciphertext and find letters to change
for i = 1:length(ciphtertext)
    if ciphertext(i) == cipherLetter 
        ciphertext(i) = guessLetter;
    end 
end




