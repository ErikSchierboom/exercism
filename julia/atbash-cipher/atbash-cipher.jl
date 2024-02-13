const partition = Iterators.partition

encode(input) = join(partition(decode(input), 5), " ")
decode(input) = join(skipmissing(translate(c) for c in input))

function translate(c::AbstractChar)
    isletter(c) && return 'z' - lowercase(c) + 'a'
    isdigit(c) && return c

    missing
end

