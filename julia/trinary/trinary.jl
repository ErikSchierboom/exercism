function trinary_to_decimal(str)
    trinary = 0

    for c in str
        c ∈ "012" || return 0
        trinary *= 3
        trinary += c - '0'
    end

    trinary
end
