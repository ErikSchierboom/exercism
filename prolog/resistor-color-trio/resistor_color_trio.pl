:- use_module(library(clpfd)).

unit_quantity(Value, Quantity, "gigaohms") :-
    Value #> 1000000000, Quantity #= Value // 1000000000, !.

unit_quantity(Value, Quantity, "megaohms") :-
    Value #> 1000000, Quantity #= Value // 1000000, !.

unit_quantity(Value, Quantity, "kiloohms") :-
    Value #> 1000, Quantity #= Value // 1000, !.

unit_quantity(Value, Value, "ohms").

label(Colors, Label) :-
    value(Colors, Value),
    unit_quantity(Value, Quantity, Unit),
    format(string(Label), "~d ~w", [Quantity, Unit]).

value([Color1, Color2, Color3|_], Value) :-
    color_code(Color1, Tens),
    color_code(Color2, Digit),
    color_code(Color3, Zeros),
    Value #= (Tens * 10 + Digit) * (10 ^ Zeros).

color_code(Color, Code) :-
    colors(Colors),
    nth0(Code, Colors, Color), !.

colors(Colors) :-
    Colors = ["black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"].
