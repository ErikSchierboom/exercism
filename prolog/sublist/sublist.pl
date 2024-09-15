sublist(Xs, Xs, equal) :- !.
sublist(Xs, Ys, sublist) :- append(Prefix, _, Ys), append(_, Xs, Prefix), !.
sublist(Xs, Ys, superlist) :- sublist(Ys, Xs, sublist), !.
sublist(_, _, unequal).
