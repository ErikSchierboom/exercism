:- use_module(library(clpfd)).

letters(Letters) :- string_chars("ABCDEFGHIJKLMNOPQRSTUVWXYZ", Letters).

letter_index(Letter, Index) :-
    letters(Letters),
    nth1(Index, Letters, Letter), !.

diamond(Letter, Rows) :-
    top_half(Letter, TopHalf),
    reverse(TopHalf, [_|BottomHalf]),
    append(TopHalf, BottomHalf, Rows).

top_half(Letter, TopHalf) :-
    letters(Letters),
    letter_index(Letter, NumberOfLetters),
    append(TopHalfLetters, _, Letters),
    length(TopHalfLetters, NumberOfLetters),
    maplist(top_row(NumberOfLetters), TopHalfLetters, TopHalf), !.

top_row(NumberOfLetters, Letter, Row) :-
    letter_index(Letter, LetterIdx),
    Width #= NumberOfLetters * 2 - 1,
    FirstLetterIdx #= NumberOfLetters - LetterIdx + 1,
    SecondLetterIdx #= NumberOfLetters + LetterIdx - 1,
    findall(C, (between(1, Width, I), (I == FirstLetterIdx -> C = Letter; I == SecondLetterIdx -> C = Letter; C = ' ')), Chars),
    string_chars(Row, Chars).
