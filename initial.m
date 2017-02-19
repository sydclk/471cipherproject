function  initial()
 global monoFrequencyTable
 global monoProbability
 
 %attempts to determine the type of cipher given the ciphertext has been
 %loaded
 
 %creates probability data if monoProb variable is empty
 if isempty(monoProbability)
     createProbabilityData();
 end

 %if IoC is around 0.065 the distribution looks like English
 %0.038 is random characters (0.055 is chosen for threshold)
 if icTest(1) > 0.055
     %permutation or substitution or shift
     %shiftTest returns another IoC value and the shift amount that
     %corresponds to that value
     %a small value of shiftResult means it is not a shift or permutation,
     %and hence must be a substitution by elimination
     [shiftResult, shiftAmount] = shiftTest();
     if shiftResult > 0.055
         %otherwise, if shiftAmount = 0, then E is the most frequent, T is
         %second, etc. and letters follow expected frequency distribution,
         %which means the cipher must be permutation
         if shiftAmount == 0
             fprintf('permutation cipher\n');
         %if there is a shiftAmount, the cipher is a shift cipher with
         %shiftAmount of shifting
         else
             fprintf('shift cipher with shift %d\n', shiftAmount);
         end
     else
         fprintf('substitution cipher\n');
     end
 else
        %if IoC for single character was small value, the cipher is either
        %Vigenere or one time pad
        %look for Vigenere cipher
     % vigenere or one time pad
     isVigenere = false;
     %tests key lengths from 2 to 20 arbitrarily, and looks for an IoC that
     %is about 0.065 according to cryptanalysis section of Vignere cipher
     %in book page 33+
     for I = 2:20
         if icTest(I) > 0.055
             fprintf('Vigenere cipher with length %d\n', I);
             isVigenere = true;
             break;
         end
     end
     %if IoC does have sufficiently high value, the cipher must be a one
     %time pad, based on elimination
     if isVigenere == false
         fprintf('One time pad\n');
     end
 end

end

