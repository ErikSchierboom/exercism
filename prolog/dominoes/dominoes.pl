chain((L1,X),(X,R1), (L1,R1)).
chain((L1,X),(L2,X), (L1,L2)).

can_chain([]).
can_chain([(X,X)]).
can_chain([Stone|Dominoes]) :-
    select(Domino,Dominoes,Rest),
    chain(Stone,Domino,NewStone),
    can_chain([NewStone|Rest]), !.
