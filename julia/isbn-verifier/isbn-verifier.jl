struct ISBN
    digits::AbstractString

    function ISBN(digits)
        digits = replace(digits, "-" => "")
        occursin(r"^\d{9}(\d|X)$", digits) || throw(DomainError("Invalid ISBN"))

        checksum = sum(mul * (digit == 'X' ? 10 : digit - '0') for (mul, digit) in enumerate(Iterators.reverse(digits)))
        iszero(checksum % 11) ? new(digits) : throw(DomainError("Invalid ISBN"))
    end
end
