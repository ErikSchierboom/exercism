function isperfect(n)
    n > 0 || throw(DomainError(n, "Must be positive"))
    aliquotsum(n) == n
end

function isabundant(n)
    n > 0 || throw(DomainError(n, "Must be positive"))
    aliquotsum(n) > n
end

function isdeficient(n)
    n > 0 || throw(DomainError(n, "Must be positive"))
    aliquotsum(n) < n
end

aliquotsum(n) = sum(factor for factor in 1:n÷2 if iszero(mod(n, factor)))
