binary(Str, Dec) :- string_chars(Str, Digits), foldl(binary, Digits, 0, Dec).

binary('0', Acc, NewAcc) :- NewAcc is Acc << 1, !.
binary('1', Acc, NewAcc) :- NewAcc is Acc << 1 + 1.
