function prime(num)
    num > 0 || error("Can only find the nth prime for n > 0")

    Iterators.nth(primes(), num)
end

function primes()
    Iterators.flatten(((2, 3), Iterators.filter(isprime, primecandidates())))
end

function primecandidates()
    Iterators.flatten(Iterators.map(n -> (n-1, n+1), Iterators.countfrom(6, 6)))
end

function isprime(num)
    limit = floor(Int, sqrt(num))
    all(x -> num % x != 0, 5:2:limit)
end
