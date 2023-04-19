roman_numeral("M", 1000).
roman_numeral("CM", 900).
roman_numeral("D",  500).
roman_numeral("CD", 400).
roman_numeral("C",  100).
roman_numeral("XC",  90).
roman_numeral("L",   50).
roman_numeral("XL",  40).
roman_numeral("X",   10).
roman_numeral("IX",   9).
roman_numeral("V",    5).
roman_numeral("IV",   4).
roman_numeral("I",    1).

roman(0) --> "".
roman(N) --> { roman_numeral(Roman, Value), N >= Value }, Roman, { N1 is N - Value }, roman(N1).

convert(N, Numeral) :-
    phrase(roman(N), Numerals),
    string_chars(Numeral, Numerals),
    !.
