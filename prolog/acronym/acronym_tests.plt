pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(acronym).

    test(basic, condition(true)) :-
        abbreviate("Portable Network Graphics", Acronym),
        Acronym == "PNG".

    test(lowercase_words, condition(true)) :-
        abbreviate("Ruby on Rails", Acronym),
        Acronym == "ROR".

    test(punctuation, condition(true)) :-
        abbreviate("First In, First Out", Acronym),
        Acronym == "FIFO".

    test(all_caps_word, condition(true)) :-
        abbreviate("GNU Image Manipulation Program", Acronym),
        Acronym == "GIMP".

    test(punctuation_without_whitespace, condition(true)) :-
        abbreviate("Complementary metal-oxide semiconductor", Acronym),
        Acronym == "CMOS".

    test(very_long_abbreviation, condition(true)) :-
        abbreviate("Rolling On The Floor Laughing So Hard That My Dogs Came Over And Licked Me", Acronym),
        Acronym == "ROTFLSHTMDCOALM".

    test(consecutive_delimiters, condition(true)) :-
        abbreviate("Something - I made up from thin air", Acronym),
        Acronym == "SIMUFTA".

    test(apostrophes, condition(true)) :-
        abbreviate("Halley's Comet", Acronym),
        Acronym == "HC".

    test(underscore_emphasis, condition(true)) :-
        abbreviate("The Road _Not_ Taken", Acronym),
        Acronym == "TRNT".

:- end_tests(acronym).
