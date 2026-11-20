function twobucket(bucket1, bucket2, goal, start)
    initial = start == 1 ? (bucket1, 0) : (0, bucket2)
    forbidden = start == 1 ? (0, bucket2) : (bucket1, 0)

    queue = [(initial, 1)]
    seen = Set([initial, forbidden])

    while !isempty(queue)
        (a, b), moves = popfirst!(queue)
        a == goal && return (moves, 1, b)
        b == goal && return (moves, 2, a)

        pour12 = min(a, bucket2 - b)
        pour21 = min(b, bucket1 - a)
        for next in ((bucket1, b), (a, bucket2), (0, b), (a, 0),
                     (a - pour12, b + pour12), (a + pour21, b - pour21))
            next in seen && continue
            push!(seen, next)
            push!(queue, (next, moves + 1))
        end
    end

    throw(DomainError(goal, "goal cannot be reached"))
end
