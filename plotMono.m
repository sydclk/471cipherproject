function plotMono(includeLetterFrequency)
    global MonoFrequencyTable
    global CipherText
    global monoProbability
    
    if isempty(MonoFrequencyTable)
        MonoFrequencyTable = MonoFrequency(CipherText);
    end
    if isempty(monoProbability)
        CreateProbabilityData();
    end
    figure
    ticks = num2cell(char(MonoFrequencyTable(:,1)+'A'));
    if (includeLetterFrequency)
        ticks2 = num2cell(char(monoProbability(:,1)+'a'));
        ticks = strcat(ticks, ticks2);
        bar([MonoFrequencyTable(:,2) monoProbability(:,2)])
    else
        bar(MonoFrequencyTable(:,2))
    end
    % Set the remaining axes properties
    set(gca,'XTick',...
        [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26],...
        'XTickLabel', ticks, 'XTickLabelRotation',-67);
    ylabel('Relative Frequency');
    xlabel('Letter');
    title('Monogram Frequency');
end

