function collatz_steps(n)
    n < 1 && throw(DomainError("Number must be positive"))

    steps = 0

    while n != 1
        n = iseven(n) ? n ÷ 2 : n * 3 + 1
        steps += 1
    end

    steps
end