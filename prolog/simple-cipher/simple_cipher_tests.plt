pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(simple_cipher).

    test(can_encode, condition(true)) :-
        Key = "abcdefghij",
        encode("aaaaaaaaaa", Key, Key).

    test(can_double_shift_encode, condition(pending)) :-
        encode("iamapandabear", "iamapandabear", Ciphertext),
        Ciphertext == "qayaeaagaciai".

    test(can_wrap_on_encode, condition(pending)) :-
        encode("zzzzzzzzzz", "abcdefghij", Ciphertext),
        Ciphertext == "zabcdefghi".

    test(can_encode_messages_longer_than_the_key, condition(pending)) :-
        encode("iamapandabear", "abc", Ciphertext),
        Ciphertext == "iboaqcnecbfcr".

    test(can_decode, condition(pending)) :-
        Key = "abcdefghij",
        decode(Key, Key, "aaaaaaaaaa").

    test(can_wrap_on_decode, condition(pending)) :-
        decode("zabcdefghi", "abcdefghij", Plaintext),
        Plaintext == "zzzzzzzzzz".

    test(can_decode_messages_longer_than_the_key, condition(pending)) :-
        decode("iboaqcnecbfcr", "abc", Plaintext),
        Plaintext == "iamapandabear".

    test(is_reversible, condition(pending)) :-
        Plaintext = "abcdefghij",
        Key = "abcdefghij",
        encode(Plaintext, Key, Ciphertext),
        decode(Ciphertext, Key, Plaintext).

    test(can_encode_using_generated_key, condition(pending)) :-
        Plaintext = "aaaaaaaaaa",
        string_length(Plaintext, Length),
        generate_key(Key),
        string_concat(Subkey, _, Key),
        string_length(Subkey, Length),
        encode(Plaintext, Subkey, Subkey),
        !.

    test(can_decode_using_generated_key, condition(pending)) :-
        Plaintext = "aaaaaaaaaa",
        string_length(Plaintext, Length),
        generate_key(Key),
        string_concat(Subkey, _, Key),
        string_length(Subkey, Length),
        decode(Subkey, Subkey, "aaaaaaaaaa"),
        !.

    test(is_reversible_using_generated_key, condition(pending)) :-
        generate_key(Key),
        Plaintext = "abcdefghij",
        encode(Plaintext, Key, Ciphertext),
        decode(Ciphertext, Key, Plaintext).

    test(key_is_made_only_of_lowercase_letters, condition(pending)) :-
        generate_key(Key),
        string_length(Key, Length),
        Length >= 100,
        string_chars(Key, Chars),
        maplist([C]>>char_type(C, lower), Chars).

:- end_tests(simple_cipher).
