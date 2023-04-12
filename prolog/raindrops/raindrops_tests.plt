pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(raindrops).

    test(the_sound_for_1_is_1, condition(true)) :-
        convert(1, Sounds),
        Sounds == "1".

    test(the_sound_for_3_is_pling, condition(pending)) :-
        convert(3, Sounds),
        Sounds == "Pling".

    test(the_sound_for_5_is_plang, condition(pending)) :-
        convert(5, Sounds),
        Sounds == "Plang".

    test(the_sound_for_7_is_plong, condition(pending)) :-
        convert(7, Sounds),
        Sounds == "Plong".

    test(the_sound_for_6_is_pling_as_it_has_a_factor_3, condition(pending)) :-
        convert(6, Sounds),
        Sounds == "Pling".

    test(two_to_the_power_3_does_not_make_a_raindrop_sound_as_3_is_the_exponent_not_the_base, condition(pending)) :-
        convert(8, Sounds),
        Sounds == "8".

    test(the_sound_for_9_is_pling_as_it_has_a_factor_3, condition(pending)) :-
        convert(9, Sounds),
        Sounds == "Pling".

    test(the_sound_for_10_is_plang_as_it_has_a_factor_5, condition(pending)) :-
        convert(10, Sounds),
        Sounds == "Plang".

    test(the_sound_for_14_is_plong_as_it_has_a_factor_of_7, condition(pending)) :-
        convert(14, Sounds),
        Sounds == "Plong".

    test(the_sound_for_15_is_plingplang_as_it_has_factors_3_and_5, condition(pending)) :-
        convert(15, Sounds),
        Sounds == "PlingPlang".

    test(the_sound_for_21_is_plingplong_as_it_has_factors_3_and_7, condition(pending)) :-
        convert(21, Sounds),
        Sounds == "PlingPlong".

    test(the_sound_for_25_is_plang_as_it_has_a_factor_5, condition(pending)) :-
        convert(25, Sounds),
        Sounds == "Plang".

    test(the_sound_for_27_is_pling_as_it_has_a_factor_3, condition(pending)) :-
        convert(27, Sounds),
        Sounds == "Pling".

    test(the_sound_for_35_is_plangplong_as_it_has_factors_5_and_7, condition(pending)) :-
        convert(35, Sounds),
        Sounds == "PlangPlong".

    test(the_sound_for_49_is_plong_as_it_has_a_factor_7, condition(pending)) :-
        convert(49, Sounds),
        Sounds == "Plong".

    test(the_sound_for_52_is_52, condition(pending)) :-
        convert(52, Sounds),
        Sounds == "52".

    test(the_sound_for_105_is_plingplangplong_as_it_has_factors_3_5_and_7, condition(pending)) :-
        convert(105, Sounds),
        Sounds == "PlingPlangPlong".

    test(the_sound_for_3125_is_plang_as_it_has_a_factor_5, condition(pending)) :-
        convert(3125, Sounds),
        Sounds == "Plang".

:- end_tests(raindrops).
