:- use_module(library(dcg/basics)).
:- set_prolog_flag(double_quotes, chars).

vowel --> [C], { member(C, "aeiou") }.
consonant --> [C], { \+ member(C, "aeiou") }.

consonants(N) --> consonant, consonants(M), { N is M + 1 }.
consonants(0) --> [].

drop_first(0) --> (vowel | "xr" | "yt"), !, remainder(_).
drop_first(1) --> nonblank(_), "y", !.
drop_first(1) --> "y", ! , remainder(_).
drop_first(N) --> consonants(N), "y", ! , remainder(_).
drop_first(N) --> consonants(M), "qu", { N is M + 2 }, ! , remainder(_).
drop_first(N) --> consonants(N), !, remainder(_).

rotate(Chars, N, Rotated) :-
    length(Begin, N),
    append(Begin, End, Chars),
    append(End, Begin, Rotated).

pig_latinify(English, PigLatin) :-
    string_chars(English, Chars),
    phrase(drop_first(N), Chars),
    rotate(Chars, N, Rotated),
    append(Rotated, "ay", PigLatinChars),
    string_chars(PigLatin, PigLatinChars).

translate(English, PigLatin) :-
    split_string(English, " ", "", Words),
    maplist(pig_latinify, Words, PigLatinWords),
    atomics_to_string(PigLatinWords, ' ', PigLatin),
    !.
