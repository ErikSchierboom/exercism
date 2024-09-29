pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(atbash_cipher).

    test(encode_yes, condition(true)) :-
        encode("yes", Ciphertext),
        Ciphertext == "bvh".

    test(encode_no, condition(true)) :-
        encode("no", Ciphertext),
        Ciphertext == "ml".

    test(encode_omg, condition(true)) :-
        encode("OMG", Ciphertext),
        Ciphertext == "lnt".

    test(encode_spaces, condition(true)) :-
        encode("O M G", Ciphertext),
        Ciphertext == "lnt".

    test(encode_mindblowingly, condition(true)) :-
        encode("mindblowingly", Ciphertext),
        Ciphertext == "nrmwy oldrm tob".

    test(encode_numbers, condition(true)) :-
        encode("Testing,1 2 3, testing.", Ciphertext),
        Ciphertext == "gvhgr mt123 gvhgr mt".

    test(encode_deep_thought, condition(true)) :-
        encode("Truth is fiction.", Ciphertext),
        Ciphertext == "gifgs rhurx grlm".

    test(encode_all_the_letters, condition(true)) :-
        encode("The quick brown fox jumps over the lazy dog." Ciphertext),
        Ciphertext == "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt".

    test(decode_exercism, condition(true)) :-
        decode("vcvix rhn", Plaintext),
        Plaintext == "exercism".

    test(decode_a_sentence, condition(true)) :-
        decode("zmlyh gzxov rhlug vmzhg vkkrm thglm v", Plaintext),
        Plaintext == "anobstacleisoftenasteppingstone".

    test(decode_numbers, condition(true)) :-
        decode("gvhgr mt123 gvhgr mt", Plaintext),
        Plaintext == "testing123testing".

    test(decode_all_the_letters, condition(true)) :-
        decode("gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt", Plaintext),
        Plaintext == "thequickbrownfoxjumpsoverthelazydog".

    test(decode_with_too_many_spaces, condition(true)) :-
        decode("vc vix    r hn", Plaintext),
        Plaintext == "exercism".

    test(decode_with_no_spaces, condition(true)) :-
        decode("zmlyhgzxovrhlugvmzhgvkkrmthglmv", Plaintext),
        Plaintext == "anobstacleisoftenasteppingstone".

:- end_tests(atbash_cipher).
