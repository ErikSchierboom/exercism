:- use_module(library(clpfd)).
:- use_module(library(dcg/basics)).

digits_blank([]) --> [].
digits_blank(Digits) --> blank, digits_blank(Digits).
digits_blank([D|Digits]) --> digit(C), { atom_number(C, D) }, digits_blank(Digits).

multiplier_even --> [1], multiplier_odd.
multiplier_even --> [].

multiplier_odd --> [2], multiplier_even.
multiplier_odd --> [].

multipliers(Digits, Multipliers) :-
    length(Digits, Length),
    length(Multipliers, Length),
    phrase(multiplier_even, Multipliers), !.

double(Digit, 1, Digit).
double(Digit, 2, Doubled) :- Digit #< 5 -> Doubled #= Digit * 2; Doubled #= Digit * 2 - 9.

double(Digits, Doubled) :-
    reverse(Digits, Reversed),
    multipliers(Reversed, Multipliers),
    maplist(double, Reversed, Multipliers, Doubled).

checksum(Digits, Checksum) :-
    double(Digits, Doubled),
    sum_list(Doubled, Checksum).

valid(String) :-
    string_chars(String, Chars),
    phrase(digits_blank(Digits), Chars),
    length(Digits, Length),
    Length #> 1,
    checksum(Digits, Checksum),
    Checksum mod 10 #= 0,
    !.
