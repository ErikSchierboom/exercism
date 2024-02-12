import Base: +, convert

@enum Heading NORTH = 1 EAST = 2 SOUTH = 3 WEST = 4

DELTAS = Dict(NORTH => (0, 1), EAST => (1, 0), SOUTH => (0, -1), WEST => (-1, 0))
LEFT = circshift(collect(instances(Heading)), 1)
RIGHT = circshift(collect(instances(Heading)), -1)

struct Point
    x::Int
    y::Int
end

mutable struct Robot
    position::Point
    heading::Heading
end

convert(Point, tuple::Tuple{Int,Int}) = Point(tuple[1], tuple[2])
+(point::Point, delta::Tuple{Int,Int}) = Point(point.x + delta[1], point.y + delta[2])

position(robot::Robot) = robot.position
heading(robot::Robot) = robot.heading

function turn_right!(r)
    r.heading = RIGHT[UInt8(r.heading)]
    r
end

function turn_left!(r)
    r.heading = LEFT[UInt8(r.heading)]
    r
end

function advance!(r)
    r.position += DELTAS[r.heading]
    r
end

function move!(r, instructions)
    for instruction in instructions
        if instruction == 'R'
            turn_right!(r)
        elseif instruction == 'L'
            turn_left!(r)
        elseif instruction == 'A'
            advance!(r)
        end
    end
    r
end