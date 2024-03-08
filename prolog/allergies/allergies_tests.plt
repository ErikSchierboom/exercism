pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(allergies).

    test(eggs_not_allergic_to_anything, [fail, condition(true)]) :-
        allergic_to(0, eggs).

    test(allergic_only_to_eggs, condition(pending)) :-
        allergic_to(1, eggs).

    test(allergic_to_eggs_and_something_else, condition(pending)) :-
        allergic_to(3, eggs).

    test(allergic_to_something_but_not_eggs, [fail, condition(pending)]) :-
        allergic_to(2, eggs).

    test(eggs_allergic_to_everything, condition(pending)) :-
        allergic_to(255, eggs).

    test(peanuts_not_allergic_to_anything, [fail, condition(pending)]) :-
        allergic_to(0, peanuts).

    test(allergic_only_to_peanuts, condition(pending)) :-
        allergic_to(2, peanuts).

    test(allergic_to_peanuts_and_something_else, condition(pending)) :-
        allergic_to(7, peanuts).

    test(allergic_to_something_but_not_peanuts, [fail, condition(pending)]) :-
        allergic_to(5, peanuts).

    test(peanuts_allergic_to_everything, condition(pending)) :-
        allergic_to(255, peanuts).

    test(shellfish_not_allergic_to_anything, [fail, condition(pending)]) :-
        allergic_to(0, shellfish).

    test(allergic_only_to_shellfish, condition(pending)) :-
        allergic_to(4, shellfish).

    test(allergic_to_shellfish_and_something_else, condition(pending)) :-
        allergic_to(14, shellfish).

    test(allergic_to_something_but_not_shellfish, [fail, condition(pending)]) :-
        allergic_to(10, shellfish).

    test(shellfish_allergic_to_everything, condition(pending)) :-
        allergic_to(255, shellfish).

    test(strawberries_not_allergic_to_anything, [fail, condition(pending)]) :-
        allergic_to(0, strawberries).

    test(allergic_only_to_strawberries, condition(pending)) :-
        allergic_to(8, strawberries).

    test(allergic_to_strawberries_and_something_else, condition(pending)) :-
        allergic_to(28, strawberries).

    test(allergic_to_something_but_not_strawberries, [fail, condition(pending)]) :-
        allergic_to(20, strawberries).

    test(strawberries_allergic_to_everything, condition(pending)) :-
        allergic_to(255, strawberries).

    test(tomatoes_not_allergic_to_anything, [fail, condition(pending)]) :-
        allergic_to(0, tomatoes).

    test(allergic_only_to_tomatoes, condition(pending)) :-
        allergic_to(16, tomatoes).

    test(allergic_to_tomatoes_and_something_else, condition(pending)) :-
        allergic_to(56, tomatoes).

    test(allergic_to_something_but_not_tomatoes, [fail, condition(pending)]) :-
        allergic_to(40, tomatoes).

    test(tomatoes_allergic_to_everything, condition(pending)) :-
        allergic_to(255, tomatoes).

    test(chocolate_not_allergic_to_anything, [fail, condition(pending)]) :-
        allergic_to(0, chocolate).

    test(allergic_only_to_chocolate, condition(pending)) :-
        allergic_to(32, chocolate).

    test(allergic_to_chocolate_and_something_else, condition(pending)) :-
        allergic_to(112, chocolate).

    test(allergic_to_something_but_not_chocolate, [fail, condition(pending)]) :-
        allergic_to(80, chocolate).

    test(chocolate_allergic_to_everything, condition(pending)) :-
        allergic_to(255, chocolate).

    test(pollen_not_allergic_to_anything, [fail, condition(pending)]) :-
        allergic_to(0, pollen).

    test(allergic_only_to_pollen, condition(pending)) :-
        allergic_to(64, pollen).

    test(allergic_to_pollen_and_something_else, condition(pending)) :-
        allergic_to(224, pollen).

    test(allergic_to_something_but_not_pollen, [fail, condition(pending)]) :-
        allergic_to(160, pollen).

    test(pollen_allergic_to_everything, condition(pending)) :-
        allergic_to(255, pollen).

    test(cats_not_allergic_to_anything, [fail, condition(pending)]) :-
        allergic_to(0, cats).

    test(allergic_only_to_cats, condition(pending)) :-
        allergic_to(128, cats).

    test(allergic_to_cats_and_something_else, condition(pending)) :-
        allergic_to(192, cats).

    test(allergic_to_something_but_not_cats, [fail, condition(pending)]) :-
        allergic_to(64, cats).

    test(cats_allergic_to_everything, condition(pending)) :-
        allergic_to(255, cats).

    test(no_allergies, condition(pending)) :-
        allergies(0, []).

    test(just_eggs, condition(pending)) :-
        allergies(1, [eggs]).

    test(just_peanuts, condition(pending)) :-
        allergies(2, [peanuts]).

    test(just_strawberries, condition(pending)) :-
        allergies(8, [strawberries]).

    test(eggs_and_peanuts, condition(pending)) :-
        allergies(3, [eggs, peanuts]).

    test(more_than_eggs_but_not_peanuts, condition(pending)) :-
        allergies(5, [eggs, shellfish]).

    test(lots_of_stuff, condition(pending)) :-
        allergies(248, [strawberries, tomatoes, chocolate, pollen, cats]).

    test(everything, condition(pending)) :-
        allergies(255, [eggs, peanuts, shellfish, strawberries, tomatoes, chocolate, pollen, cats]).

    test(no_allergen_score_parts, condition(pending)) :-
        allergies(509, [eggs, shellfish, strawberries, tomatoes, chocolate, pollen, cats]).

    test(no_allergen_score_parts_without_highest_valid_score, condition(pending)) :-
        allergies(257, [eggs]).

:- end_tests(allergies).
