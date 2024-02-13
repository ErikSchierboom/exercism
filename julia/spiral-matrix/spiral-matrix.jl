spiral_matrix(n) = [cell(n, 1, x, y) for y in 1:n, x in 1:n]

function cell(n, offset, x, y)
    y == 1 && return offset + x - 1
    x == 1 && return offset + n * 4 - 3 - y
    x == n && return offset + n + y - 2
    y == n && return offset + n * 3 - 2 - x

    cell(n - 2, offset + n * 4 - 4, x - 1, y - 1)
end
