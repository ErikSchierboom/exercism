function eggcount(number)
    count = 0

    while number
        count += number & 1
        number >>= 1
    end

    count
end
