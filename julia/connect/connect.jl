const NEIGHBORS = ((0, -1), (0, 1), (-1, 0), (-1, 1), (1, -1), (1, 0))

function connect(board)
    grid = permutedims(reduce(hcat, [only.(split(row)) for row in board]))
    wins(grid, 'O') && return "O"
    wins(permutedims(grid), 'X') && return "X"
    ""
end

function wins(grid, player)
    rows, cols = size(grid)
    stack = [(1, c) for c in 1:cols if grid[1, c] == player]
    seen = Set(stack)

    while !isempty(stack)
        r, c = pop!(stack)
        r == rows && return true

        for (dr, dc) in NEIGHBORS
            next = (r + dr, c + dc)
            checkbounds(Bool, grid, next...) && grid[next...] == player && next ∉ seen || continue
            push!(seen, next)
            push!(stack, next)
        end
    end

    false
end
