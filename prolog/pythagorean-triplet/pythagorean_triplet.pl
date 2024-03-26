triplet(Sum, (A, B, C)) :-
    MaxA is Sum//3,
    between(1, MaxA, A),
    MaxB is Sum//2,
    between(A, MaxB, B),
    C is Sum - A - B,
    A*A + B*B =:= C*C.

triplets(Sum, Triplets) :- 
    findall(Triplet, triplet(Sum, Triplet), Triplets).
