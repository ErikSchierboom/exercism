function sieve(limit)
    crosses = trues(limit)
    crosses[1] = false

    for n in 2:isqrt(limit)
        if crosses[n]
            crosses[2n:n:limit] .= false
        end
    end

    findall(crosses)
end
