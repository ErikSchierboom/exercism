digit([" _ ", "| |", "|_|", "   "], '0') :- !.
digit(["   ", "  |", "  |", "   "], '1') :- !.
digit([" _ ", " _|", "|_ ", "   "], '2') :- !.
digit([" _ ", " _|", " _|", "   "], '3') :- !.
digit(["   ", "|_|", "  |", "   "], '4') :- !.
digit([" _ ", "|_ ", " _|", "   "], '5') :- !.
digit([" _ ", "|_ ", "|_|", "   "], '6') :- !.
digit([" _ ", "  |", "  |", "   "], '7') :- !.
digit([" _ ", "|_|", "|_|", "   "], '8') :- !.
digit([" _ ", "|_|", " _|", "   "], '9') :- !.
digit(_, '?').

parse_row(Row, Cols-Next) :-
    sub_string(Row, 0, 3, After, Cols),
    sub_string(Row, 3, After, _, Next).

digits(["","","",""], []) :- !.
digits(Rows, [Digit|Digits]) :-
    maplist(parse_row, Rows, ParsedRows),
    pairs_keys_values(ParsedRows, Cols, NextRows),
    digit(Cols, Digit),
    digits(NextRows, Digits).

parse_line(Line, Parsed) :-
    digits(Line, Digits),
    string_chars(Parsed, Digits).

combine(Part, "", Part) :- !.
combine(Part, Acc, Result) :- format(string(Result), "~s,~s", [Acc, Part]).

parse_lines(Lines, Parsed) :-
    maplist(parse_line, Lines, ParsedLines),
    foldl(combine, ParsedLines, "", Parsed).

lines([], []) :- !.
lines(Input, [Line|Lines]) :-
    append(Line, Rest, Input),
    length(Line, 4),
    lines(Rest, Lines).

valid([X|Xs]) :-
    length([X|Xs], Rows),
    string_length(X, Cols),
    Rows mod 4 =:= 0,
    Cols mod 3 =:= 0.

convert(Input, Output) :-
    valid(Input),
    lines(Input, Lines),
    parse_lines(Lines, Output), !.
 