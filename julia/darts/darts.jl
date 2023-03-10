function score(x, y)
    distance = hypot(x, y)

    if distance <= 1.0
        10
    elseif distance <= 5.0
        5
    elseif distance <= 10.0
        1
    else
        0
    end
end
