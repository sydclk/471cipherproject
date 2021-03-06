%Author: Sydney Clark

function createProbabilityData()
    global monoProbability biProbability  triProbability wordProbability
   %data from praticalcryptography.com
monoProbability = [4 529117365; 19 390965105; 0 374061888; 14 326627740; 8 320410057; 13 313720540;
        18 294300210; 17 277000841; 7 216768975; 11 183996130; 3 169330528; 2 138416451;
        20 117295780; 12 110504544; 5 95422055; 6 91258980; 15 90376747; 22 79843664; 
        24 75294515; 1 70195826; 21 46337161; 10 35373464; 9 9613410; 23 8369915; 
        25 4975847; 16 4550166];
y = sum(monoProbability);
monoProbability(:,2) = monoProbability(:,2) / y(2);
%monoProb matrix is their letter frequencies (first is letter frequency,
%second is normalized frequency)
biProbability = [
    'T' - 'A' 'H' - 'A' .0271; 'E' - 'A' 'N' - 'A' .0113; 'N' - 'A' 'G' - 'A' .0089;
    'H' - 'A' 'E' - 'A' .0233; 'A' - 'A' 'T' - 'A' .0112; 'A' - 'A' 'L' - 'A' .0088;
    'I' - 'A' 'N' - 'A' .0203; 'E' - 'A' 'D' - 'A' .0108; 'I' - 'A' 'T' - 'A' .0088;
    'E' - 'A' 'R' - 'A' .0178; 'N' - 'A' 'D' - 'A' .0107; 'A' - 'A' 'S' - 'A' .0087;
    'A' - 'A' 'N' - 'A' .0161; 'T' - 'A' 'O' - 'A' .0107; 'I' - 'A' 'S' - 'A' .0086;
    'R' - 'A' 'E' - 'A' .0141; 'O' - 'A' 'R' - 'A' .0106; 'H' - 'A' 'A' - 'A' .0083;
    'E' - 'A' 'S' - 'A' .0132; 'E' - 'A' 'A' - 'A' .0100; 'E' - 'A' 'T' - 'A' .0076;
    'O' - 'A' 'N' - 'A' .0132; 'T' - 'A' 'I' - 'A' .0099; 'S' - 'A' 'E' - 'A' .0073;
    'S' - 'A' 'T' - 'A' .0125; 'A' - 'A' 'R' - 'A' .0098; 'O' - 'A' 'U' - 'A' .0072;
    'N' - 'A' 'T' - 'A' .0117; 'T' - 'A' 'E' - 'A' .0098; 'O' - 'A' 'F' - 'A' .0071];
biProbability = sortrows(biProbability, -3);
% thier data, their letters converted into letter codes by subtracting A
% from everything, all frequencies are normalized (on website frequencies
% are sorted columnar, but sortrows puts them in order (row by row instead
% of column)
triProbability = [
    'T' - 'A' 'H' - 'A' 'E' - 'A' .0181;        'E' - 'A' 'R' - 'A' 'E' - 'A' .0031;        'H' - 'A' 'E' - 'A' 'S' - 'A' .0024;
    'A' - 'A' 'N' - 'A' 'D' - 'A' .0073;        'T' - 'A' 'I' - 'A' 'O' - 'A' .0031;        'V' - 'A' 'E' - 'A' 'R' - 'A' .0024;
    'I' - 'A' 'N' - 'A' 'G' - 'A' .0072;        'T' - 'A' 'E' - 'A' 'R' - 'A' .0030;        'H' - 'A' 'I' - 'A' 'S' - 'A' .0024;
    'E' - 'A' 'N' - 'A' 'T' - 'A' .0042;        'E' - 'A' 'S' - 'A' 'T' - 'A' .0028;        'O' - 'A' 'F' - 'A' 'T' - 'A' .0022;
    'I' - 'A' 'O' - 'A' 'N' - 'A' .0042;        'E' - 'A' 'R' - 'A' 'S' - 'A' .0028;        'I' - 'A' 'T' - 'A' 'H' - 'A' .0021;
    'H' - 'A' 'E' - 'A' 'R' - 'A' .0036;        'A' - 'A' 'T' - 'A' 'I' - 'A' .0026;        'F' - 'A' 'T' - 'A' 'H' - 'A' .0021;
    'F' - 'A' 'O' - 'A' 'R' - 'A' .0034;        'H' - 'A' 'A' - 'A' 'T' - 'A' .0026;        'S' - 'A' 'T' - 'A' 'H' - 'A' .0021;
    'T' - 'A' 'H' - 'A' 'A' - 'A' .0033;        'A' - 'A' 'T' - 'A' 'E' - 'A' .0025;        'O' - 'A' 'T' - 'A' 'H' - 'A' .0021;
    'N' - 'A' 'T' - 'A' 'H' - 'A' .0033;        'A' - 'A' 'L' - 'A' 'L' - 'A' .0025;        'R' - 'A' 'E' - 'A' 'S' - 'A' .0021;
    'I' - 'A' 'N' - 'A' 'T' - 'A' .0032;        'E' - 'A' 'T' - 'A' 'H' - 'A' .0024;        'O' - 'A' 'N' - 'A' 'T' - 'A' .0020];
triProbability = sortrows(triProbability, -4);
%same thing as biProbability, column -> rows, subtract A for letter codes
wordProbability = {
     'THE' .0642;    'ON' .0078;           'ARE' .0047;
      'OF' .0276;  'WITH' .0075;          'THIS' .0042;
     'AND' .0275;    'HE' .0075;             'I' .0041;
      'TO' .0267;    'IT' .0074;           'BUT' .0040;
       'A' .0243;    'AS' .0071;          'HAVE' .0039;
      'IN' .0231;    'AT' .0058;            'AN' .0037;
      'IS' .0112;   'HIS' .0055;           'HAS' .0035;
     'FOR' .0101;    'BY' .0051;           'NOT' .0034;
    'THAT' .0092;    'BE' .0048;          'THEY' .0033;
     'WAS' .0088;  'FROM' .0047;            'OR' .0030;};
 % left unused but here just in case for future 
end

