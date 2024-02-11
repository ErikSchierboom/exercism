triangle(n) = n < 0 ? throw(DomainError(n)) : map(row, 1:n)
row(n) = [binomial(n - 1, i) for i in 0:n-1]
