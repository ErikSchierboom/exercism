create_set(set([])) :- !.
create_set(Data, set(Sorted)) :- sort(Data, Sorted).

add(Value, set(Data), Added) :- create_set([Value|Data], Added).

is_empty(set([])).

in_set(Value, set(Data)) :- member(Value, Data), !.
is_subset(set(Data1), Set2) :- maplist([Data]>>(in_set(Data, Set2)), Data1), !.
is_disjoint(set(Data1), Set2) :- maplist([Data]>>(\+ in_set(Data, Set2)), Data1), !.

difference(set(Data1), Set2, Difference) :- 
    exclude([Data]>>(in_set(Data, Set2)), Data1, Elements),
    create_set(Elements, Difference).

intersection(set(Data1), Set2, Intersection) :-
    include([Data]>>(in_set(Data, Set2)), Data1, Elements),
    create_set(Elements, Intersection).

union(set(Data1), set(Data2), Union) :-
    append(Data1, Data2, Data),
    create_set(Data, Union).
