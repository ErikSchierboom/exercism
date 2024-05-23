:- use_module(library(dcg/basics)).
:- set_prolog_flag(double_quotes, chars).

parentheses --> "(", balanced, ")".
brackets    --> "[", balanced, "]".
braces      --> "{", balanced, "}".

balanced --> (parentheses | brackets | braces | non_bracket), balanced.
balanced --> [].

non_bracket --> [C], { \+ member(C, "()[]{}") }.

paired(String) :-
    string_chars(String, Chars),
    phrase(balanced, Chars),
    !.
