function eggcount(number)
    count = 0

    while number > 0
        count += number & 1
        number >>= 1
    end

    count
end
