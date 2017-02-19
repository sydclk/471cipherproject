function plotMono(includeLetterFrequency)
    global monoFrequencyTable
    global monoProbability
    
    %plotting monogram frequency as in plotBi (simpler because one letter
    %instead of 2)
    
    if isempty(monoProbability)
        createProbabilityData();
    end
    figure
    ticks = num2cell(char(monoFrequencyTable(:,1)+'A'));
    if (includeLetterFrequency)
        ticks2 = num2cell(char(monoProbability(:,1)+'a'));
        ticks = strcat(ticks, ticks2);
        bar([monoFrequencyTable(:,2) monoProbability(:,2)])
    else
        bar(monoFrequencyTable(:,2))
    end
    %set the remaining axes properties
    set(gca,'XTick',...
        [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26],...
        'XTickLabel', ticks, 'XTickLabelRotation',-67);
    ylabel('Relative Frequency');
    xlabel('Letter');
    title('Monogram Frequency');
end

