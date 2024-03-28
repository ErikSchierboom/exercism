function largest_product(str, span)
    iszero(span) && return 1
    span ∉ 0:length(str) && throw(ArgumentError("span must be in the range 0:length(str)"))
    all(isdigit, str) || throw(ArgumentError("Non-digit character in str"))

    digits = [parse(Int8, c) for c in str]

    best = window = prod(view(digits, 1:span))
    for right in span+1:length(digits)
        left = right - span + 1

        leaving = digits[left-1]
        if leaving ≠ 0
            window = (window ÷ leaving) * digits[right]
        else
            window = prod(view(digits, left:right))
        end

        best = max(best, window)
    end

    best
end