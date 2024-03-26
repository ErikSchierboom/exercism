pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(crypto_square).

    test(empty_plaintext_results_in_an_empty_ciphertext, condition(true)) :-
        encode("", Ciphertext),
        Ciphertext == "".

    test(normalization_results_in_empty_plaintext, condition(pending)) :-
        encode("... --- ...", Ciphertext),
        Ciphertext == "".

    test(lowercase, condition(pending)) :-
        encode("A", Ciphertext),
        Ciphertext == "a".

    test(remove_spaces, condition(pending)) :-
        encode("  b ", Ciphertext),
        Ciphertext == "b".

    test(remove_punctuation, condition(pending)) :-
        encode("@1,%!", Ciphertext),
        Ciphertext == "1".

    test(nine_character_plaintext_results_in_3_chunks_of_3_characters, condition(pending)) :-
        encode("This is fun!", Ciphertext),
        Ciphertext == "tsf hiu isn".

    test(eight_character_plaintext_results_in_3_chunks_the_last_one_with_a_trailing_space, condition(pending)) :-
        encode("Chill out.", Ciphertext),
        Ciphertext == "clu hlt io ".

    test(fifty_four_character_plaintext_results_in_7_chunks_the_last_two_with_trailing_spaces, condition(pending)) :-
        encode("If man was meant to stay on the ground, god would have given us roots.", Ciphertext),
        Ciphertext == "imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghn  sseoau ".

:- end_tests(crypto_square).
