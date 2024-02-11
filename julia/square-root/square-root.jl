function square_root(n)
    n < 0 && throw(DomainError(n, "Number must be positive"))

    √n
end
