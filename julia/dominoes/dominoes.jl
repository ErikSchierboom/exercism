using Combinatorics

function dominoes(stones)
    isempty(stones) && return true
    length(stones) == 1 && allequal(stones[1]) && return true

    head, tail... = stones
    any(dominoes, filter(!isnothing, map(tailpermutation -> trychain(head, tailpermutation), permutations(tail))))
end

function trychain(stone, stones)
    isempty(stones) && return nothing

    head, tail... = stones
    stone[2] == head[1] && return [[stone[1], head[2]], tail...]
    stone[2] == head[2] && return [[stone[1], head[1]], tail...]

    nothing
end
