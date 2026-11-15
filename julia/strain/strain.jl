function keep(values, predicate)
    filtered = []

    for value in values
        if predicate(value)
            push!(filtered, value)
        end
    end

    filtered
end

function discard(values, predicate)
    keep(values, !predicate)
end
