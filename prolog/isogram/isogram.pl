isogram(Sentence) :-
    string_lower(Sentence, Lower),
    string_chars(Lower, Chars),
    include([In]>>char_type(In, alpha), Chars, Letters),
    sort(Letters, UniqueLetters),
    length(Letters, Length),
    length(UniqueLetters, Length).
