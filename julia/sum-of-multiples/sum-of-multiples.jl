function sum_of_multiples(limit, factors)
    sum(i for i in 1:limit-1 if any(factor != 0 && i % factor == 0 for factor = factors))
end
