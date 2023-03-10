"""
    preptime(layers)

Calculate the time needed to prepare using the specified number of layers.

# Examples
```julia-repl
julia> preptime(2)
4
```
"""
preptime(layers) = 2 * layers

"""
    remaining_time(current_time)

Calculate the remaining time the lasagna has to spend in the oven.

# Examples
```julia-repl
julia> remaining_time(13)
47
```
"""
remaining_time(current_time) = 60 - current_time

"""
    total_working_time(layers, current_time)

Calculate the total working time.

# Examples
```julia-repl
julia> total_working_time(3, 10)
16
```
"""
total_working_time(layers, current_time) = preptime(layers) + current_time
