function decryptVigenere( key )
    global cipherText
    %converts string (key) into an array of key codes
    keyLength = length(key);
    for i = 1:keyLength
        vigenereKey(i) = key(i) - 'A';
    end
    %decodes the ciher
    %within each key length, it is a shift cipher

    for i = 1:length(cipherText)
        plaintextNumbers(i) = mod(cipherText(i) - vigenereKey(1 + mod(i-1, keyLength)), 26);
    end
    %converts plaintext into a string
    plaintext = char(plaintextNumbers + 'a');
    %displays in window
    hFig = figure('Menubar','none', 'Toolbar','none');
    hPan = uipanel(hFig, 'Title','plaintext', ...
                   'Units','normalized', 'Position',[0.05 0.05 0.9 0.9]);
    hEdit = uicontrol(hPan, 'Style','edit', 'FontSize',9, ...
                        'Min',0, 'Max',2, 'HorizontalAlignment','left', ...
                        'Units','normalized', 'Position',[0 0 1 1], ...
                        'String',plaintext);

end

