:- use_module(library(clpfd)).

generate_upper_constraint(_, [], []).
generate_upper_constraint(Max, [Coin|Coins], [Amount|Amounts]) :-
    Amount in 0..Max,
    generate_upper_constraint(Coin, Coins, Amounts).

coins([], [], []).
coins([Coin|Coins], [Amount|Amounts], Change) :-
    length(CoinChange, Amount),
    maplist(=(Coin), CoinChange),
    coins(Coins, Amounts, Rest),
    append(CoinChange, Rest, Change).

fewest_coins(Coins, Target, Change) :-
    Target #>= 0,
    reverse(Coins, ReversedCoins),
    [Coin|_] = ReversedCoins,
    length(Coins, N),
    length(Amounts, N),
    Max #= div(Target, Coin),
    generate_upper_constraint(Max, ReversedCoins, ReversedAmounts),
    reverse(ReversedAmounts, Amounts),
    scalar_product(Coins, Amounts, #=, Target),
    sum(Amounts, #=, TotalCoins),
    labeling([min(TotalCoins)], Amounts),
    coins(Coins, Amounts, Change),
    !.
