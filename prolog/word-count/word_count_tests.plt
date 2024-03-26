pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(word_count).

    test(count_one_word, condition(true)) :-
        word_count("word", Counts),
        keysort(Counts, SortedCounts),
        SortedCounts == ["word"-1].

    test(count_one_of_each_word, condition(pending)) :-
        word_count("one of each", Counts),
        keysort(Counts, SortedCounts),
        SortedCounts == ["each"-1, "of"-1, "one"-1].

    test(multiple_occurrences_of_a_word, condition(pending)) :-
        word_count("one fish two fish red fish blue fish", Counts),
        keysort(Counts, SortedCounts),
        SortedCounts == [
          "blue"-1,
          "fish"-4,
          "one"-1,
          "red"-1,
          "two"-1
        ].

    test(handles_cramped_lists, condition(pending)) :-
        word_count("one,two,three", Counts),
        keysort(Counts, SortedCounts),
        SortedCounts == ["one"-1, "three"-1, "two"-1].

    test(handles_expanded_lists, condition(pending)) :-
        word_count("one,\ntwo,\nthree", Counts),
        keysort(Counts, SortedCounts),
        SortedCounts == ["one"-1, "three"-1, "two"-1].

    test(ignore_punctuation, condition(pending)) :-
        word_count("car: carpet as java: javascript!!&@$%^&", Counts),
        keysort(Counts, SortedCounts),
        SortedCounts == [
          "as"-1,
          "car"-1,
          "carpet"-1,
          "java"-1,
          "javascript"-1
        ].

    test(include_numbers, condition(pending)) :-
        word_count("testing, 1, 2 testing", Counts),
        keysort(Counts, SortedCounts),
        SortedCounts == ["1"-1, "2"-1, "testing"-2].

    test(normalize_case, condition(pending)) :-
        word_count("go Go GO Stop stop", Counts),
        keysort(Counts, SortedCounts),
        SortedCounts == ["go"-3, "stop"-2].

    test(with_apostrophes, condition(pending)) :-
        word_count("'First: don't laugh. Then: don't cry. You're getting it.'", Counts),
        keysort(Counts, SortedCounts),
        SortedCounts == [
          "cry"-1,
          "don't"-2,
          "first"-1,
          "getting"-1,
          "it"-1
          "laugh"-1,
          "then"-1,
          "you're"-1
        ].

    test(with_quotations, condition(pending)) :-
        word_count("Joe can't tell between 'large' and large.", Counts),
        keysort(Counts, SortedCounts),
        SortedCounts == [
          "and"-1,
          "between"-1,
          "can't"-1,
          "joe"-1,
          "large"-2,
          "tell"-1
        ].

    test(substrings_from_the_beginning, condition(pending)) :-
        word_count("Joe can't tell between app, apple and a.", Counts),
        keysort(Counts, SortedCounts),
        SortedCounts == [
          "a"-1,
          "and"-1,
          "app"-1,
          "apple"-1,
          "between"-1,
          "can't"-1,
          "joe"-1,
          "tell"-1
        ].

    test(multiple_spaces_not_detected_as_a_word, condition(pending)) :-
        word_count(" multiple   whitespaces", Counts),
        keysort(Counts, SortedCounts),
        SortedCounts == ["multiple"-1, "whitespaces"-1].

    test(alternating_word_separators_not_detected_as_a_word, condition(pending)) :-
        word_count(",\n,one,\n ,two \n 'three'", Counts),
        keysort(Counts, SortedCounts),
        SortedCounts == ["one"-1, "three"-1, "two"-1].

    test(quotation_for_word_with_apostrophe, condition(pending)) :-
        word_count("can, can't, 'can't'", Counts),
        keysort(Counts, SortedCounts),
        SortedCounts == ["can"-1, "can't"-2].

:- end_tests(word_count).
