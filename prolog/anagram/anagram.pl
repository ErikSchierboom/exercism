string_lower_chars(Word, Chars) :-
    string_lower(Word, LowerWord),
    string_chars(LowerWord, Chars).

normalize(Word, Normalized) :-
    string_lower_chars(Word, Chars),
    msort(Chars, Normalized).

different_words(Word, Option) :-
    string_lower_chars(Word, WordChars),
    string_lower_chars(Option, OptionChars),
    WordChars \== OptionChars.

is_anagram(Word, Option) :-
    different_words(Word, Option),
    normalize(Word, NormalizedWord),
    normalize(Option, NormalizedOption),
    NormalizedWord == NormalizedOption.

anagram(Word, Options, Matching) :-
    include(is_anagram(Word), Options, Matching).
