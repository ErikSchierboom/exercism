:- use_module(library(clpfd)).

modifier(Score, Modifier) :-
    Modifier #= div(Score - 10, 2).

roll(Score) :- random(1, 7, Score).

ability(Score) :-
    length(Scores, 4),
    maplist(roll, Scores),
    sort(0, @=<, Scores, [_|Sorted]),
    sum_list(Sorted, Score).

create_character(Character) :-
    Character = character(
        strength(Strength),
        dexterity(Dexterity),
        constitution(Constitution),
        intelligence(Intelligence),
        wisdom(Wisdom),
        charisma(Charisma),
        hitpoints(Hitpoints)
    ),
    maplist(ability, [Strength, Dexterity, Constitution, Intelligence, Wisdom, Charisma]),
    modifier(Constitution, Modifier),
    Hitpoints #= 10 + Modifier.
