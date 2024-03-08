score(Word, Score) :-
    string_upper(Word, UpperWord),
    string_chars(UpperWord, Letters),
    maplist(letter_score, Letters, LetterScores),
    sum_list(LetterScores, Score).
 
 letter_score('A', 1).
 letter_score('E', 1).
 letter_score('I', 1).
 letter_score('O', 1).
 letter_score('U', 1).
 letter_score('L', 1).
 letter_score('N', 1).
 letter_score('R', 1).
 letter_score('S', 1).
 letter_score('T', 1).
 letter_score('D', 2).
 letter_score('G', 2).
 letter_score('B', 3).
 letter_score('C', 3).
 letter_score('M', 3).
 letter_score('P', 3).
 letter_score('F', 4).
 letter_score('H', 4).
 letter_score('V', 4).
 letter_score('W', 4).
 letter_score('Y', 4).
 letter_score('K', 5).
 letter_score('J', 8).
 letter_score('X', 8).
 letter_score('Q', 10).
 letter_score('Z', 10 ).
 