const TEST_GRAPHEMES = true

using Unicode

function myreverse(s::AbstractString)
    s |> graphemes |> collect |> reverse |> join
end
