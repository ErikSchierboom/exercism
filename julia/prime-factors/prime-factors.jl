function prime_factors(n)
    factors = []
    factor = 2

    while n > 1
        while n % factor != 0
            factor += factor == 2 ? 1 : 2
        end

        n /= factor
        append!(factors, factor)
    end

    factors
end
