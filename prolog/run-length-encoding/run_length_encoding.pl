:- use_module(library(dcg/basics)).

encode(Plaintext, Ciphertext) :-
    atom_chars(Plaintext, Plainchars),
    encode_runs(Plainchars, Runs),
    maplist(encode_run, Runs, EncodedRuns),
    flatten(EncodedRuns, Cipherchars),
    atomics_to_string(Cipherchars, Ciphertext).

encode_runs([], []).
encode_runs([X], [X-1]).
encode_runs([X,X|Xs], [X-N|Ys]) :- encode_runs([X|Xs], [X-N1|Ys]), N is N1+1, !.
encode_runs([X,Y|Xs], [X-1|Ys]) :- X \= Y, encode_runs([Y|Xs], Ys), !.

encode_run(X-1, [X]) :- !.
encode_run(X-N, [N,X]) :- !.

decode(Ciphertext, Plaintext) :-
    atom_chars(Ciphertext, Cipherchars),
    decode_runs(Cipherchars, Runs),
    maplist(decode_run, Runs, DecodedRuns),
    flatten(DecodedRuns, Plainchars),
    atomics_to_string(Plainchars, Plaintext).

decode_runs([], []).
decode_runs([X|Xs], [Y-Number|Runs]) :-
    char_type(X, 'digit'),
    phrase(integer(Number), [X|Xs], [Y|Ys]),
    decode_runs(Ys, Runs),
    !.
decode_runs([X|Xs], [X-1|Runs]) :- decode_runs(Xs, Runs), !.

decode_run(X-1, [X]) :- !.
decode_run(X-N, [X|Xs]) :- N1 is N - 1, decode_run(X-N1, Xs), !.
