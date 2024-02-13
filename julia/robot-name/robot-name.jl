import Random: shuffle

names = [l1 * l2 * lpad(n, 3, '0') for l1 in 'A':'Z' for l2 in 'A':'Z' for n in 0:999] |> shuffle

mutable struct Robot
    name::String
end

Robot() = Robot(pop!(names))

reset!(instance::Robot) = instance.name = pop!(names)
name(instance::Robot) = instance.name
