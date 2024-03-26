:- use_module(library(clpfd)).

value([Color1, Color2|_], Value) :-
    color_code(Color1, Tens),
    color_code(Color2, Digit),
    Value #= Tens * 10 + Digit.

color_code(Color, Code) :-
    colors(Colors),
    nth0(Code, Colors, Color), !.

colors(Colors) :-
    Colors = [
        "black",
        "brown",
        "red",
        "orange",
        "yellow",
        "green",
        "blue",
        "violet",
        "grey",
        "white"
    ].
