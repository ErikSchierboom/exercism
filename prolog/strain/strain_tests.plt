pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(strain).

    test(empty_sequence, condition(true)) :-
        Input = [],
        keep([X]>>(X mod 2 =:= 0), Input, Filtered),
        Filtered == [].

    test(empty_keep, condition(pending)) :-
        Input = [2, 4, 6, 8, 10],
        keep([X]>>(X mod 2 =:= 1), Input, Filtered),
        Filtered == [].

    test(empty_discard, condition(pending)) :-
        Input = [2, 4, 6, 8, 10],
        discard([X]>>(X mod 2 =:= 0), Input, Filtered),
        Filtered == [].

    test(keep_everything, condition(pending)) :-
        Input = [2, 4, 6, 8, 10],
        keep([X]>>(X mod 2 =:= 0), Input, Filtered),
        Filtered == Input.

    test(discard_endswith, condition(pending)) :-
        Input = ["dough", "cash", "plough", "though", "through", "enough"],
        discard([X]>>(string_concat(_, "ough", X)), Input, Filtered),
        Filtered == ["cash"].
    
    test(keep_z, condition(pending)) :-
        Input = ["zebra", "arizona", "apple", "google", "mozilla"],
        keep([X]>>(string_chars(X, Chars), member('z', Chars)), Input, Filtered),
        Filtered == ["zebra", "arizona", "mozilla"].
    
    test(keep_discard, condition(pending)) :-
        Input = ["1,2,3", "one", "almost!", "love"],
        keep([X]>>(string_length(X, Length), Length > 4), Input, Kept),
        discard([X]>>(string_length(X, Length), Length > 4), Kept, Filtered),
        Filtered == [].
    
    test(keep_plus_discard, condition(pending)) :-
        Input = ["1,2,3", "one", "almost!", "love"],
        keep([X]>>(string_length(X, Length), Length > 4), Input, Kept),
        discard([X]>>(string_length(X, Length), Length > 4), Input, Discarded),
        append(Kept, Discarded, ["1,2,3", "almost!", "one", "love"]).

:- end_tests(strain).
