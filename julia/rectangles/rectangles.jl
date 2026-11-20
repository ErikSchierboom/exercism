function rectangles(strings)
    grid = [collect(row) for row in strings]
    at(r, c) = c <= length(grid[r]) ? grid[r][c] : ' '

    horizontal(r, c1, c2) = all(at(r, c) in "+-" for c in c1:c2)
    vertical(c, r1, r2) = all(at(r, c) in "+|" for r in r1:r2)

    corners = [(r, c) for r in eachindex(grid) for c in eachindex(grid[r]) if grid[r][c] == '+']

    count(Iterators.product(corners, corners)) do ((r1, c1), (r2, c2))
        r1 < r2 && c1 < c2 &&
            at(r1, c2) == '+' && at(r2, c1) == '+' &&
            horizontal(r1, c1, c2) && horizontal(r2, c1, c2) &&
            vertical(c1, r1, r2) && vertical(c2, r1, r2)
    end
end
