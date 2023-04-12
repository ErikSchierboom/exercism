pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(two_fer).

test(no_name_given, condition(true)) :-
    two_fer(Dialogue),
    Dialogue == "One for you, one for me.".

test(a_name_given, condition(pending)) :-
    two_fer("Alice", Dialogue),
    Dialogue == "One for Alice, one for me.".

test(another_name_given, condition(pending)) :-
    two_fer("Bob", Dialogue),
    Dialogue == "One for Bob, one for me.".

:- end_tests(two_fer).
