function unSubstitution()
global cipherText monoFrequencyTable tempPlainTextNum

monoFrequencies = monoFrequencyTable(:,2);
letterNumber = monoFrequencyTable(:,1) + 'a';
letter = char(letterNumber);
userInput = 'I';
tempPlainTextNum = cipherText + 'a';
tempPlainText = char(tempPlainTextNum)';
cellstr(letter);

%Shows table for the frequncies of indiviual letters
table(letter, monoFrequencies)

%shows the most common bigrams in the cipher text
plotBi(15, 0)

%Print out initial cipher text
    hFig2 = figure('Menubar', 'none', 'Toolbar', 'none'); %Plot for the guessed plaintext
    hFig1 = figure('Menubar','none', 'Toolbar','none');
    hPan = uipanel(hFig1, 'Title','cipherText', ...
                   'Units','normalized', 'Position',[0.05 0.05 0.9 0.9]);
    hEdit = uicontrol(hPan, 'Style','edit', 'FontSize',9, ...
                        'Min',0, 'Max',2, 'HorizontalAlignment','left', ...
                        'Units','normalized', 'Position',[0 0 1 1], ...
                        'String',tempPlainText); 

while(1)
    %print out original ciphertext
    %fprintf(char(cipherText + 'a'));
    %fprintf('\n');
    %fprintf('\n');
    %ask user what letters they want to change
    userInput = input('[Letter to change] [Letter to change to] (q to quit, f to print result): ', 's');
    
    %if q, quit
    if(userInput == 'q')
        break 
    end
    %if f, quit
    if(userInput == 'f')
        break
    end
    
    %change the letters and print out result
    changeLetter(userInput(1), userInput(3));
    tempPlainText = char(tempPlainTextNum)';
    hPan = uipanel(hFig2, 'Title','guessedPlainText', ...
                   'Units','normalized', 'Position',[0.05 0.05 0.9 0.9]);
    hEdit = uicontrol(hPan, 'Style','edit', 'FontSize',9, ...
                        'Min',0, 'Max',2, 'HorizontalAlignment','left', ...
                        'Units','normalized', 'Position',[0 0 1 1], ...
                        'String',tempPlainText); 
end

%if user is finished, print out the final plaintext
if(userInput == 'f')
    hFig = figure('Menubar','none', 'Toolbar','none');
    hPan = uipanel(hFig, 'Title','plaintext', ...
                   'Units','normalized', 'Position',[0.05 0.05 0.9 0.9]);
    hEdit = uicontrol(hPan, 'Style','edit', 'FontSize',9, ...
                        'Min',0, 'Max',2, 'HorizontalAlignment','left', ...
                        'Units','normalized', 'Position',[0 0 1 1], ...
                        'String',tempPlainText); 
end

end

