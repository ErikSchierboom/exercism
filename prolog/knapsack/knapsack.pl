:- use_module(library(clpfd)).

maximum_value([], Capacity, 0) :- !.

maximum_value(Items, Capacity, Value) :-
    length(Items, N),
    length(Amounts, N),
    Amounts ins 0..1,
    maplist(arg(1), Items, Weights),
    maplist(arg(2), Items, Values),
    sum(Amounts, #>, 0),
    scalar_product(Weights, Amounts, #=<, Capacity),
    scalar_product(Values, Amounts, #=, Value),
    labeling([max(Value)], Amounts),
    !.
