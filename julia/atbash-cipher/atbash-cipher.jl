const partition = Iterators.partition

encode(input) = join(partition(decode(input), 5), " ")

function decode(input)
    plaintext = ""

    for c in lowercase(input)
        if isletter(c)
            plaintext *= 'z' - (c - 'a')
        elseif isdigit(c)
            plaintext *= c
        end
    end

    plaintext
end

