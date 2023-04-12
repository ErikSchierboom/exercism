pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(pangram).

    test(empty_sentence, [fail, condition(true)]) :-
        pangram("").

    test(perfect_lower_case, condition(pending)) :-
        pangram("abcdefghijklmnopqrstuvwxyz").

    test(only_lower_case, condition(pending)) :-
        pangram("the quick brown fox jumps over the lazy dog").

    test(missing_the_letter_x, [fail, condition(pending)]) :-
        pangram("a quick movement of the enemy will jeopardize five gunboats").

    test(missing_the_letter_h, [fail, condition(pending)]) :-
        pangram("five boxing wizards jump quickly at it").

    test(with_underscores, condition(pending)) :-
        pangram("the_quick_brown_fox_jumps_over_the_lazy_dog").

    test(with_numbers, condition(pending)) :-
        pangram("the 1 quick brown fox jumps over the 2 lazy dogs").

    test(missing_letters_replaced_by_numbers, [fail, condition(pending)]) :-
        pangram("7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog").

    test(mixed_case_and_punctuation, condition(pending)) :-
        pangram("Five quacking Zephyrs jolt my wax bed.").

    test(case_insensitive, [fail, condition(pending)]) :-
        pangram("the quick brown fox jumps over with lazy FX").

    test(a_m_and_upper_a_m_are_26_different_characters_but_not_a_pangram, [fail, condition(pending)]) :-
        pangram("abcdefghijklm ABCDEFGHIJKLM").

:- end_tests(pangram).
