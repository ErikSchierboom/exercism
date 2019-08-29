valid(A, B, C, _) :-
    A>0,
    B>0,
    C>0,
    A+B>=C,
    A+C>=B,
    B+C>=A.

equilateral(A, A, A, "equilateral").

isosceles(A, A, _, "isosceles").
isosceles(A, _, A, "isosceles").
isosceles(_, A, A, "isosceles").

scalene(_, _, _, "scalene").

triangle(A, B, C, Type) :-
    valid(A, B, C, Type),
    (   equilateral(A, B, C, Type),
        !
    ;   isosceles(A, B, C, Type),
        !
    ;   scalene(A, B, C, Type)
    ).