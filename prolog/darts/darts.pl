distance(X, Y, Distance) :- Distance is sqrt(X * X + Y * Y).

score(X, Y, 10) :- distance(X, Y, Distance), Distance =< 1,  !.
score(X, Y, 5)  :- distance(X, Y, Distance), Distance =< 5,  !.
score(X, Y, 1)  :- distance(X, Y, Distance), Distance =< 10, !.
score(_, _, 0).
