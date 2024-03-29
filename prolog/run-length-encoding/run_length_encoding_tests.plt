pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(run_length_encoding).

    test(encode_empty_string, condition(true)) :-
        encode("", Ciphertext),
        Ciphertext == "".

    test(encode_single_characters_only_are_encoded_without_count, condition(true)) :-
        encode("XYZ", Ciphertext),
        Ciphertext == "XYZ".

    test(encode_string_with_no_single_characters, condition(true)) :-
        encode("AABBBCCCC", Ciphertext),
        Ciphertext == "2A3B4C".

    test(encode_single_characters_mixed_with_repeated_characters, condition(true)) :-
        encode("WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB", Ciphertext),
        Ciphertext == "12WB12W3B24WB".

    test(encode_multiple_whitespace_mixed_in_string, condition(true)) :-
        encode("  hsqq qww  ", Ciphertext),
        Ciphertext == "2 hs2q q2w2 ".

    test(encode_lowercase_characters, condition(true)) :-
        encode("aabbbcccc", Ciphertext),
        Ciphertext == "2a3b4c".

    test(decode_empty_string, condition(true)) :-
        decode("", Plaintext),
        Plaintext == "".

    test(decode_single_characters_only, condition(true)) :-
        decode("XYZ", Plaintext),
        Plaintext == "XYZ".

    test(decode_string_with_no_single_characters, condition(true)) :-
        decode("2A3B4C", Plaintext),
        Plaintext == "AABBBCCCC".

    test(decode_single_characters_with_repeated_characters, condition(true)) :-
        decode("12WB12W3B24WB", Plaintext),
        Plaintext == "WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB".

    test(decode_multiple_whitespace_mixed_in_string, condition(true)) :-
        decode("2 hs2q q2w2 ", Plaintext),
        Plaintext == "  hsqq qww  ".

    test(decode_lowercase_string, condition(true)) :-
        decode("2a3b4c", Plaintext),
        Plaintext == "aabbbcccc".

    test(encode_followed_by_decode_gives_original_string, condition(true)) :-
        encode("zzz ZZ  zZ", Ciphertext),
        decode(Ciphertext, Plaintext),
        Plaintext == "zzz ZZ  zZ".

:- end_tests(run_length_encoding).
