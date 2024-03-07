:- use_module(library(clpfd)).

find(List, Value, Index, Lower, Upper) :-
    Lower #=< Upper,
    MiddleIndex #= (Lower + Upper) // 2,
    nth0(MiddleIndex, List, MiddleValue),
    (MiddleValue #< Value -> find(List, Value, Index, MiddleIndex + 1, Upper);
     MiddleValue #> Value -> find(List, Value, Index, Lower, MiddleIndex - 1);
     Index = MiddleIndex, !).

find(List, Value, Index) :-
    length(List, Length),
    find(List, Value, Index, 0, Length).
