:- use_module(library(dcg/basics)).
:- set_prolog_flag(double_quotes, chars).

normalize(Chars, Normalized) :-
    string_chars(Word, Chars),
    string_lower(Word, Normalized).

alnum(C) --> [C], { char_type(C, alnum) }.
non_alnum --> [C], { \+ char_type(C, alnum) }.

non_word --> non_alnum, non_word.
non_word --> non_alnum.

word([C,'\''|Cs]) --> alnum(C), "'", word(Cs).
word([C|Cs]) --> alnum(C), word(Cs).
word([C]) --> alnum(C).

words([Word|Words]) --> word(Word), words(Words).
words([Word]) --> word(Word).
words(Words) --> non_word, words(Words).
words([]) --> [].

word_count(Sentence, Tally) :-
    string_chars(Sentence, Chars),
    phrase(words(Words), Chars),
    maplist(normalize, Words, Normalized),
    tally(Normalized, Tally),
    !.

tally(L, C) :- aggregate(set(W-N), aggregate(count, member(W, L), N), C).
