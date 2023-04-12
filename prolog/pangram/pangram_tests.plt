pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(pangram).

    test(empty_sentence, [fail, condition(true)]) :-
        pangram("").

    test(perfect_lower_case, condition(true)) :-
        pangram("abcdefghijklmnopqrstuvwxyz").

    test(only_lower_case, condition(true)) :-
        pangram("the quick brown fox jumps over the lazy dog").

    test(missing_the_letter_x, [fail, condition(true)]) :-
        pangram("a quick movement of the enemy will jeopardize five gunboats").

    test(missing_the_letter_h, [fail, condition(true)]) :-
        pangram("five boxing wizards jump quickly at it").

    test(with_underscores, condition(true)) :-
        pangram("the_quick_brown_fox_jumps_over_the_lazy_dog").

    test(with_numbers, condition(true)) :-
        pangram("the 1 quick brown fox jumps over the 2 lazy dogs").

    test(missing_letters_replaced_by_numbers, [fail, condition(true)]) :-
        pangram("7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog").

    test(mixed_case_and_punctuation, condition(true)) :-
        pangram("Five quacking Zephyrs jolt my wax bed.").

    test(case_insensitive, [fail, condition(true)]) :-
        pangram("the quick brown fox jumps over with lazy FX").

    test(a_m_and_upper_a_m_are_26_different_characters_but_not_a_pangram, [fail, condition(true)]) :-
        pangram("abcdefghijklm ABCDEFGHIJKLM").

:- end_tests(pangram).
