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
