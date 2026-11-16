const OFFSETS = [CartesianIndex(dx, dy) for dx in -1:1 for dy in -1:1 if dx != 0 || dy != 0]

function liveneighbors(matrix, index)
    indices = CartesianIndices(matrix)
    sum(matrix[index+offset] for offset in OFFSETS if index + offset in indices; init=0)
end

function gameoflife(matrix)
    map(CartesianIndices(matrix)) do index
        live = liveneighbors(matrix, index)

        if matrix[index] == 1
            live == 2 || live == 3
        else
            live == 3
        end
    end
end
