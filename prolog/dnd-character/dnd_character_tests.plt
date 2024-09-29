pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(dnd_character).

    test(ability_modifier_for_score_3_is_n4, condition(true)) :-
        modifier(3, Modifier),
        Modifier == -4.

    test(ability_modifier_for_score_4_is_n3, condition(true)) :-
        modifier(4, Modifier),
        Modifier == -3.

    test(ability_modifier_for_score_5_is_n3, condition(true)) :-
        modifier(5, Modifier),
        Modifier == -3.

    test(ability_modifier_for_score_6_is_n2, condition(true)) :-
        modifier(6, Modifier),
        Modifier == -2.

    test(ability_modifier_for_score_7_is_n2, condition(true)) :-
        modifier(7, Modifier),
        Modifier == -2.

    test(ability_modifier_for_score_8_is_n1, condition(true)) :-
        modifier(8, Modifier),
        Modifier == -1.

    test(ability_modifier_for_score_9_is_n1, condition(true)) :-
        modifier(9, Modifier),
        Modifier == -1.

    test(ability_modifier_for_score_10_is_0, condition(true)) :-
        modifier(10, 0).

    test(ability_modifier_for_score_11_is_0, condition(true)) :-
        modifier(11, 0).

    test(ability_modifier_for_score_12_is_1, condition(true)) :-
        modifier(12, 1).

    test(ability_modifier_for_score_13_is_1, condition(true)) :-
        modifier(13, 1).

    test(ability_modifier_for_score_14_is_2, condition(true)) :-
        modifier(14, 2).

    test(ability_modifier_for_score_15_is_2, condition(true)) :-
        modifier(15, 2).

    test(ability_modifier_for_score_16_is_3, condition(true)) :-
        modifier(16, 3).

    test(ability_modifier_for_score_17_is_3, condition(true)) :-
        modifier(17, 3).

    test(ability_modifier_for_score_18_is_4, condition(true)) :-
        modifier(18, 4).

    test(random_ability_is_within_range, condition(true)) :-
        length(Scores, 100),
        maplist(ability, Scores),
        maplist(between(3, 18), Scores).

    test(random_character_is_valid, condition(true)) :-
        length(Characters, 100),
        maplist(create_character, Characters),
        member(character(
            strength(Strength),
            dexterity(Dexterity),
            constitution(Constitution),
            intelligence(Intelligence),
            wisdom(Wisdom),
            charisma(Charisma),
            hitpoints(Hitpoints)), Characters),
        between(3, 18, Strength),
        between(3, 18, Dexterity),
        between(3, 18, Constitution),
        between(3, 18, Intelligence),
        between(3, 18, Wisdom),
        between(3, 18, Charisma),
        modifier(Constitution, Modifier),
        Hitpoints =:= 10 + Modifier.

:- end_tests(dnd_character).
