:- use_module(library(clpfd)).

bit_set(Number, Index) :- Number /\ 1 << Index #\= 0.

encoded_command(Encoded, Index, Goal, Acc, Result) :- bit_set(Encoded, Index), call(Goal, Acc, Result), !.
encoded_command(_, _, _, Acc, Acc).

append_command(Command, Acc, Result) :- append(Acc, [Command], Result).

commands(Encoded, Commands) :-
    IndividualCommands = [
        encoded_command(Encoded, 0, append_command(wink)),
        encoded_command(Encoded, 1, append_command(double_blink)),
        encoded_command(Encoded, 2, append_command(close_your_eyes)),
        encoded_command(Encoded, 3, append_command(jump)),
        encoded_command(Encoded, 4, reverse)
    ],
    foldl(call, IndividualCommands, [], Commands).
