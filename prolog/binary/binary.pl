shift('0', Acc, NewAcc) :- NewAcc is Acc << 1, !.
shift('1', Acc, NewAcc) :- NewAcc is Acc << 1 + 1.

binary(Str, Dec) :-
    string_chars(Str, Digits),
    foldl(shift, Digits, 0, Dec).
