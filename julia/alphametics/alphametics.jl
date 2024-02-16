include("permutations.jl")

function parse(equation)
    mapping = Dict{Char,Int}()
    nonzero = Set{Char}()

    function parseparts(parts, sign)
        for part in split(parts, " + ")
            push!(nonzero, first(part))
            for (i, c) in enumerate(Iterators.reverse(part))
                mapping[c] = get(mapping, c, 0) + sign * 10^(i - 1)
            end
        end
    end

    left, right = map(strip, split(equation, " == "))
    parseparts(left, 1)
    parseparts(right, -1)

    (keys(mapping), values(mapping), map(letter -> letter in nonzero, collect(keys(mapping))))
end

function solve(equation)
    (letters, factors, nonzero) = parse(equation)

    for permutation in permutations(0:9, length(letters))
        if any(iszero(digit) && nonzerodigit for (digit, nonzerodigit) in zip(permutation, nonzero))
            continue
        end

        if iszero(sum(factors .* permutation))
            return Dict(zip(letters, permutation))
        end
    end
end
