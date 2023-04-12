pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(zebra_puzzle).

    test(resident_who_drinks_water, condition(true)) :-
        water_drinker(Resident), Resident == norwegian.

    test(resident_who_owns_zebra, condition(true)) :-
        zebra_owner(Resident), Resident == japanese.

:- end_tests(zebra_puzzle).
