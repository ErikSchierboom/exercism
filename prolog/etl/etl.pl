transform([], []).

transform([Score-Letters|Xs], LetterScores) :-
    transform(Xs, LetterScores1),
    length(Letters, N),
    length(Scores, N),
    maplist(=(Score), Scores),
    maplist(string_lower,Letters,LowerLetters),
    maplist(atom_string,LowerLetterAtoms,LowerLetters),
    pairs_keys_values(LetterScores0,LowerLetterAtoms,Scores),
    append(LetterScores0, LetterScores1, LetterScores2),
    sort(LetterScores2, LetterScores).
