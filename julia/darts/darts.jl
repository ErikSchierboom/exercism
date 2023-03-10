function score(x, y)
    distance = hypot(x, y)
    distance <= 1.0 && return 10
    distance <= 5.0 && return 5
    distance <= 10.0 && return 1
    0
end
