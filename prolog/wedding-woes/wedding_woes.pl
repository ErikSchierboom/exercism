chatty(gustavo).
chatty(valeria).

likes(esteban, malena).
likes(malena, esteban).
likes(gustavo, valeria).

pairing(First, Second) :- likes(First, Second), likes(Second, First), !.
pairing(First, Second) :- (chatty(First); chatty(Second)), !.
seating(A, B, C, D, E) :- pairing(A, B), pairing(B, C), pairing(C, D), pairing(D, E), pairing(E, A).

