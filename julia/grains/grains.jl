function on_square(square)
    (square < 1 || square > 64) && throw(DomainError(square, "Square must be between 1 and 64"))

    UInt64(2)^(square - 1)
end

function total_after(square)
    (square < 1 || square > 64) && throw(DomainError(square, "Square must be between 1 and 64"))

    2 * on_square(square) - 1
end
