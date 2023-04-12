string_reverse(S, Reversed) :-
    string_chars(S, Chars),
    reverse(Chars, ReversedChars),
    string_chars(Reversed, ReversedChars).
