function luhn(input)
    input = replace(input, r"\s" => "")
    all(isdigit, input) && length(input) > 1 || return false
    sum(encode, enumerate(reverse(map(x -> parse(UInt8, x), collect(input))))) % 10 == 0
end

function encode((i, n))
    i % 2 == 0 && (n *= 2)
    n > 9 && (n -= 9)
    n
end
