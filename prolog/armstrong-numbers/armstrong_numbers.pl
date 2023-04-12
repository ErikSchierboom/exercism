digit(Code, Digit) :- Digit is Code - 48.

digits(N, Digits) :-
    number_string(N, Str),
    string_codes(Str, Codes),
    maplist(digit, Codes, Digits).

armstrong_sum(_, [], 0).
armstrong_sum(NumberOfDigits, [Digit|Tail], Sum) :-
    armstrong_sum(NumberOfDigits, Tail, TailSum),
    pow(Digit, NumberOfDigits, Pow),
    Sum is TailSum + Pow, !.

armstrong_number(N) :-
    digits(N, Digits),
    length(Digits, NumberOfDigits),
    armstrong_sum(NumberOfDigits, Digits, N).
