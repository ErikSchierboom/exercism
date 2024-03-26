:- use_module(library(clpfd)).

win([[Player, _, _], [_, Player, _], [_, _, Player]], Player).
win([[_, _, Player], [_, Player, _], [Player, _, _]], Player).
win([[Player, Player, Player], _, _], Player).
win([_, [Player, Player, Player], _], Player).
win([_, _, [Player, Player, Player]], Player).
win([[Player, _, _], [Player, _, _], [Player, _, _]], Player).
win([[_, Player, _], [_, Player, _], [_, Player, _]], Player).
win([[_, _, Player], [_, _, Player], [_, _, Player]], Player).

draw(Rows) :- flatten(Rows, Cells), \+ member(' ', Cells), !.

valid(Rows) :- 
    flatten(Rows, Cells),
    include(=('X'), Cells, Xs), length(Xs, XsCount),
    include(=('O'), Cells, Os), length(Os, OsCount),
    (XsCount #= OsCount; XsCount #= OsCount + 1),
    \+ (win(Rows, 'X'), win(Rows, 'O')), !.

state(Board, Result) :-
    maplist(string_chars, Board, Rows),
    valid(Rows),
    (win(Rows, 'X') -> Result = win;
    (win(Rows, 'O') -> Result = win;
    (draw(Rows)     -> Result = draw;
                       Result = ongoing))).
