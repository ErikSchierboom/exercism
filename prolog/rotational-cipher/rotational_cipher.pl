:- use_module(library(clpfd)).

rotate_code(Amount, Code, Rotated) :-
    code_type(Code, lower),
    Rotated #= 97 + ((Code - 97 + Amount) rem 26), !. 

rotate_code(Amount, Code, Rotated) :-
    code_type(Code, upper),
    Rotated #= 65 + ((Code - 65 + Amount) rem 26), !.

rotate_code(_, Code, Code) :- !.

rotate(Plaintext, Amount, Ciphertext) :-
    string_codes(Plaintext, Codes),
    maplist(rotate_code(Amount), Codes, RotatedCodes),
    string_codes(Ciphertext, RotatedCodes).
