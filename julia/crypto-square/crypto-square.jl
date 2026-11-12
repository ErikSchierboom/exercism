sanitize(plaintext) = lowercase(filter(c -> isletter(c) || isdigit(c), plaintext))

function ciphertext(plaintext)
    s = sanitize(plaintext)
    isempty(s) && return ""

    cols = ceil(Int, sqrt(length(s)))
    rows = cld(length(s), cols)

    grid = reshape(collect(rpad(s, cols * rows)), cols, rows)
    join(map(join, eachrow(grid)), " ")
end

