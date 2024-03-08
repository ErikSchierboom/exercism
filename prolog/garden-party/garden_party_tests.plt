pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(garden_party).

    test(aisha_beverage, condition(true)) :-
        beverage(aisha, Beverage),
        Beverage == kombucha.

    test(emma_dish, condition(true)) :-
        dish(emma, Dish),
        Dish == biryani.

    test(mei_dish, condition(true)) :-
        dish(mei, Dish),
        Dish == pad_thai.

    test(winona_dish, condition(true)) :-
        dish(winona, Dish),
        Dish == frybread.

    test(winona_beverage, condition(true)) :-
        beverage(winona, Beverage),
        Beverage == tonic.

:- end_tests(garden_party).
