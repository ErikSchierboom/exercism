const E::Matrix{Int8} = [
    0 0 1 1 0 0 0 0 0 0 0 0 0 0 1 1 0 0
    0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0
    0 1 0 0 0 1 0 0 0 0 0 0 1 0 0 0 1 0
    0 1 0 0 1 0 1 0 0 0 0 1 0 1 0 0 1 0
    0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0
    1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1
    0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0
    0 1 0 0 0 0 0 1 0 0 1 0 0 0 0 0 1 0
    0 1 0 0 0 0 0 0 1 1 0 0 0 0 0 0 1 0
    0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0
    0 0 1 1 0 0 0 0 0 0 0 0 0 0 1 1 0 0
]

function frown!(E)
    E[7, 7:12], E[9, 7:12] = E[9, 7:12], E[7, 7:12]
    E
end

frown(E) = frown!(copy(E))

rot270(E) = rotl90(E, 1)
rot90 = rotr90

function stickerwall(E)
    vcat(
        hcat(E, zeros(Int8, size(E, 1)), ones(Int8, size(E, 1)), zeros(Int8, size(E, 1)), vcat(frown(E))),
        hcat(zeros(Int8, size(E, 2) + 1)', [1], zeros(Int8, size(E, 2) + 1)'),
        ones(Int8, 2size(E, 2) + 3)',
        hcat(zeros(Int8, size(E, 2) + 1)', [1], zeros(Int8, size(E, 2) + 1)'),
        hcat(vcat(frown(E)), zeros(Int8, size(E, 1)), ones(Int8, size(E, 1)), zeros(Int8, size(E, 1)), E)
    )
end