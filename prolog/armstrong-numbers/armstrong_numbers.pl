digit(Code, Digit) :- number_codes(Digit, [Code]).
digits(N, Digits) :- number_codes(N, Codes), maplist(digit, Codes, Digits).

armstrong_sum(N, Sum) :-
    digits(N, Digits),
    length(Digits, NumDigits),
    maplist([Digit, Pow]>>(Pow is Digit ^ NumDigits), Digits, Powers),
    sum_list(Powers, Sum).

armstrong_number(N) :- armstrong_sum(N, N).
