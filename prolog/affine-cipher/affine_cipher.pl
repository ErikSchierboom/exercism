:- use_module(library(clpfd)).

alphabet(Alphabet) :- string_chars("abcdefghijklmnopqrstuvwxyz", Alphabet).

encrypt_char(_, Char, Char) :- char_type(Char, digit), !.
encrypt_char(Map, Char, Encrypted) :-
    char_type(Char, alpha),
    downcase_atom(Char, Downcased),
    alphabet(Alphabet),
    nth0(I, Alphabet, Downcased),
    call(Map, I, J),
    nth0(J, Alphabet, Encrypted), !.

encrypt(Map, Text, Encrypted) :-
    string_chars(Text, Chars),
    findall(EncryptedChar, (member(Char, Chars), encrypt_char(Map, Char, EncryptedChar)), EncryptedChars),
    string_chars(Encrypted, EncryptedChars).

chunk(Text, Text) :- string_length(Text, Length), Length =< 5, !.
chunk(Text, Chunked) :-
    ChunkSize = 5,
    sub_string(Text, 0, ChunkSize, After, Chunk),
    sub_string(Text, ChunkSize, After, _, Remainder),
    chunk(Remainder, RemainderChunk),
    format(string(Chunked), "~w ~w", [Chunk, RemainderChunk]).

encode(Plaintext, A, B, Ciphertext) :-
    modular_inverse(A, 26, _),
    encrypt([I,J]>>(J is (A * I + B) mod 26), Plaintext, Translated),
    chunk(Translated, Ciphertext).

decode(Ciphertext, A, B, Plaintext) :-
    modular_inverse(A, 26, Mmi),
    encrypt([I,J]>>(J is Mmi * (I - B) mod 26), Ciphertext, Plaintext).

modular_inverse(A, M, Mmi) :-
    Mmi in 1..M,
    A * Mmi mod M #= 1,
    label([Mmi]).
