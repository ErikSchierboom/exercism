:- use_module(library(clpfd)).

solve(Solution) :-
    Names = [amara, bjorn, cora, dale, emiko],
    Floors = [Amara, Bjorn, Cora, Dale, Emiko],
    Floors ins 1..5, % 1
    all_different(Floors), %2
    pairs_keys_values(Solution, Names, Floors),
    Amara #< 5, %3
    Bjorn #> 1, %4
    Cora #> 1, Cora #< 5, %5
    Dale #> Bjorn, %6
    abs(Emiko - Cora) #> 1, %7
    abs(Cora - Bjorn) #> 1, %8
    label(Floors),
    !.

floor(Name, Floor) :-
    solve(Solution),
    member(Name-Floor, Solution),
    !.
