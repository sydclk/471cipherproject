function [v] = gcdList( n )

    %matlab function only takes 2 numbers
    %the vigenere needs gcd of list of numbers
    %compute gcd of the last pair of numbers
    %gcd of the next number in the list and the 
    %three numbers: A, B, C
    %take gcd(B, C)
    %then compute gcd(A, gcd(B, C)) for all in n array
    v = gcd(n(length(n)-1), n(length(n)));
    for I = length(n)-2:-1:2
        v = gcd(n(I), v);
    end

end

