function unshift( shiftAmount )
    global cipherText
    
    %decodes the shifted cipher, displays in a window
    
    plainTextNumbers = mod(cipherText + shiftAmount, 26) + 'a';
    plainText = char(plainTextNumbers)';
    
    hFig = figure('Menubar','none', 'Toolbar','none');
    hPan = uipanel(hFig, 'Title','plaintext', ...
                   'Units','normalized', 'Position',[0.05 0.05 0.9 0.9]);
    hEdit = uicontrol(hPan, 'Style','edit', 'FontSize',9, ...
                        'Min',0, 'Max',2, 'HorizontalAlignment','left', ...
                        'Units','normalized', 'Position',[0 0 1 1], ...
                        'String',plainText);

end

