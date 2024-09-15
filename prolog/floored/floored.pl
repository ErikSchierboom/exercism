:- use_module(library(clpfd)).

floor(Name, Floor) :-
    Names = [amara, bjorn, cora, dale, emiko],
    Floors = [Amara, Bjorn, Cora, Dale, Emiko],
    
    Floors ins 1..5,
    all_different(Floors),
    Amara #< 5,
    Bjorn #> 1,
    Cora in 2..4,
    Dale #> Bjorn,
    abs(Emiko - Cora) #> 1,
    abs(Cora - Bjorn) #> 1,

    label(Floors),
    pairs_keys_values(TenantFloors, Names, Floors),
    member(Name-Floor, TenantFloors),
    !.