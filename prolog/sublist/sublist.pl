sublist(Xs, Xs, equal) :- !.
sublist(Xs, Ys, sublist) :- append(_, Rest, Ys), append(Xs, _, Rest), !.
sublist(Xs, Ys, superlist) :- sublist(Ys, Xs, sublist), !.
sublist(_, _, unequal).
