function [v] = GCDList( n )

    v = gcd(n(length(n)-1), n(length(n)));
    for I = length(n)-2:-1:2
        v = gcd(n(I), v);
    end

end

