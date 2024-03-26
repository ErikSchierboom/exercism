pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(bottle_song).

    test(first_generic_verse, condition(true)) :-
        recite(10, Lyrics),
        Lyrics == [
            "Ten green bottles hanging on the wall,",
            "Ten green bottles hanging on the wall,",
            "And if one green bottle should accidentally fall,",
            "There'll be nine green bottles hanging on the wall."
        ].

    test(last_generic_verse, condition(pending)) :-
        recite(3, Lyrics),
        Lyrics == [
            "Three green bottles hanging on the wall,",
            "Three green bottles hanging on the wall,",
            "And if one green bottle should accidentally fall,",
            "There'll be two green bottles hanging on the wall."
        ].

    test(verse_with_2_bottles, condition(pending)) :-
        recite(2, Lyrics),
        Lyrics == [
            "Two green bottles hanging on the wall,",
            "Two green bottles hanging on the wall,",
            "And if one green bottle should accidentally fall,",
            "There'll be one green bottle hanging on the wall."
        ].

    test(verse_with_1_bottle, condition(pending)) :-
        recite(1, Lyrics),
        Lyrics == [
            "One green bottle hanging on the wall,",
            "One green bottle hanging on the wall,",
            "And if one green bottle should accidentally fall,",
            "There'll be no green bottles hanging on the wall."
        ].

    test(first_two_verses, condition(pending)) :-
        recite(10, 2, Lyrics),
        Lyrics == [
            "Ten green bottles hanging on the wall,",
            "Ten green bottles hanging on the wall,",
            "And if one green bottle should accidentally fall,",
            "There'll be nine green bottles hanging on the wall.",
            "",
            "Nine green bottles hanging on the wall,",
            "Nine green bottles hanging on the wall,",
            "And if one green bottle should accidentally fall,",
            "There'll be eight green bottles hanging on the wall."
        ].

    test(last_three_verses, condition(pending)) :-
        recite(3, 3, Lyrics),
        Lyrics == [
            "Three green bottles hanging on the wall,",
            "Three green bottles hanging on the wall,",
            "And if one green bottle should accidentally fall,",
            "There'll be two green bottles hanging on the wall.",
            "",
            "Two green bottles hanging on the wall,",
            "Two green bottles hanging on the wall,",
            "And if one green bottle should accidentally fall,",
            "There'll be one green bottle hanging on the wall.",
            "",
            "One green bottle hanging on the wall,",
            "One green bottle hanging on the wall,",
            "And if one green bottle should accidentally fall,",
            "There'll be no green bottles hanging on the wall."
        ].

    test(all_verses, condition(pending)) :-
        recite(10, 10, Lyrics),
        Lyrics == [
            "Ten green bottles hanging on the wall,",
            "Ten green bottles hanging on the wall,",
            "And if one green bottle should accidentally fall,",
            "There'll be nine green bottles hanging on the wall.",
            "",
            "Nine green bottles hanging on the wall,",
            "Nine green bottles hanging on the wall,",
            "And if one green bottle should accidentally fall,",
            "There'll be eight green bottles hanging on the wall.",
            "",
            "Eight green bottles hanging on the wall,",
            "Eight green bottles hanging on the wall,",
            "And if one green bottle should accidentally fall,",
            "There'll be seven green bottles hanging on the wall.",
            "",
            "Seven green bottles hanging on the wall,",
            "Seven green bottles hanging on the wall,",
            "And if one green bottle should accidentally fall,",
            "There'll be six green bottles hanging on the wall.",
            "",
            "Six green bottles hanging on the wall,",
            "Six green bottles hanging on the wall,",
            "And if one green bottle should accidentally fall,",
            "There'll be five green bottles hanging on the wall.",
            "",
            "Five green bottles hanging on the wall,",
            "Five green bottles hanging on the wall,",
            "And if one green bottle should accidentally fall,",
            "There'll be four green bottles hanging on the wall.",
            "",
            "Four green bottles hanging on the wall,",
            "Four green bottles hanging on the wall,",
            "And if one green bottle should accidentally fall,",
            "There'll be three green bottles hanging on the wall.",
            "",
            "Three green bottles hanging on the wall,",
            "Three green bottles hanging on the wall,",
            "And if one green bottle should accidentally fall,",
            "There'll be two green bottles hanging on the wall.",
            "",
            "Two green bottles hanging on the wall,",
            "Two green bottles hanging on the wall,",
            "And if one green bottle should accidentally fall,",
            "There'll be one green bottle hanging on the wall.",
            "",
            "One green bottle hanging on the wall,",
            "One green bottle hanging on the wall,",
            "And if one green bottle should accidentally fall,",
            "There'll be no green bottles hanging on the wall."
        ].

:- end_tests(bottle_song).
