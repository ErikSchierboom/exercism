pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(reverse_string).

    test(an_empty_string, condition(true)) :-
        string_reverse("", Reversed),
        Reversed == "".

    test(a_word, condition(pending)) :-
        string_reverse("robot", Reversed),
        Reversed == "tobor".

    test(a_capitalized_word, condition(pending)) :-
        string_reverse("Ramen", Reversed),
        Reversed == "nemaR".

    test(a_sentence_with_punctuation, condition(pending)) :-
        string_reverse("I'm hungry!", Reversed),
        Reversed == "!yrgnuh m'I".

    test(a_palindrome, condition(pending)) :-
        string_reverse("racecar", Reversed),
        Reversed == "racecar".

    test(an_even_sized_word, condition(pending)) :-
        string_reverse("drawer", Reversed),
        Reversed == "reward".

:- end_tests(reverse_string).
