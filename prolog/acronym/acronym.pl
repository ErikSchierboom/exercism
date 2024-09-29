letters([], _, []).
letters([Letter|Rest], Previous, [Letter|Letters]) :-    
    char_type(Letter, upper),
    member(Previous, [' ', '-', '_']),
    letters(Rest, Letter, Letters), !.
letters([Letter|Rest], _, Letters) :-
    letters(Rest, Letter, Letters).

abbreviate(Sentence, Acromym) :-
    string_upper(Sentence, UpperSentence),
    string_chars(UpperSentence, Chars),
    letters(Chars, ' ', Letters),
    string_chars(Acromym, Letters).
