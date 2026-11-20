function change(coins, target)
    target >= 0 || throw(DomainError(target, "Target must not be negative"))
    target == 0 && return Int[]

    result = fewest_coins_per_amount(coins, target)[target]
    result === nothing && throw(DomainError(target, "Target cannot be made with given coins"))
    result
end

function most_efficient_change(coins, fewest_coins, amount)
    best = nothing
    for coin in coins
        coin > amount && continue
        rest = coin == amount ? Int[] : fewest_coins[amount-coin]
        rest === nothing && continue
        if best === nothing || length(rest) + 1 < length(best)
            best = [coin; rest]
        end
    end
    best
end

function fewest_coins_per_amount(coins, target)
    foldl(1:target; init=Array{Union{Nothing,Vector{Int}}}(nothing, target)) do fewest_coins, amount
        fewest_coins[amount] = most_efficient_change(coins, fewest_coins, amount)
        fewest_coins
    end
end
