function [ intervals ] = trigramIntervals(trigram)
    global cipherText

    %compiling a list of the locations of the trigrams
    intervals=[];
    for i = 1:length(cipherText)-2
        if cipherText(i) == trigram(1) && cipherText(i+1) == trigram(2) && cipherText(i+2) == trigram(3)
            if isempty(intervals)
                intervals = i;
            else
                intervals(length(intervals) + 1) = i - intervals(1);
            end
        end
    end
    
end

