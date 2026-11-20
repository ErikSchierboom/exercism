function encode(plaintext, a, b)
    gcd(a, 26) == 1 || throw(ArgumentError("a must be coprime with 26"))

    encoded = [encode(c, a, b) for c in plaintext if isletter(c) || isdigit(c)]
    join(map(join, Iterators.partition(encoded, 5)), " ")
end

encode(c::AbstractChar, a, b) = isdigit(c) ? c : 'a' + mod(a * (lowercase(c) - 'a') + b, 26)

function decode(ciphertext, a, b)
    gcd(a, 26) == 1 || throw(ArgumentError("a must be coprime with 26"))

    a_inv = invmod(a, 26)
    join(decode(c, a_inv, b) for c in ciphertext if !isspace(c))
end

decode(c::AbstractChar, a_inv, b) = isdigit(c) ? c : 'a' + mod(a_inv * (c - 'a' - b), 26)
