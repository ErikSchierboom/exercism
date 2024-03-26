:- use_module(library(clpfd)).

latest(Scores, Latest) :- last(Scores, Latest).

personal_best(Scores, Best) :- max_list(Scores, Best).

personal_top_three(Scores, TopThree) :-
    sort(0, @>=, Scores, Sorted),
    top_three(Sorted, TopThree).

top_three([], []).
top_three([X], [X]).
top_three([X,Y], [X,Y]).
top_three([X,Y,Z|_], [X,Y,Z]).
