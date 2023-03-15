function distance(a, b)
    length(a) == length(b) || throw(ArgumentError("Unequal lengths"))

    count(x ≠ y for (x, y) in zip(a, b))
end
