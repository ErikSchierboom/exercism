key_shift(Key, Index, Shift) :-
    string_length(Key, Length),
    KeyIndex is (Index - 1) mod Length + 1,
    string_code(KeyIndex, Key, KeyCode),
    Shift is KeyCode - 97.

char_shift(Goal, Key, Index-Code, Shifted) :-
    key_shift(Key, Index, KeyShift),
    CodeFromA is Code - 97,
    call(Goal, CodeFromA, KeyShift, Shift),
    Shifted is 97 + (Shift mod 26).

shift(Goal, Input, Key, Shifted) :-
    string_length(Input, Length),
    string_codes(Input, Codes),
    numlist(1, Length, Indices),    
    pairs_keys_values(IndexesWithCode, Indices, Codes),
    maplist(char_shift(Goal, Key), IndexesWithCode, ShiftedCodes),
    string_codes(Shifted, ShiftedCodes).

encode(Plaintext, Key, Ciphertext) :- shift([C,S,R]>>(R is C + S), Plaintext, Key, Ciphertext), !.
decode(Ciphertext, Key, Plaintext) :- shift([C,S,R]>>(R is C - S), Ciphertext, Key, Plaintext), !.

generate_key(Key) :-
    length(Codes, 100),
    maplist(random_between(97, 122), Codes),
    string_codes(Key, Codes),
    !.
