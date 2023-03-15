function distance(a, b)
    length(a) == length(b) || throw(ArgumentError("Unequal lengths"))

    length([1 for (x, y) = zip(a, b) if x ≠ y])
end
