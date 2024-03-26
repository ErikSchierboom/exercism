:- use_module(library(clpfd)).

alphabet(Alphabet) :- string_chars("abcdefghijklmnopqrstuvwxyz", Alphabet).

encrypt_char(Char, Char) :- char_type(Char, digit), !.
encrypt_char(Char, Encrypted) :-
    char_type(Char, alpha),
    downcase_atom(Char, Downcased),
    alphabet(Alphabet),
    nth0(I, Alphabet, Downcased),
    J is 26 - I,
    nth1(J, Alphabet, Encrypted), !.

encrypt(Text, Encrypted) :-
    string_lower(Text, Lower),
    string_chars(Lower, Chars),
    findall(EncryptedChar, (member(Char, Chars), encrypt_char(Char, EncryptedChar)), EncryptedChars),
    string_chars(Encrypted, EncryptedChars).

chunk(Text, Text) :- string_length(Text, Length), Length =< 5, !.
chunk(Text, Chunked) :-
    ChunkSize = 5,
    sub_string(Text, 0, ChunkSize, After, Chunk),
    sub_string(Text, ChunkSize, After, _, Remainder),
    chunk(Remainder, RemainderChunk),
    format(string(Chunked), "~w ~w", [Chunk, RemainderChunk]).

encode(Plaintext, Ciphertext) :-
    encrypt(Plaintext, UnchunkedCiphertext),
    chunk(UnchunkedCiphertext, Ciphertext).

decode(Ciphertext, Plaintext) :-
    encrypt(Ciphertext, Plaintext).
