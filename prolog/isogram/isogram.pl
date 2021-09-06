isogram(Sentence) :-
    string_lower(Sentence, Lower_sentence),
    string_chars(Lower_sentence, Chars),
    include([In]>>char_type(In, alpha), Chars, Letters),
    list_to_set(Letters, Unique_letters),
    length(Letters, X) == length(Unique_letters, X).
