function plotBi( numberOfBigrams, includeBigramFrequency )
    global biFrequencyTable
    global biProbability
    
    %numberOfBigrams - the top bigrams to plot
    %includeBigramFrequency - English language frequency
    
    %this plots the bigrams in the text
    %shows the random probability line and expected probability line
    if isempty(biProbability)
        createProbabilityData();
    end
    if numberOfBigrams > 0
        truncatedBigramTable = biFrequencyTable(1:numberOfBigrams,:);
    else
        truncatedBigramTable = biFrequencyTable;
    end
    firstchar = num2cell(char(truncatedBigramTable(:,1) + 'A'));
    secondchar = num2cell(char(truncatedBigramTable(:,2) + 'A'));
    ticks = strcat(firstchar, secondchar);
    
    figure
    if (includeBigramFrequency)
        if numberOfBigrams > 0
            truncatedBiProbability = biProbability(1:numberOfBigrams,:);
        else
            truncatedBiProbability = biProbability;
        end
        ticks2 = num2cell(char(truncatedBiProbability(:,1)+'a'));
        ticks3 = num2cell(char(truncatedBiProbability(:,2)+'a'));
        ticks3 = strcat(ticks2, ticks3);
        ticks = strcat(ticks, ticks3);
        bar([truncatedBigramTable(:,3) truncatedBiProbability(:,3)])
    else
        bar(truncatedBigramTable(:,3))
    end
    %set the remaining axes properties
    set(gca,'XTick',...
        1:length(truncatedBigramTable),...
        'XTickLabel', ticks, 'XTickLabelRotation',-67);
    ylabel('Relative Frequency');
    xlabel('Letters');
    title('Bigram Frequency');

end

