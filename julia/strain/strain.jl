function keep(values, predicate)
    filtered = []

    for value in values
        predicate(value) && push!(filtered, value)
    end

    filtered
end

discard(values, predicate) = keep(values, !predicate)
