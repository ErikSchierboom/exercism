struct Fib
    n::Int
end

function Base.iterate(F::Fib, state)
    item, prev, prev_prev = state

    item > F.n && return nothing
    item == 1 && return (1, (2, 1, 0))
    item == 2 && return (1, (3, 1, 1))

    next = prev + prev_prev

    return (next, (item + 1, next, prev))
end

Base.iterate(F::Fib) = iterate(F, (1, 0, 0))
Base.length(F::Fib) = F.n
Base.eltype(F::Fib) = Int
