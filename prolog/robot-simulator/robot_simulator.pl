:- use_module(library(clpfd)).

create(X, Y, Direction, Robot) :-
    Robot = robot(coordinate(x(X), y(Y)), direction(Direction)).

left(north, west).
left(east, north).
left(south, east).
left(west, south).

right(north, east).
right(east, south).
right(south, west).
right(west, north).

advance(north, X, Y,    X, NewY) :- NewY #= Y + 1.
advance(east,  X, Y, NewX,    Y) :- NewX #= X + 1.
advance(south, X, Y,    X, NewY) :- NewY #= Y - 1.
advance(west,  X, Y, NewX,    Y) :- NewX #= X - 1.

instruction('L', Robot, Updated) :-
    create(X, Y, Direction, Robot),
    left(Direction, NewDirection),
    create(X, Y, NewDirection, Updated).

instruction('R', Robot, Updated) :-
    create(X, Y, Direction, Robot),
    right(Direction, NewDirection),
    create(X, Y, NewDirection, Updated).

instruction('A', Robot, Updated) :-
    create(X, Y, Direction, Robot),
    advance(Direction, X, Y, NewX, NewY),
    create(NewX, NewY, Direction, Updated).

move(Robot, Instructions, Moved) :-
    string_chars(Instructions, Chars),
    foldl(instruction, Chars, Robot, Moved).
