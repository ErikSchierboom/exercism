:- use_module(library(clpfd)).

discounted_price(1, 800).
discounted_price(2, 1520).
discounted_price(3, 2160).
discounted_price(4, 2560).
discounted_price(5, 3000).

tally([], []) :- !.
tally(Basket, Tally) :- aggregate(set(Book-Count), aggregate(count, member(Book, Basket), Count), Tally).

decrement(Tally, [], Tally) :- !.
decrement(Tally, [Book|Books], UpdatedTally) :-
    select(Book-Count, Tally, TallyWithoutBook),
    NewCount is Count - 1,
    (NewCount =:= 0 ->
        NewTally = TallyWithoutBook; 
        NewTally = [Book-NewCount|TallyWithoutBook]),
    decrement(NewTally, Books, UpdatedTally).

groups([], []).
groups(Tally, [Group|Groups]) :-
    pairs_keys(Tally, Books),
    length(Books, Group),
    decrement(Tally, Books, UpdatedTally),
    groups(UpdatedTally, Groups).

price(Groups, Price) :-
    include(=(5), Groups, Fives), length(Fives, NumFives),
    include(=(3), Groups, Threes), length(Threes, NumThrees),
    maplist(discounted_price, Groups, DiscountedPrices),
    sum_list(DiscountedPrices, DiscountedPrice),
    Price is DiscountedPrice - min(NumFives, NumThrees) * 40.

total(Basket, Price) :-
    tally(Basket, Tally),
    groups(Tally, Groups),
    price(Groups, Price),
    !.
