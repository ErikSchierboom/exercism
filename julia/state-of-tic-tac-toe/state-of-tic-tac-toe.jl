using LinearAlgebra

function gamestate(board)
    board = reduce(hcat, collect.(board))

    winners = unique(collect(
        cells[1]
        for cells in (eachrow(board)...,
            eachcol(board)...,
            diag(board),
            diag(reverse(board, dims=2)))
        if all(!isspace, cells) && allequal(cells)))

    length(winners) > 1 && error("Invalid board")

    xs = count(isequal('X'), board)
    os = count(isequal('O'), board)

    abs(xs - os) > 1 && error("Invalid board")
    os > xs && error("Invalid board")

    if length(winners) == 1
        winners[1] == 'X' && os >= xs && error("Invalid board")
        winners[1] == 'O' && xs > os && error("Invalid board")
        "win"
    elseif all(!isspace, board)
        "draw"
    else
        "ongoing"
    end
end
