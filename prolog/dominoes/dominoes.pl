rotate(L,N,A) :- length(P,N), append(P,S,L), append(S,P,A).

rotations(L, C) :- length(L,N), M is N-1, between(0,M,B), rotate(L,B,C).

chain([(L1,X),(X,R1)|T], [(L1,R1)|T]).
chain([(L1,X),(L2,X)|T], [(L1,L2)|T]).

can_chain([]).
can_chain([(X,X)]).
can_chain([H|T]) :-
    rotations(T, R),
    chain([H|R], C),
    can_chain(C), !.
