is_equilateral(sides) = valid(sides) && allequal(sides)
is_isosceles(sides) = valid(sides) && length(unique(sides)) <= 2
is_scalene(sides) = valid(sides) && allunique(sides)

function valid(sides)
    !all(iszero.(sides)) &&
        sides[1] + sides[2] >= sides[3] &&
        sides[2] + sides[3] >= sides[1] &&
        sides[1] + sides[3] >= sides[2]
end
