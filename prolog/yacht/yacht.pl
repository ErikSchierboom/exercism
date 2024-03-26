:- use_module(library(clpfd)).

score([X, X, X, X, X], yacht, 50) :- !.

score(Dice, little_straight, 30) :- sort(Dice, [1, 2, 3, 4, 5]), !.
score(Dice, big_straight, 30) :- sort(Dice, [2, 3, 4, 5, 6]), !.

score(Dice, ones, Score)   :- singles_score(Dice, 1, Score), !.
score(Dice, twos, Score)   :- singles_score(Dice, 2, Score), !.
score(Dice, threes, Score) :- singles_score(Dice, 3, Score), !.
score(Dice, fours, Score)  :- singles_score(Dice, 4, Score), !.
score(Dice, fives, Score)  :- singles_score(Dice, 5, Score), !.
score(Dice, sixes, Score)  :- singles_score(Dice, 6, Score), !.

score(Dice, full_house, Score) :-
    (sort(0, @=<, Dice, [X, X, Y, Y, Y]);
     sort(0, @=<, Dice, [X, X, X, Y, Y])),
    X \= Y,
    sum_list(Dice, Score), !.

score(Dice, four_of_a_kind, Score) :-
    (sort(0, @=<, Dice, [_, X, X, X, X]);
     sort(0, @=<, Dice, [X, X, X, X, _])),
    Score #= X * 4, !.

score(Dice, choice, Score) :- sum_list(Dice, Score), !.

score(_, _, 0).

singles_score(Dice, Die, Score) :-
    include(=(Die), Dice, Ones),
    sum_list(Ones, Score).
