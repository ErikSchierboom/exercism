:- use_module(library(dcg/basics)).
:- set_prolog_flag(double_quotes, chars).

non_digit --> [C], { \+ char_type(C, digit) }.
non_digits --> non_digit, non_digits.
non_digits --> [].

leading_digit(C) --> digit(C), { \+ member(C, "01") }.
country_code --> non_digits, "1", non_digits.
area_code([C1,C2,C3]) --> non_digits, leading_digit(C1), digit(C2), digit(C3), non_digits, !.
exchange_code([C1,C2,C3]) --> non_digits, leading_digit(C1), digit(C2), digit(C3), non_digits, !.
subscriber_number([C1,C2,C3,C4]) --> non_digits, digit(C1), digit(C2), digit(C3), digit(C4), non_digits, !.

international_phone_number(Number) --> country_code, national_phone_number(Number).
national_phone_number(Number) -->
    area_code(Area),
    exchange_code(Exchange),
    subscriber_number(Subscriber),
    { append(Area, Exchange, Temp), append(Temp, Subscriber, Number) }.
phone_number(Number) --> international_phone_number(Number) | national_phone_number(Number).

cleanup(Input, Cleaned) :-
    string_chars(Input, Chars),
    phrase(phone_number(NumberChars), Chars),
    length(NumberChars, 10),
    string_chars(Cleaned, NumberChars), !.
