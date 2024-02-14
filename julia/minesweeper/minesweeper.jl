const NEIGHBORS = filter(pair -> !all(iszero, pair), collect(Iterators.product(-1:1, -1:1)))

function annotate(minefield)
    isempty(minefield) && return minefield

    rows, cols = size(minefield, 1), length(minefield[1])
    mines(x, y) = count(true for (dx, dy) in NEIGHBORS if x + dx ∈ 1:cols && y + dy ∈ 1:rows && ismine(x + dx, y + dy))
    ismine(x, y) = minefield[y][x] == '*'
    annotatecell(x, y) = ismine(x, y) ? '*' : iszero(mines(x, y)) ? ' ' : Char('0' + mines(x, y))

    [join(annotatecell(x, y) for x ∈ 1:cols) for y ∈ 1:rows]
end