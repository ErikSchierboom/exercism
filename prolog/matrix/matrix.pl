:- use_module(library(dcg/basics)).
:- use_module(library(clpfd)).

columns([Value|Values]) --> integer(Value), " ", columns(Values).
columns([Value]) --> integer(Value).

rows([Row|Rows]) --> columns(Row), "\n", rows(Rows).
rows([Row]) --> columns(Row).

parse(Matrix, Rows) :-
    string_codes(Matrix, Codes),
    phrase(rows(Rows), Codes),
    !.

row(Matrix, Y, Row) :-
    parse(Matrix, Rows),
    nth1(Y, Rows, Row).

column(Matrix, X, Column) :-
    parse(Matrix, Rows),
    transpose(Rows, Columns),
    nth1(X, Columns, Column).
