:- use_module(library(clpfd)).
:- use_module(library(dcg/basics)).

separator --> "-".

digit_code(Digit) --> digit(Code), { number_codes(Digit, [Code]) }.

check_digit(10) --> "X".
check_digit(Digit)  --> regular_digit(Digit).

regular_digit(Digit) --> digit_code(Digit), separator.
regular_digit(Digit) --> digit_code(Digit).

regular_digits([D1,D2,D3,D4,D5,D6,D7,D8,D9,D10]) -->
    regular_digit(D1), regular_digit(D2), regular_digit(D3), regular_digit(D4), regular_digit(D5),
    regular_digit(D6), regular_digit(D7), regular_digit(D8), regular_digit(D9), check_digit(D10).

isbn(Isbn) :-
    string_codes(Isbn, Codes),
    phrase(regular_digits(Digits), Codes),
    scalar_product([10,9,8,7,6,5,4,3,2,1], Digits, #=, Checksum),
    Checksum mod 11 #= 0,
    !.
