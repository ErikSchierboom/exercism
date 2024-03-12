custom_length(List, Length) :-
    custom_foldl([Acc,_,Result]>>(Result is Acc + 1), 0, List, Length).

custom_append(L1, L2, Appended) :-
    custom_foldr([El,Acc,Result]>>(Result = [El|Acc]), L1, L2, Appended).

custom_concat(List, Concatenated) :-
    custom_foldr([El,Acc,Result]>>(custom_append(El, Acc, Result)), List, [], Concatenated).

custom_reverse(List, Reversed) :-
    custom_foldl([Acc,El,Result]>>(Result = [El|Acc]), [], List, Reversed).

custom_map(Goal, List, Mapped) :-
    custom_foldr([El,Acc,Result]>>(call(Goal, El, Value), Result = [Value|Acc]), List, [], Mapped).

custom_filter(Goal, List, Filtered) :-
    custom_foldr([El,Acc,Result]>>(call(Goal, El) -> Result = [El|Acc]; Result = Acc), List, [], Filtered).

custom_foldl(_, State, [], State) :- !.
custom_foldl(Goal, State, [H|T], Folded) :-
    call(Goal, State, H, Result),
    custom_foldl(Goal, Result, T, Folded).

custom_foldr(_, [], State, State) :- !.
custom_foldr(Goal, [H|T], State, Folded) :-
    custom_foldr(Goal, T, State, Result),
    call(Goal, H, Result, Folded).
