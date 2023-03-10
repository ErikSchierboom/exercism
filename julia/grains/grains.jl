on_square(square) = square ∈ 1:64 ? UInt64(1) << (square - 1) : throw(DomainError("Invalid square"))

total_after(square) = square ∈ 1:64 ? UInt64(1) << square - 1 : throw(DomainError("Invalid square"))
