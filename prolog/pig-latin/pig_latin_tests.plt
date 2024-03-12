pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(pig_latin).

    test(word_beginning_with_a, condition(true)) :-
        translate("apple", PigLatin),
        PigLatin == "appleay".

    test(word_beginning_with_e, condition(pending)) :-
        translate("ear", PigLatin),
        PigLatin == "earay".

    test(word_beginning_with_i, condition(pending)) :-
        translate("igloo", PigLatin),
        PigLatin == "iglooay".

    test(word_beginning_with_o, condition(pending)) :-
        translate("object", PigLatin),
        PigLatin == "objectay".

    test(word_beginning_with_u, condition(pending)) :-
        translate("under", PigLatin),
        PigLatin == "underay".

    test(word_beginning_with_a_vowel_and_followed_by_a_qu, condition(pending)) :-
        translate("equal", PigLatin),
        PigLatin == "equalay".

    test(word_beginning_with_p, condition(pending)) :-
        translate("pig", PigLatin),
        PigLatin == "igpay".

    test(word_beginning_with_k, condition(pending)) :-
        translate("koala", PigLatin),
        PigLatin == "oalakay".

    test(word_beginning_with_x, condition(pending)) :-
        translate("xenon", PigLatin),
        PigLatin == "enonxay".

    test(word_beginning_with_q_without_a_following_u, condition(pending)) :-
        translate("qat", PigLatin),
        PigLatin == "atqay".

    test(word_beginning_with_ch, condition(pending)) :-
        translate("chair", PigLatin),
        PigLatin == "airchay".

    test(word_beginning_with_qu, condition(pending)) :-
        translate("queen", PigLatin),
        PigLatin == "eenquay".

    test(word_beginning_with_qu_and_a_preceding_consonant, condition(pending)) :-
        translate("square", PigLatin),
        PigLatin == "aresquay".

    test(word_beginning_with_th, condition(pending)) :-
        translate("therapy", PigLatin),
        PigLatin == "erapythay".

    test(word_beginning_with_thr, condition(pending)) :-
        translate("thrush", PigLatin),
        PigLatin == "ushthray".

    test(word_beginning_with_sch, condition(pending)) :-
        translate("school", PigLatin),
        PigLatin == "oolschay".

    test(word_beginning_with_yt, condition(pending)) :-
        translate("yttria", PigLatin),
        PigLatin == "yttriaay".

    test(word_beginning_with_xr, condition(pending)) :-
        translate("xray", PigLatin),
        PigLatin == "xrayay".

    test(y_is_treated_like_a_consonant_at_the_beginning_of_a_word, condition(pending)) :-
        translate("yellow", PigLatin),
        PigLatin == "ellowyay".

    test(y_is_treated_like_a_vowel_at_the_end_of_a_consonant_cluster, condition(pending)) :-
        translate("rhythm", PigLatin),
        PigLatin == "ythmrhay".

    test(y_as_second_letter_in_two_letter_word, condition(pending)) :-
        translate("my", PigLatin),
        PigLatin == "ymay".

    test(a_whole_phrase, condition(pending)) :-
        translate("quick fast run", PigLatin),
        PigLatin == "ickquay astfay unray".

:- end_tests(pig_latin).
