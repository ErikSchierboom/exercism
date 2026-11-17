const OFFSETS = [(dx, dy) for dx in -1:1 for dy in -1:1 if dx != 0 || dy != 0]

function annotate(arr)
    if isempty(arr)
        return arr
    end

    width = length(arr[1])
    height = length(arr)
    annotated = copy(arr)

    for y in 1:height
        row = Char[]

        for x in 1:width
            if annotated[y][x] == '*'
                push!(row, '*')
                continue
            end

            neighboringflowers = 0

            for (dx, dy) in OFFSETS
                neighborx = x + dx
                neighbory = y + dy
                if 1 <= neighborx <= width && 1 <= neighbory <= height && arr[neighbory][neighborx] == '*'
                    neighboringflowers += 1
                end
            end

            push!(row, neighboringflowers == 0 ? ' ' : Char('0' + neighboringflowers))
        end
        annotated[y] = join(row)
    end

    annotated
end
