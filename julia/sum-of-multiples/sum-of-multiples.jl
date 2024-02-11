function sum_of_multiples(limit, factors)
    factors = filter(≠(0), factors)
    sum(i for i in 1:limit-1 if any(i % factor == 0 for factor = factors))
end
