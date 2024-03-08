:- use_module(library(clpfd)).

digits([], []).
digits([C|Chars], [D|Digits]) :-
    char_type(C, 'digit'),
    number_chars(D, [C]),
    digits(Chars, Digits).

series(Digits, Span, []) :-
    length(Digits, Length),
    Length #< Span,
    !.

series([D|Digits], Span, [Serie|Series]) :-
    append(Serie, _, [D|Digits]),
    length(Serie, Span),
    series(Digits, Span, Series),
    !.

product([], 1) :- !.
product([D|Digits], Product) :-
    product(Digits, DigitsProduct),
    Product #= D * DigitsProduct.

largest_product(Input, Span, Product) :-
    Span #> 0,
    string_chars(Input, Chars),
    digits(Chars, Digits),
    series(Digits, Span, Series),
    maplist(product, Series, Products),
    max_member(Product, Products).
