:- set_prolog_flag(double_quotes, chars).

score(Word, Score) :-
    string_upper(Word, UpperWord),
    string_chars(UpperWord, Letters),
    maplist(letter_score, Letters, LetterScores),
    sum_list(LetterScores, Score).
 
letter_score(Letter, 1)  :- member(Letter, "AEIOULNRST"), !.
letter_score(Letter, 2)  :- member(Letter, "DG"), !.
letter_score(Letter, 3)  :- member(Letter, "BCMP"), !.
letter_score(Letter, 4)  :- member(Letter, "FHVWY"), !.
letter_score(Letter, 5)  :- member(Letter, "K"), !.
letter_score(Letter, 8)  :- member(Letter, "JX"), !.
letter_score(Letter, 10) :- member(Letter, "QZ"), !.
