valid(X, Y, Z) :- 
    X + Y > Z, X + Z > Y, Y + Z > X,
    X > 0, Y > 0, Z > 0. 

triangle(X, X, X, "equilateral") :- valid(X, X, X), !.
triangle(X, X, Y, "isosceles") :- valid(X, X, Y), !.
triangle(X, Y, X, "isosceles") :- valid(X, Y, X), !.
triangle(Y, X, X, "isosceles") :- valid(Y, X, X), !.
triangle(X, Y, Z, "scalene") :- valid(X, Y, Z), X =\= Y, Y =\= Z.
