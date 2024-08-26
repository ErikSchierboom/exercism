valid(A, B, C) :-
    A>0, B>0, C>0,
    A+B>=C, A+C>=B, B+C>=A.

category(A, A, A, "equilateral") :- !.
category(A, A, _, "isosceles") :- !.
category(A, _, A, "isosceles") :- !.
category(_, A, A, "isosceles") :- !.
category(A, B, C, "scalene") :- A \== B, B \== C.

triangle(A, B, C, Type) :-
    valid(A, B, C),
    category(A, B, C, Type).
