function all_your_base(digits, base_in, base_out)
    base_in < 2 && throw(DomainError("Invalid base_in"))
    base_out < 2 && throw(DomainError("Invalid base_out"))

    decimal = 0
    for digit in digits
        digit ∈ 0:base_in-1 || throw(DomainError("Invalid digit"))
        decimal = decimal * base_in + digit
    end

    outdigits = []
    while decimal > 0
        decimal, digit = divrem(decimal, base_out)
        append!(outdigits, digit)
    end

    isempty(outdigits) && append!(outdigits, 0)
    reverse(outdigits)
end
