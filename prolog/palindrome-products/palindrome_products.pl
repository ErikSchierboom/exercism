:- use_module(library(clpfd)).

palindrome(Value) :-
    number_codes(Value, Codes),
    reverse(Codes, Codes).

palindrome_products(MinFactor, MaxFactor, Palindromes) :-
    findall(Product-Pair, (
        between(MinFactor, MaxFactor, X),
        between(X, MaxFactor, Y),
        Product #= X * Y,
        Pair = X-Y,
        palindrome(Product)
    ), Palindromes).

smallest(MinFactor, MaxFactor, Smallest, Factors) :-
    palindrome_products(MinFactor, MaxFactor, Palindromes),
    findall(Product, member(Product-_, Palindromes), Products),
    min_list(Products, Smallest),
    findall(Pair, member(Smallest-Pair, Palindromes), Factors).

largest(MinFactor, MaxFactor, Largest, Factors) :-
    palindrome_products(MinFactor, MaxFactor, Palindromes),
    findall(Product, member(Product-_, Palindromes), Products),
    max_list(Products, Largest),
    findall(Pair, member(Largest-Pair, Palindromes), Factors).
