const partition = Iterators.partition

encode(input) = join(partition(decode(input), 5), " ")
decode(input) = join(skipmissing(map(decode, input)))

function decode(c::AbstractChar)
    if isletter(c)
        'z' - (lowercase(c) - 'a')
    elseif isdigit(c)
        c
    else
        missing
    end
end

