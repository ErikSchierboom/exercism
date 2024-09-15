floor(Name, Floor) :-
    Tenants = [amara, bjorn, cora, dale, emiko],
    permutation(Floors, [1, 2, 3, 4, 5]),
    nth1(1, Floors, AmaraFloor),
    nth1(2, Floors, BjornFloor),
    nth1(3, Floors, CoraFloor),
    nth1(4, Floors, DaleFloor),
    nth1(5, Floors, EmikoFloor),

    AmaraFloor \= 5,
    BjornFloor \= 1,
    CoraFloor \= 1,
    CoraFloor \= 5,
    DaleFloor > BjornFloor,
    abs(EmikoFloor - CoraFloor) > 1,
    abs(CoraFloor - BjornFloor) > 1,

    nth1(NameIndex, Tenants, Name),
    nth1(NameIndex, Floors, Floor),
    !.
