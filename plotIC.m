function plotIC( maxValue )

    %plotting index of coincidences from 1 to maxValue
    %more manual way of finding key length (if cipher is Vigenere)
    %if there isn't an obvious IoC, cipher is not Vigenere

    for I = 1:maxValue
        ic(I) = icTest(I);
    end
    figure; hold on
    bar(ic)
    ylabel('Index of Coincidence');
    xlabel('Cipher Length');
    title('Index of Coincidence');
    xlim = get(gca, 'xlim');
    
    plot(xlim, [0.065 0.065]); 
    plot(xlim, [0.038 0.038]); 

end

