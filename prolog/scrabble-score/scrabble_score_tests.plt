pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(scrabble_score).

    test(lowercase_letter, condition(true)) :-
        score("a", 1).

    test(uppercase_letter, condition(true)) :-
        score("A", 1).

    test(valuable_letter, condition(true)) :-
        score("f", 4).

    test(short_word, condition(true)) :-
        score("at", 2).

    test(short_valuable_word, condition(true)) :-
        score("zoo", 12).

    test(medium_word, condition(true)) :-
        score("street", 6).

    test(medium_valuable_word, condition(true)) :-
        score("quirky", 22).

    test(long_mixed_case_word, condition(true)) :-
        score("OxyphenButazone", 41).

    test(english_like_word, condition(true)) :-
        score("pinata", 8).

    test(empty_input, condition(true)) :-
        score("", 0).

    test(entire_alphabet_available, condition(true)) :-
        score("abcdefghijklmnopqrstuvwxyz", 87).

:- end_tests(scrabble_score).
