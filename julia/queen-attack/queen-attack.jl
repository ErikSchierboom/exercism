struct InvalidPosition <: Exception end

struct Queen
    row::Int
    col::Int
    function Queen(row::Int, col::Int)
        0 <= row <= 7 || throw(InvalidPosition())
        0 <= col <= 7 || throw(InvalidPosition())
        new(row, col)
    end
end

function canattack(white::Queen, black::Queen)
    white.row == black.row || white.col == black.col || abs(white.row - black.row) == abs(white.col - black.col)
end
