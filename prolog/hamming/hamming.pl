same(K-V) :- K == V.

hamming_distance(Str1, Str2, Dist) :-
    string_chars(Str1, Str1Chars),
    string_chars(Str2, Str2Chars),
    pairs_keys_values(Pairs, Str1Chars, Str2Chars),
    exclude(same, Pairs, Different),
    length(Different, Dist).
