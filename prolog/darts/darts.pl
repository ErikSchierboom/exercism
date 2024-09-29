distance(X, Y, Distance) :- Distance is sqrt(X * X + Y * Y).

distance_score(Distance, 10) :- Distance =< 1,  !.
distance_score(Distance,  5) :- Distance =< 5,  !.
distance_score(Distance,  1) :- Distance =< 10, !.
distance_score(Distance,  0).

score(X, Y, Score) :-
    distance(X, Y, Distance),
    distance_score(Distance, Score).
