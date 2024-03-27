digits(N, Digits) :-
    number_codes(N, Codes),
    maplist([Code,Digit]>>number_codes(Digit, [Code]), Codes, Digits).

armstrong_sum(N, Sum) :-
    digits(N, Digits),
    length(Digits, NumDigits),
    aggregate(sum(Pow), Digit^Pow^(member(Digit, Digits), Pow is Digit ^ NumDigits), Sum).

armstrong_number(N) :- armstrong_sum(N, N).
