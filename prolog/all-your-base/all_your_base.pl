:- use_module(library(clpfd)).

decimal_base(_, [], Decimal, Decimal) :- !.
decimal_base(Base, [Digit|Digits], Acc, Decimal) :-
    MaxDigit #= Base - 1,
    Digit in 0..MaxDigit,
    NewAcc #= Acc * Base + Digit,
    decimal_base(Base, Digits, NewAcc, Decimal).

decimal_base(_, [0], 0) :- !.
decimal_base(Base, Digits, Decimal) :- decimal_base(Base, Digits, 0, Decimal).

rebase(InputBase, InputDigits, OutputBase, OutputDigits) :-
    InputBase #>= 2, OutputBase #>= 2,
    decimal_base(InputBase, InputDigits, Decimal),
    decimal_base(OutputBase, OutputDigits, Decimal).
