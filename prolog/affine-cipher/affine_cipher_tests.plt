pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(affine_cipher).

    test(encode_yes, condition(true)) :-
        encode("yes", 5, 7, Ciphertext),
        Ciphertext == "xbt".

    test(encode_no, condition(true)) :-
        encode("no", 15, 18, Ciphertext),
        Ciphertext == "fu".

    test(encode_omg, condition(true)) :-
        encode("OMG", 21, 3, Ciphertext),
        Ciphertext == "lvz".

    test(encode_o_m_g, condition(true)) :-
        encode("O M G", 25, 47, Ciphertext),
        Ciphertext == "hjp".

    test(encode_mindblowingly, condition(true)) :-
        encode("mindblowingly", 11, 15, Ciphertext),
        Ciphertext == "rzcwa gnxzc dgt".

    test(encode_numbers, condition(true)) :-
        encode("Testing,1 2 3, testing.", 3, 4, Ciphertext),
        Ciphertext == "jqgjc rw123 jqgjc rw".

    test(encode_deep_thought, condition(true)) :-
        encode("Truth is fiction.", 5, 17, Ciphertext),
        Ciphertext == "iynia fdqfb ifje".

    test(encode_all_the_letters, condition(true)) :-
        encode("The quick brown fox jumps over the lazy dog.", 17, 33, Ciphertext),
        Ciphertext == "swxtj npvyk lruol iejdc blaxk swxmh qzglf".

    test(encode_with_a_not_coprime_to_m, [fail, condition(true)]) :-
        encode("This is a test.", 6, 17, _).

    test(decode_exercism, condition(true)) :-
        decode("tytgn fjr", 3, 7, Plaintext),
        Plaintext == "exercism".

    test(decode_a_sentence, condition(true)) :-
        decode("qdwju nqcro muwhn odqun oppmd aunwd o", 19, 16, Plaintext),
        Plaintext == "anobstacleisoftenasteppingstone".

    test(decode_numbers, condition(true)) :-
        decode("odpoz ub123 odpoz ub", 25, 7, Plaintext),
        Plaintext == "testing123testing".

    test(decode_all_the_letters, condition(true)) :-
    decode("swxtj npvyk lruol iejdc blaxk swxmh qzglf", 17, 33, Plaintext),
        Plaintext == "thequickbrownfoxjumpsoverthelazydog".

    test(decode_with_no_spaces_in_input, condition(true)) :-
        decode("swxtjnpvyklruoliejdcblaxkswxmhqzglf", 17, 33, Plaintext),
        Plaintext == "thequickbrownfoxjumpsoverthelazydog".

    test(decode_with_too_many_spaces, condition(true)) :-
        decode("vszzm    cly   yd cg    qdp", 15, 16, Plaintext),
        Plaintext == "jollygreengiant".

    test(decode_with_a_not_coprime_to_m, [fail, condition(true)]) :-
        decode("Test", 13, 5, _).

:- end_tests(affine_cipher).
