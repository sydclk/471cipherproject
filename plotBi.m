% Author: Sydney Clark

function plotBi( numberOfBigrams, includeBigramFrequency )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    global BiFrequencyTable
    global CipherText
    global biProbability
    
    if isempty(BiFrequencyTable)
        BiFrequencyTable = findBigrams();
    end
    if isempty(biProbability)
        CreateProbabilityData();
    end
    if numberOfBigrams > 0
        TruncatedBigramTable = BiFrequencyTable(1:numberOfBigrams,:);
    else
        TruncatedBigramTable = BiFrequencyTable;
    end
    firstchar = num2cell(char(TruncatedBigramTable(:,1) + 'A'));
    secondchar = num2cell(char(TruncatedBigramTable(:,2) + 'A'));
    ticks = strcat(firstchar, secondchar);
    
    figure
    if (includeBigramFrequency)
        if numberOfBigrams > 0
            TruncatedBiProbability = biProbability(1:numberOfBigrams,:);
        else
            TruncatedBiProbability = biProbability;
        end
        ticks2 = num2cell(char(TruncatedBiProbability(:,1)+'a'));
        ticks3 = num2cell(char(TruncatedBiProbability(:,2)+'a'));
        ticks3 = strcat(ticks2, ticks3);
        ticks = strcat(ticks, ticks3);
        bar([TruncatedBigramTable(:,3) TruncatedBiProbability(:,3)])
    else
        bar(TruncatedBigramTable(:,3))
    end
    % Set the remaining axes properties
    set(gca,'XTick',...
        1:length(TruncatedBigramTable),...
        'XTickLabel', ticks, 'XTickLabelRotation',-67);
    ylabel('Relative Frequency');
    xlabel('Letters');
    title('Bigram Frequency');

end

